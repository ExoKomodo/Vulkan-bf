using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml;

namespace BeefVulkanGenerator
{
    class Program
    {
        const string DefaultNamespace = "vk";

        const string WindowsNamespace = "win32";
        const string MacOSNamespace = "macos";


        static string Namespace;

        static (string, string)[] replaceTypes = new (string, string)[]
        {
            ("char", "char8"),

            ("uint8_t", "uint8"),
            ("int8_t", "int8"),
            ("uint16_t", "uint16"),
            ("int16_t", "int16"),
            ("uint32_t", "uint32"),
            ("int32_t", "int32"),
            ("uint64_t", "uint64"),
            ("int64_t", "int64"),
            ("size_t", "uint"),

            ("const* ", "* "),
            ("const ", " "),

            ("scope", "_scope"),

            // Windows
            ("LPCWSTR", "char16*"),
            ("DWORD", "int32")
        };

        static string CORE_BASE_TYPES = @"
using System;

namespace %NAMESPACE%
{
	typealias Flags = uint32;
	typealias DeviceSize = uint64;
	typealias DeviceAddress = uint64;
	typealias SampleMask = uint32;

	struct Bool32 : uint32
	{
		public this(bool value)
		{
			this = value ? 1 : 0;
		}
		public static implicit operator Bool32(bool value)
		{
			return Bool32(value);
		}
		public static operator bool(Bool32 b)
		{
			return (.)b;
		}
	}

	struct Handle : uint
	{
	}

	struct NonDispatchableHandle : uint64
	{
	}
}
";

        static string CORE_CUSTOM_FUNCTIONS = @"
using System;

namespace %NAMESPACE%
{
	public static
	{
		public static mixin MakeVersion(uint32 major, uint32 minor, uint32 patch)
		{
			(((major) << 22) | ((minor) << 12) | (patch))
		}

		public static Result<Instance, Result> CreateInstance<Dispatch>(ref InstanceCreateInfo createInfo, AllocationCallbacks* pAllocator, Dispatch d) where Dispatch : var
		{
			Instance inst = ?;
			Result result = d.vkCreateInstance(&createInfo, pAllocator, &inst);
			if(result == .Success) return inst;

			return .Err(result);
		}
		public static Result<Instance, Result> CreateInstance(ref InstanceCreateInfo createInfo, AllocationCallbacks* pAllocator) => CreateInstance<DispatchLoaderStatic>(ref createInfo, pAllocator, .());
	}
}
";

        static string WIN32_BASE_TYPES = @"
using System;

namespace %NAMESPACE%
{
	typealias HINSTANCE = Windows.HInstance;
	typealias HWND = Windows.HWnd;
	
	typealias HANDLE = Windows.Handle;
	typealias HMONITOR = void*;

	[CRepr]
	public struct SECURITY_ATTRIBUTES
	{
		public int32 nLength;
		public void* lpSecurityDescriptor;
		public Windows.IntBool bInheritHandle;
	}
}";



        static StringBuilder Buffer = new StringBuilder();

        struct FunctionInfo
        {
            public string name;
            public string returnType;
            public Dictionary<string, string> _params;  // Name => Type
        }

        // Dicitionary containing old type name and new
        static Dictionary<string, string> ExportedTypes = new Dictionary<string, string>();

        static HashSet<string> FunctionPointerTypes = new HashSet<string>();
        static HashSet<string> AvailableFunctions = new HashSet<string>();
        static Dictionary<string, FunctionInfo> Functions = new Dictionary<string, FunctionInfo>();

        static HashSet<string> Structs = new HashSet<string>();

        static HashSet<string> Enums = new HashSet<string>();
        static List<string> Enum_StructureTypeValues = new List<string>();

        enum EResultType
        {
            Unknown,
            Void,
            Result
        }

        public static string TransformEnumName(string name)
        {
            if (name.StartsWith("Vk"))
            {
                name = name.Substring(2);
            }

            //if (name.EndsWith("FlagBits"))
            //{
            //    name = name.Substring(0, name.Length - 8) + "Flags";
            //}
            //else
            {
                name = name.Replace("FlagBits", "Flags");
            }

            return name;
        }

        public static string TransformTypeNameToNew(string oldName)
        {
            if (oldName.StartsWith("Vk")) oldName = oldName.Substring(2);
            oldName = oldName.Replace("FlagBits", "Flags");
            return oldName;
        }

        public static string TransformFunctionName(string oldName)
        {
            if (oldName.StartsWith("vk", StringComparison.InvariantCultureIgnoreCase))
            {
                oldName = oldName.Substring(2);
            }
            return oldName;
        }

        public static string TransformEnumValueName(string valueName, IList<string> prefixList)
        {
            string[] toUppercaseLastParts = new string[]
            {
                "KHR", "EXT", "NV", "AMD", "INTEL", "NVX", "GOOGLE",
                "QCOM",
            };

            var buffer = new StringBuilder(valueName);

            for (int i = prefixList.Count - 1; i >= 0; i--)
            {
                buffer.Replace(prefixList[i], "");
            }

            valueName = buffer.ToString();
            buffer.Clear();
            StringBuilder lastPart = new StringBuilder();
            int partCount = 0;
            char lastChar = '\0';
            foreach (var c in valueName)
            {
                if (c == '_')
                {
                    lastPart.Clear();
                    partCount++;
                }
                else
                {
                    if ((lastChar == '_' || lastChar == '\0') || char.IsDigit(lastChar))
                    {
                        buffer.Append(char.ToUpper(c));
                    }
                    else
                    {
                        buffer.Append(char.ToLower(c));
                    }

                    lastPart.Append(c);
                }

                lastChar = c;
            }

            string lastPartStr = lastPart.ToString();
            if (partCount == 0 || (lastPartStr.Length > 0 && char.IsDigit(lastPartStr[0])))
            {
                goto skip_uppercase;
            }


            foreach (var ulp in toUppercaseLastParts)
            {
                if (string.Compare(ulp, lastPartStr) == 0)
                {
                    buffer.Length -= lastPartStr.Length;
                    buffer.Append(lastPartStr);
                    break;
                }
            }

        skip_uppercase:
            if (buffer.Length > 0 && !char.IsLetter(buffer[0]))
            {
                buffer.Insert(0, 'e');
            }

            return buffer.ToString();
        }

        public static string CreateEnums(string sb)
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");

            var result = Regex.Matches(sb.ToString(), @"typedef enum (\w*) \{([^\}]+)\} (\w*);");
            foreach (Match m in result)
            {
                var name = m.Groups[1].Value;
                var values = m.Groups[2].Value;
                var prefixes = EnumNameToPrefixList(name);

                string underlyingType = name == "VkResult" ? "int32" : "Flags";

                var newName = TransformEnumName(name);
                Enums.Add(name);

                ExportedTypes.Add(name, newName);
                Buffer.Append($"\t[AllowDuplicates]\n\tpublic enum {newName} : {underlyingType} \n\t{{\n");

                var matches = Regex.Matches(values, @"(\w[a-zA-Z0-9_]*)\s*(=)\s+([a-zA-Z0-9_\-]+)");
                HashSet<string> definedValues = new HashSet<string>();
                HashSet<string> newValues = new HashSet<string>();
                foreach (Match v in matches)
                {
                    var valName = v.Groups[1].Value;
                    var valVal = v.Groups[3].Value;
                    definedValues.Add(valName);

                    var newValName = TransformEnumValueName(valName, prefixes);

                    if (newValName.Contains("BeginRange", StringComparison.InvariantCultureIgnoreCase)) continue;
                    if (newValName.Contains("EndRange", StringComparison.InvariantCultureIgnoreCase)) continue;
                    if (newValName.Contains("RangeSize", StringComparison.InvariantCultureIgnoreCase)) continue;
                    if (newValName.Contains("MaxEnum", StringComparison.InvariantCultureIgnoreCase)) continue;

                    if (char.IsLetter(valVal[0]) && definedValues.Contains(valVal))
                    {
                        valVal = TransformEnumValueName(valVal, prefixes);
                    }
                    if (!newValues.Add(newValName))
                    {
                        Console.WriteLine($"Found collision in value name! enum: '{name}' original: {valName} new: '{newName}'");
                        newValName = "eVk" + newValName;
                    }

                    Buffer.Append($"\t\t{newValName} = {valVal},\n");


                    if (name == "VkStructureType")
                    {
                        Enum_StructureTypeValues.Add(newValName);
                    }
                }
                Buffer.Append("\t}\n\n");
            }

            Buffer.Append("\n}");
            return Buffer.ToString();
        }

        public static string CreateHandles(string sb)
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");

            // VK_DEFINE_NON_DISPATCHABLE_HANDLE -> uint64
            // VK_DEFINE_HANDLE -> uint / void*

            //var result = Regex.Matches(sb, @"[^#define]\s(VK_DEFINE_HANDLE|VK_DEFINE_NON_DISPATCHABLE_HANDLE)\((\S+)\)");
            void ForEach(MatchCollection matches, bool isNonDispatch)
            {
                foreach (Match m in matches)
                {
                    var name = m.Groups[2].Value;
                    string underlyingType = isNonDispatch ? "NonDispatchableHandle" : "Handle";
                    //Buffer.Append($"\tpublic struct {name}_T : {underlyingType} {{}}\n");
                    var newName = name.Substring(2);
                    Buffer.Append($"\tpublic struct {newName} : {underlyingType} {{}}\n\n");

                    ExportedTypes.Add(name, newName);
                }
            }
            ForEach(Regex.Matches(sb, @"[^#define]\s(VK_DEFINE_HANDLE)\((\S+)\)"), false);
            ForEach(Regex.Matches(sb, @"[^#define]\s(VK_DEFINE_NON_DISPATCHABLE_HANDLE)\((\S+)\)"), true);

            Buffer.Append("}");
            return Buffer.ToString();
        }

        public static string CreateTypeAliases(string sb)
        {
            Buffer.Clear();
            StringBuilder output = Buffer;
            output.Append($"using System;\n\nnamespace {Namespace} \n{{\n");

            var result = Regex.Matches(sb, @"typedef (\S+) (\w+);");
            foreach (Match r in result)
            {

                var name = r.Groups[2].Value;
                var type = r.Groups[1].Value;

                if (name.StartsWith("Vk")) name = name.Substring(2);
                //name = name.Replace("FlagBits", "Flags");

                if (ExportedTypes.ContainsValue(name) || name == "object")
                {
                    continue;
                }
                if (type.StartsWith("Vk")) type = type.Substring(2);
                type = type.Replace("FlagBits", "Flags");

                output.Append($"\ttypealias {name} = {type};\n");
            }

            output.Append("\n}");
            return output.ToString();
        }

        public static string CreateStructsAndUnions(string sb)
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");

            StringBuilder constructor = new StringBuilder();
            StringBuilder constructorBody = new StringBuilder();

            void ForEach(MatchCollection result, bool isUnion)
            {
                string header = "\t[CRepr]";
                if (isUnion) header = "\t[CRepr, Union]";
                foreach (Match m in result)
                {
                    constructor.Clear();
                    constructorBody.Clear();

                    if (!isUnion)
                    {
                        constructor.Append("\t\tpublic this(");
                    }
                    

                    var name = m.Groups[1].Value;
                    var fieldsStr = m.Groups[2].Value;

                    if (name.StartsWith("Vk"))
                    {
                        name = name.Substring(2);
                    }

                    if (name == "AccelerationStructureInstanceKHR")
                    {
                        Buffer.Append($"\t[CRepr, Obsolete(\"Couldn't generate Beef representation for this type.\", false)]\n\tpublic struct {name} \n\t{{ \n\t/*{fieldsStr}*/ }}\n\n");
                        continue;
                    }

                    fieldsStr = fieldsStr.Replace("* *", "**");
                    fieldsStr = Regex.Replace(fieldsStr, @"(\w[A-z0-9_]*)\s+(\w[a-zA-Z0-9_]*)\w*((\[[\w\d]+\])+)", "$1$3 $2");   // Switch array square backets

                    fieldsStr = Regex.Replace(fieldsStr, @"struct (\w\S+)", "$1");


                    //fields = Regex.Replace(fields, @"(\w.+);", "public $&");

                    Buffer.Append($"{header}\n\tpublic struct {name} \n\t{{\n");

                    Structs.Add(name);

                    var fieldMatches = Regex.Matches(fieldsStr, @"(\w[a-zA-Z0-9_*\[\]]*)\s+(\w[a-zA-Z0-9_]*);");
                    foreach (Match fm in fieldMatches)
                    {
                        if (!fm.Success) continue;

                        var fieldName = fm.Groups[2].Value;
                        var fieldType = fm.Groups[1].Value;

                        Buffer.Append("\t\t");

                        if (fieldType.StartsWith("Vk"))
                        {
                            fieldType = fieldType.Substring(2);
                        }

                        if (fieldName == "sType")
                        {
                            string type = null;
                            foreach (var est in Enum_StructureTypeValues)
                            {
                                if (string.Compare(est, name, StringComparison.InvariantCultureIgnoreCase) == 0)
                                {
                                    type = est;
                                    break;
                                }
                            }
                            if (!string.IsNullOrEmpty(type))
                            {
                                Buffer.Append($"public readonly {fieldType} {fieldName} = .{type};\n");
                                continue;
                            }
                        }
                        if (fieldName == "pNext")
                        {
                            Buffer.Append($"public {fieldType} {fieldName} = null;\n");
                            continue;
                        }

                        fieldType = fieldType.Replace("FlagBits", "Flags");

                        if(isUnion)
                        {
                            Buffer.Append($"public {fieldType} {fieldName};\n");
                            constructor.Append($"\t\tpublic this({fieldType} _{fieldName}) {{ {fieldName} = _{fieldName}; }}\n");

                        }
                        else
                        {
                            Buffer.Append($"public {fieldType} {fieldName} = default;\n");

                            // This is for array types which have size defined by a constant
                            // somehow Beef can't find the identifier without the namespace
                            // Only happens if the types is used as an argument.
                            fieldType = Regex.Replace(fieldType, @"\[([A-Z_][a-zA-Z0-9_]+)\]", $"[{Namespace}.$1]");
                            constructor.Append($"{fieldType} {fieldName}_,");
                            constructorBody.Append($"\t\t\t{fieldName} = {fieldName}_;\n");
                        }
                        
                    }

                    if(isUnion)
                    {
                        Buffer.Append("\n\t\tpublic this() { this = default; }\n");
                        Buffer.Append(constructor);
                    }
                    else
                    {
                        Buffer.Append("\n\t\tpublic this() {}\n");
                        if (constructorBody.Length > 0)
                        {
                            constructor.Length--;
                            constructor.Append(")\n\t\t{\n");
                            constructor.Append(constructorBody);
                            constructor.Append("\t\t}\n");

                            Buffer.Append(constructor);
                        }
                    }
                    



                    Buffer.Append("\t}\n\n");


                }
            }
            ForEach(Regex.Matches(sb, @"typedef struct (\w*) \{([^\}]+)\} (\w*);"), false);
            ForEach(Regex.Matches(sb, @"typedef union (\w*) \{([^\}]+)\} (\w*);"), true);

            Buffer.Append("\n}");
            return Buffer.ToString();
        }

        public static string CreateConstants(string sb)
        {
            Buffer.Clear();

            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");
            Buffer.Append("\tpublic static \n\t{\n");
            var matches = Regex.Matches(sb, @"#define (\w\S+) ([^\n]+)");
            foreach (Match m in matches)
            {

                var name = m.Groups[1].Value;
                var value = m.Groups[2].Value.Trim();
                var type = "let";
                if (name.Contains('(') || name.EndsWith("_H_"))
                {
                    Console.WriteLine("Skipping define: " + name);
                    continue;
                }


                value = value.Replace("ULL", "UL");
                if (value[0] == '"') type = "String";
                if (char.IsDigit(value[0]))
                {
                    if (value[value.Length - 1] == 'f')
                        type = "float";
                    else
                        type = "uint32";
                }
                if (value[0] == '(')
                {
                    if (value[1] == '~' || char.IsDigit(value[1]))
                    {
                        if (value.Contains("UL")) type = "uint64";
                        else type = "uint32";
                    }
                }

                if (value.StartsWith("VK_MAKE_VERSION"))
                {
                    value = Regex.Replace(value, @"VK_MAKE_VERSION\(([\d\w]+),\s*([\d\w]+),\s([\d\w]+)\)", "MakeVersion!($1, $2, $3)");
                    type = "uint32";
                }

                var commentIndex = value.IndexOf("//");
                if (commentIndex >= 0)
                {
                    value = value.Substring(0, commentIndex);
                }
                value = value.Trim();
                if(type == "uint32")
                {
                    value = value.Replace("U", ""); // The U in some contants causes weird type mismatch so we just remove it.
                }

                Buffer.Append($"\t\tconst {type} {name} = {value};\n");
            }
            Buffer.Append("\t}");
            Buffer.Append("\n}");
            return Buffer.ToString();
        }

        public static Dictionary<string, string> ParseParams(string input)
        {
            var dict = new Dictionary<string, string>();

            // (\w[a-zA-Z0-9_*]*)\s+(\w[a-zA-Z0-9_]*)
            var matches = Regex.Matches(input, @"(\w[a-zA-Z0-9_*\[\]]*)\s+(\w[a-zA-Z0-9_]*)");
            foreach (Match m in matches)
            {
                string type = m.Groups[1].Value;
                string name = m.Groups[2].Value;
                dict.Add(name, type);
            }

            return dict;
        }

        public static string CreateFunctionPointerTypes(string sb)
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");

            var matches = Regex.Matches(sb, @"typedef (\S+) \(VKAPI_PTR \*(PFN_\w+)\)\(([^)]*)\);");
            foreach (Match m in matches)
            {

                var resultType = m.Groups[1].Value;
                var name = m.Groups[2].Value;
                var param = m.Groups[3].Value;

                Dictionary<string, string> Params = null;

                if (param == "void")
                {
                    param = string.Empty;
                }
                else
                {
                    Params = ParseParams(param);
                }
                if (resultType.StartsWith("Vk"))
                {
                    resultType = resultType.Substring(2);
                }

                FunctionPointerTypes.Add(name);

                Dictionary<string, string> funcParams = new Dictionary<string, string>();

                Buffer.Append($"\tfunction {resultType} {name}(");
                if (Params != null && Params.Count > 0)
                {
                    foreach (var p in Params)
                    {
                        var pType = p.Value;
                        pType = pType.Replace("FlagBits", "Flags");

                        if (pType.StartsWith("Vk"))
                        {
                            pType = (pType.AsSpan().Slice(2)).ToString();
                        }

                        Buffer.Append(pType);
                        funcParams.Add(p.Key, pType);

                        Buffer.Append(' ');
                        Buffer.Append(p.Key);
                        Buffer.Append(", ");
                    }
                    Buffer.Length -= 2;
                }

                var fnName = name.Substring(4);
                Functions.Add(fnName, new FunctionInfo()
                {
                    name = fnName,
                    returnType = resultType,
                    _params = funcParams
                });

                Buffer.Append(");\n\n");
            }
            Buffer.Append("\n}");
            return Buffer.ToString();

        }

        public static string CreateExportedFunctions(string sb)
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");
            Buffer.Append("\tpublic static \n\t{\n");

            var matches = Regex.Matches(sb, @"VKAPI_ATTR (\S+) VKAPI_CALL ([^(]+)\(([^)]+)\);");
            StringBuilder paramsBuilder = new StringBuilder();
            foreach (Match m in matches)
            {
                paramsBuilder.Clear();
                var resultType = TransformTypeNameToNew(m.Groups[1].Value);
                var name = m.Groups[2].Value;
                var param = m.Groups[3].Value;
                param = Regex.Replace(param, @"(\w[A-z0-9_]*)\s+(\w[a-zA-Z0-9_]*)\w*((\[[\w\d]+\])+)", "$1$3 $2");   // Switch array square brackets

                Dictionary<string, string> funcParams;
                if (Functions.TryGetValue(name, out var funcInfo))
                {
                    funcParams = funcInfo._params;
                }
                else
                {
                    funcParams = ParseParams(param);
                }

                if (funcParams != null && funcParams.Count > 0)
                {
                    foreach (var fp in funcParams)
                    {
                        string pType = TransformTypeNameToNew(fp.Value);
                        paramsBuilder.Append($"{pType} {fp.Key},");
                    }
                    paramsBuilder.Length--;
                }


                AvailableFunctions.Add(name);

                var newName = name; // TransformFunctionName(name);


                var func = $"{resultType} {newName}({paramsBuilder})";
                Buffer.Append($"\t\t[CLink, CallingConvention(.Stdcall)]\n\t\tpublic static extern {func};\n\n");
                //Buffer.Append($"\t\t[CallingConvention(.Stdcall)]\n\t\tpublic static extern {func};\n\n");

            }
            Buffer.Append("\n}");
            Buffer.Append("\n}");
            return Buffer.ToString();
        }

        public static string CreateDispatchers()
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {Namespace} \n{{\n");
            {   // Static
                Buffer.Append("\tpublic struct DispatchLoaderStatic \n\t{\n");
                StringBuilder paramsBuilder = new StringBuilder();
                StringBuilder argsBuilder = new StringBuilder();
                foreach (var fn in Functions)
                {
                    if (!AvailableFunctions.Contains(fn.Key))
                    {
                        Console.WriteLine($"Function type 'PFN_{fn.Key}' doesn't seem to have linkable target. skipping...");
                        continue;
                    }

                    paramsBuilder.Clear();
                    argsBuilder.Clear();
                    var fnName = fn.Key;
                    var fnRetType = TransformTypeNameToNew(fn.Value.returnType);
                    var fnParams = fn.Value._params;

                    foreach (var p in fnParams)
                    {
                        argsBuilder.Append(p.Key);
                        argsBuilder.Append(',');

                        paramsBuilder.Append($"{p.Value} {p.Key},");
                    }
                    paramsBuilder.Length--;
                    argsBuilder.Length--;

                    Buffer.Append($"\t\tpublic {fnRetType} {fnName}({paramsBuilder}) => {Namespace}.{fnName}({argsBuilder});\n");
                }

                Buffer.Append("\n\t}\n");
            }

            {   // Dynamic
                Buffer.Append("\tpublic struct DispatchLoaderDynamic \n\t{\n");
                foreach (var fn in Functions)
                {
                    if (!AvailableFunctions.Contains(fn.Key))
                    {
                        continue;
                    }

                    var fnName = fn.Key;
                    var fieldName = TransformTypeNameToNew(fnName);

                    Buffer.Append($"\t\tpublic PFN_{fnName} {fieldName} = null;\n");

                }
                Buffer.Append("\n\t}\n");
            }
            Buffer.Append("}");

            return Buffer.ToString();
        }

        public static string CreateHandleWrappers()
        {
            Buffer.Clear();
            Buffer.Append($"using System;\n\nnamespace {DefaultNamespace}\n{{\n");
            bool isDefaultNamespace = DefaultNamespace == Namespace;


            string defaultDispatchLoader = "DispatchLoaderStatic";
            if (!isDefaultNamespace)
            {
                Buffer.Append($"\tusing {Namespace};\n");
                defaultDispatchLoader = $"{Namespace}.{defaultDispatchLoader}";
            }
            Dictionary<string, List<FunctionInfo>> firstArgs = new Dictionary<string, List<FunctionInfo>>();
            HashSet<string> lastArgs = new HashSet<string>();
            HashSet<string> arrayFunction = new HashSet<string>();
            //Dictionary<string, List<FunctionInfo>> lastArgs = new Dictionary<string, List<FunctionInfo>>();
            //Dictionary<string, List<FunctionInfo>> arrayFunction = new Dictionary<string, List<FunctionInfo>>();
            foreach (var f in Functions)
            {
                if (!AvailableFunctions.Contains(f.Key)) continue;

                var _params = f.Value._params;
                var firstParam = _params.First().Value;
                if (firstParam.EndsWith('*')) continue;

                List<FunctionInfo> fi;
                if (!firstArgs.TryGetValue(firstParam, out fi))
                {
                    firstArgs[firstParam] = fi = new List<FunctionInfo>();
                }
                fi.Add(f.Value);

                var lastParam = _params.Last().Value;
                if (lastParam == "AllocationCallbacks*" || lastParam == "void*" || lastParam == firstParam || !lastParam.EndsWith('*')) continue;

                // @TODO - check if there is uint32* param with name containing Count and skip these functions

                if (_params.Count >= 2)
                {
                    var preLastParam = _params.ElementAt(_params.Count - 2);
                    if (preLastParam.Key.EndsWith("Count") && string.Compare(preLastParam.Value, "uint32*") == 0)
                    {

                        arrayFunction.Add(f.Key);
                        continue;
                    }
                }

                lastArgs.Add(f.Key);
            }

            StringBuilder paramBuilder = new StringBuilder();
            StringBuilder callBuilder = new StringBuilder();

            string CreateFunctionWithStaticLoader<ParamT, CallT>(string resultType, string fnName, ParamT _params, CallT callArgs, bool mixin = false)
            {
                if (mixin)
                    return $"\t\tpublic mixin {fnName}({_params}) => {fnName}!({callArgs}{defaultDispatchLoader}());\n";

                return $"\t\tpublic {resultType} {fnName}({_params}) => {fnName}<{defaultDispatchLoader}>({callArgs}.());\n";
            }

            foreach (var handle in firstArgs)
            {
                Buffer.Append($"\textension {handle.Key}\n\t{{\n");

                foreach (var f in handle.Value)
                {
                    paramBuilder.Clear();
                    callBuilder.Clear();

                    var fnName = TransformFunctionName(f.name);
                    fnName = fnName.Replace(handle.Key, "");
                    //if (fnName.StartsWith(handle.Key)) fnName = fnName.Substring(handle.Key.Length);
                    //if (fnName.EndsWith(handle.Key)) fnName = fnName.Substring(0, fnName.Length - handle.Key.Length);

                    callBuilder.Append("this,");
                    foreach (var p in f._params.Skip(1))
                    {
                        paramBuilder.Append($"{p.Value} {p.Key},");
                        callBuilder.Append($"{p.Key},");
                    }

                    callBuilder.Length--;

                    Buffer.Append($"\t\tpublic {f.returnType} {fnName}<Dispatch>({paramBuilder} Dispatch d) where Dispatch : var; => d.{f.name}({callBuilder});\n");


                    if (callBuilder.Length > 4) callBuilder.Remove(0, 5);
                    else callBuilder.Remove(0, 4);

                    if (callBuilder.Length > 0)
                    {
                        callBuilder.Append(',');
                    }

                    if (paramBuilder.Length > 0) paramBuilder.Length--;

                    //Buffer.Append($"\t\tpublic {f.returnType} {fnName}({paramBuilder}) => {fnName}<DispatchLoaderStatic>({callBuilder}.());\n");
                    Buffer.Append(CreateFunctionWithStaticLoader(f.returnType, fnName, paramBuilder, callBuilder));

                    EResultType fnResultType = EResultType.Unknown;
                    if (f.returnType == "Result") fnResultType = EResultType.Result;
                    else if (f.returnType == "void") fnResultType = EResultType.Void;

                    if (lastArgs.Contains(f.name))
                    {
                        if (f.name.Contains("Create") || f.name.Contains("Get") /*|| f.name.Contains("Allocate")*/)
                        {
                            var lastParam = f._params.Last();
                            if (fnResultType != EResultType.Unknown)
                            {
                                string lastParamType = lastParam.Value.Substring(0, lastParam.Value.Length - 1);
                                string resultType = fnResultType == EResultType.Result ? $"Result<{lastParamType}, {DefaultNamespace}.Result>" : lastParamType;
                                paramBuilder.Length -= (lastParam.Key.Length + lastParamType.Length + 2);
                                callBuilder.Length -= (lastParam.Key.Length + 1);
                                Buffer.Append($"\t\tpublic {resultType} {fnName}<Dispatch>({paramBuilder} Dispatch d) where Dispatch : var\n\t\t{{\n");
                                Buffer.Append($"\t\t\t{lastParamType} _ret_val = ?;\n");
                                if (fnResultType == EResultType.Result)
                                {
                                    Buffer.Append($"\t\t\tlet result = {fnName}({callBuilder} &_ret_val, d);\n");
                                    Buffer.Append("\t\t\tif(result != .Success) return .Err(result);\n");
                                }
                                else
                                {
                                    Buffer.Append($"\t\t\t{fnName}({callBuilder} &_ret_val, d);\n");
                                }

                                Buffer.Append($"\t\t\treturn _ret_val;\n");
                                Buffer.Append("\t\t}\n");

                                if (paramBuilder.Length > 0) paramBuilder.Length--;
                                Buffer.Append(CreateFunctionWithStaticLoader(resultType, fnName, paramBuilder, callBuilder));
                            }


                        }
                        else
                        {
                            Console.WriteLine($"Skipping {f.name} not containing Get|Create");
                        }
                    }


                    if (arrayFunction.Contains(f.name)) // Functions returning arrays
                    {
                        var lastParam = f._params.Last();
                        var preLastParam = f._params.ElementAt(f._params.Count - 2);

                        if (fnResultType != EResultType.Unknown) // @TODO - can't propertly overload mixins :(
                        {
                            string lastParamType = lastParam.Value.Substring(0, lastParam.Value.Length - 1);
                            string resultType = fnResultType == EResultType.Result ? $"Result<{lastParamType}[], {DefaultNamespace}.Result>" : $"{lastParamType}";

                            // Remove last param
                            paramBuilder.Length -= (lastParam.Key.Length + lastParamType.Length + 2);
                            callBuilder.Length -= (lastParam.Key.Length + 1);

                            paramBuilder.Length -= (preLastParam.Key.Length + preLastParam.Value.Length + 2);
                            callBuilder.Length -= (preLastParam.Key.Length + 1);

                            if (paramBuilder.Length > 0) paramBuilder.Length--;

                            const string k_Allocator = "scope::";   // Should be scoped allocator (new:ScopedAllocator!) :( can't use mixin inside mixin

                            //Buffer.Append($"\t\tpublic mixin {fnName}<Dispatch>({paramBuilder} Dispatch d) where Dispatch : var\n\t\t{{\n");
                            Buffer.Append($"\t\tpublic mixin {fnName}({paramBuilder})\n\t\t{{\n");
                            //Buffer.Append($"\t\t\tlet d = DispatchLoaderStatic();\n");
                            Buffer.Append($"\t\t\tuint32 count = 0;\n");
                            Buffer.Append($"\t\t\t{fnName}({callBuilder} &count, null);\n");
                            Buffer.Append($"\t\t\t{lastParamType}[] values = {k_Allocator} .[count];\n");
                            if (fnResultType == EResultType.Result)
                            {
                                Buffer.Append($"\t\t\tlet result = {fnName}({callBuilder} &count, values.CArray());\n");
                                Buffer.Append($"\t\t\tif(result != .Success) {resultType}.Err(result);\n");
                                Buffer.Append($"\t\t\t{resultType}.Ok(values)\n");
                            }
                            else
                            {
                                Buffer.Append($"\t\t\t{fnName}({callBuilder} &count, values.CArray());\n");
                                Buffer.Append("\t\t\tvalues\n");
                            }

                            Buffer.Append("\t\t}\n");

                            //if (paramBuilder.Length > 0) paramBuilder.Length--;
                            //Buffer.Append(CreateFunctionWithStaticLoader(null, fnName, paramBuilder, callBuilder, true));

                        }

                    }
                }

                Buffer.Append("\t}\n");
            }

            Buffer.Append("}");

            return Buffer.ToString();
        }

        static bool GetNextIfAvailable(string[] args, int i, ref string result)
        {
            i++;

            if (i < args.Length)
            {
                result = args[i];
                return true;
            }

            return false;
        }

        static IList<string> EnumNameToPrefixList(string input)
        {
            var buffer = new StringBuilder();

            List<string> tokens = new List<string>();

            bool wasLower = false;
            foreach (var c in input)
            {
                if (char.IsUpper(c) && wasLower)
                {
                    buffer.Append('_');
                    tokens.Add(buffer.ToString());
                    wasLower = false;
                }
                else
                {
                    wasLower = true;
                }

                buffer.Append(char.ToUpper(c));
            }
            tokens.Add(buffer.ToString());
            return tokens;
        }


        static async Task GenerateFromFile(string filePath, string outputDirectory, string subNamespace = null, string basicTypes = null)
        {
            if (string.IsNullOrEmpty(subNamespace))
            {
                Namespace = DefaultNamespace;
            }
            else
            {
                Namespace = $"{DefaultNamespace}.{subNamespace}";
            }

            Functions.Clear();
            AvailableFunctions.Clear();

            string file;
            try
            {
                file = await File.ReadAllTextAsync(filePath);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                return;
            }
            StringBuilder sb = new StringBuilder(file);
            foreach (var rt in replaceTypes)
            {
                sb.Replace(rt.Item1, rt.Item2);
            }
            var replaced = sb.ToString();

            var enums = CreateEnums(replaced);
            var handles = CreateHandles(replaced);
            var typealiases = CreateTypeAliases(replaced);  // Needed for flags which are not enum
            var defines = CreateConstants(replaced);
            var structs = CreateStructsAndUnions(replaced);

            var fnPointerTypes = CreateFunctionPointerTypes(replaced);
            var exportedFunctions = CreateExportedFunctions(replaced);

            var dispatchers = CreateDispatchers();
            var handleWrappers = CreateHandleWrappers();

            // Write all to files

            Directory.CreateDirectory(outputDirectory);

            if (!string.IsNullOrEmpty(basicTypes))
            {
                File.WriteAllText(Path.Combine(outputDirectory, "BasicTypes.bf"), basicTypes.Replace("%NAMESPACE%", Namespace));
            }

            if (string.IsNullOrEmpty(subNamespace))
            {
                File.WriteAllText(Path.Combine(outputDirectory, "CustomFunctions.bf"), CORE_CUSTOM_FUNCTIONS.Replace("%NAMESPACE%", Namespace));
            }

            File.WriteAllText(Path.Combine(outputDirectory, "Enums.bf"), enums);
            File.WriteAllText(Path.Combine(outputDirectory, "Handles.bf"), handles);
            File.WriteAllText(Path.Combine(outputDirectory, "TypeAliases.bf"), typealiases);
            File.WriteAllText(Path.Combine(outputDirectory, "Constants.bf"), defines);
            File.WriteAllText(Path.Combine(outputDirectory, "Structs.bf"), structs);
            File.WriteAllText(Path.Combine(outputDirectory, "FunctionPointerTypes.bf"), fnPointerTypes);
            File.WriteAllText(Path.Combine(outputDirectory, "Functions.bf"), exportedFunctions);

            File.WriteAllText(Path.Combine(outputDirectory, "Dispatchers.bf"), dispatchers);
            File.WriteAllText(Path.Combine(outputDirectory, "HandleExtensions.bf"), handleWrappers);

        }

        static bool TryGetVulkanPath(out string path)
        {
            string[] EnvVars = { "VULKAN_SDK", "VK_SDK_PATH" };

            foreach (var env in EnvVars)
            {
                path = Environment.GetEnvironmentVariable(env);
                if (!string.IsNullOrEmpty(path))
                {
                    path = Path.Combine(path, "Include/vulkan");
                    if (Directory.Exists(path))
                    {
                        return true;
                    }

                }
            }

            path = null;
            return false;
        }

        /**
         
         */



        static async Task Main(string[] args)
        {
            string inputDirectory;
            if (args.Length == 0)
            {
                if (!TryGetVulkanPath(out inputDirectory))
                {
                    Debug.WriteLine("Couldn't get path to Vulkan include directory! Please specify path as first parameter.");
                    return;
                }
            }
            else
            {
                inputDirectory = args[0];
            }
            string outputDirectory = "./Generated";

            for (int i = 0; i < args.Length; i++)
            {
                if (string.Compare(args[i], "--output") == 0)
                {
                    GetNextIfAvailable(args, i, ref outputDirectory);
                }

            }

            
            ExportedTypes.Add("VkFlags", "Flags");
            ExportedTypes.Add("VkBool32", "Bool32");
            ExportedTypes.Add("VkDeviceSize", "DeviceSize");
            ExportedTypes.Add("VkDeviceAddress", "DeviceAddress");
            ExportedTypes.Add("VkSampleMask", "SampleMask");

            await GenerateFromFile(Path.Combine(inputDirectory, "vulkan_core.h"), outputDirectory, null, CORE_BASE_TYPES);

            await GenerateFromFile(Path.Combine(inputDirectory, "vulkan_win32.h"), outputDirectory + "/win32/", WindowsNamespace, WIN32_BASE_TYPES);

            await GenerateFromFile(Path.Combine(inputDirectory, "vulkan_macos.h"), outputDirectory + "/macos/", MacOSNamespace, null);

        }
    }
}
