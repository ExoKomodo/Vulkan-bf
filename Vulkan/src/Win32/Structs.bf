#if BF_PLATFORM_WINDOWS
using System;

namespace Vulkan.Win32 
{
	[CRepr]
	public struct Win32SurfaceCreateInfoKHR 
	{
		public readonly StructureType sType = .Win32SurfaceCreateInfoKHR;
		public void* pNext = null;
		public Win32SurfaceCreateFlagsKHR flags = default;
		public HINSTANCE hinstance = default;
		public HWND hwnd = default;

		public this() {}
		public this(Win32SurfaceCreateFlagsKHR flags_,HINSTANCE hinstance_,HWND hwnd_)
		{
			flags = flags_;
			hinstance = hinstance_;
			hwnd = hwnd_;
		}
	}

	[CRepr]
	public struct ImportMemoryWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ImportMemoryWin32HandleInfoKHR;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleType = default;
		public HANDLE handle = default;
		public char16* name = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleType_,HANDLE handle_,char16* name_)
		{
			handleType = handleType_;
			handle = handle_;
			name = name_;
		}
	}

	[CRepr]
	public struct ExportMemoryWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ExportMemoryWin32HandleInfoKHR;
		public void* pNext = null;
		public SECURITY_ATTRIBUTES* pAttributes = default;
		public int32 dwAccess = default;
		public char16* name = default;

		public this() {}
		public this(SECURITY_ATTRIBUTES* pAttributes_,int32 dwAccess_,char16* name_)
		{
			pAttributes = pAttributes_;
			dwAccess = dwAccess_;
			name = name_;
		}
	}

	[CRepr]
	public struct MemoryWin32HandlePropertiesKHR 
	{
		public readonly StructureType sType = .MemoryWin32HandlePropertiesKHR;
		public void* pNext = null;
		public uint32 memoryTypeBits = default;

		public this() {}
		public this(uint32 memoryTypeBits_)
		{
			memoryTypeBits = memoryTypeBits_;
		}
	}

	[CRepr]
	public struct MemoryGetWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .MemoryGetWin32HandleInfoKHR;
		public void* pNext = null;
		public DeviceMemory memory = default;
		public ExternalMemoryHandleTypeFlags handleType = default;

		public this() {}
		public this(DeviceMemory memory_,ExternalMemoryHandleTypeFlags handleType_)
		{
			memory = memory_;
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct Win32KeyedMutexAcquireReleaseInfoKHR 
	{
		public readonly StructureType sType = .Win32KeyedMutexAcquireReleaseInfoKHR;
		public void* pNext = null;
		public uint32 acquireCount = default;
		public DeviceMemory* pAcquireSyncs = default;
		public uint64* pAcquireKeys = default;
		public uint32* pAcquireTimeouts = default;
		public uint32 releaseCount = default;
		public DeviceMemory* pReleaseSyncs = default;
		public uint64* pReleaseKeys = default;

		public this() {}
		public this(uint32 acquireCount_,DeviceMemory* pAcquireSyncs_,uint64* pAcquireKeys_,uint32* pAcquireTimeouts_,uint32 releaseCount_,DeviceMemory* pReleaseSyncs_,uint64* pReleaseKeys_)
		{
			acquireCount = acquireCount_;
			pAcquireSyncs = pAcquireSyncs_;
			pAcquireKeys = pAcquireKeys_;
			pAcquireTimeouts = pAcquireTimeouts_;
			releaseCount = releaseCount_;
			pReleaseSyncs = pReleaseSyncs_;
			pReleaseKeys = pReleaseKeys_;
		}
	}

	[CRepr]
	public struct ImportSemaphoreWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ImportSemaphoreWin32HandleInfoKHR;
		public void* pNext = null;
		public Semaphore semaphore = default;
		public SemaphoreImportFlags flags = default;
		public ExternalSemaphoreHandleTypeFlags handleType = default;
		public HANDLE handle = default;
		public char16* name = default;

		public this() {}
		public this(Semaphore semaphore_,SemaphoreImportFlags flags_,ExternalSemaphoreHandleTypeFlags handleType_,HANDLE handle_,char16* name_)
		{
			semaphore = semaphore_;
			flags = flags_;
			handleType = handleType_;
			handle = handle_;
			name = name_;
		}
	}

	[CRepr]
	public struct ExportSemaphoreWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ExportSemaphoreWin32HandleInfoKHR;
		public void* pNext = null;
		public SECURITY_ATTRIBUTES* pAttributes = default;
		public int32 dwAccess = default;
		public char16* name = default;

		public this() {}
		public this(SECURITY_ATTRIBUTES* pAttributes_,int32 dwAccess_,char16* name_)
		{
			pAttributes = pAttributes_;
			dwAccess = dwAccess_;
			name = name_;
		}
	}

	[CRepr]
	public struct D3D12FenceSubmitInfoKHR 
	{
		public readonly StructureType sType = .D3D12FenceSubmitInfoKHR;
		public void* pNext = null;
		public uint32 waitSemaphoreValuesCount = default;
		public uint64* pWaitSemaphoreValues = default;
		public uint32 signalSemaphoreValuesCount = default;
		public uint64* pSignalSemaphoreValues = default;

		public this() {}
		public this(uint32 waitSemaphoreValuesCount_,uint64* pWaitSemaphoreValues_,uint32 signalSemaphoreValuesCount_,uint64* pSignalSemaphoreValues_)
		{
			waitSemaphoreValuesCount = waitSemaphoreValuesCount_;
			pWaitSemaphoreValues = pWaitSemaphoreValues_;
			signalSemaphoreValuesCount = signalSemaphoreValuesCount_;
			pSignalSemaphoreValues = pSignalSemaphoreValues_;
		}
	}

	[CRepr]
	public struct SemaphoreGetWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .SemaphoreGetWin32HandleInfoKHR;
		public void* pNext = null;
		public Semaphore semaphore = default;
		public ExternalSemaphoreHandleTypeFlags handleType = default;

		public this() {}
		public this(Semaphore semaphore_,ExternalSemaphoreHandleTypeFlags handleType_)
		{
			semaphore = semaphore_;
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ImportFenceWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ImportFenceWin32HandleInfoKHR;
		public void* pNext = null;
		public Fence fence = default;
		public FenceImportFlags flags = default;
		public ExternalFenceHandleTypeFlags handleType = default;
		public HANDLE handle = default;
		public char16* name = default;

		public this() {}
		public this(Fence fence_,FenceImportFlags flags_,ExternalFenceHandleTypeFlags handleType_,HANDLE handle_,char16* name_)
		{
			fence = fence_;
			flags = flags_;
			handleType = handleType_;
			handle = handle_;
			name = name_;
		}
	}

	[CRepr]
	public struct ExportFenceWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .ExportFenceWin32HandleInfoKHR;
		public void* pNext = null;
		public SECURITY_ATTRIBUTES* pAttributes = default;
		public int32 dwAccess = default;
		public char16* name = default;

		public this() {}
		public this(SECURITY_ATTRIBUTES* pAttributes_,int32 dwAccess_,char16* name_)
		{
			pAttributes = pAttributes_;
			dwAccess = dwAccess_;
			name = name_;
		}
	}

	[CRepr]
	public struct FenceGetWin32HandleInfoKHR 
	{
		public readonly StructureType sType = .FenceGetWin32HandleInfoKHR;
		public void* pNext = null;
		public Fence fence = default;
		public ExternalFenceHandleTypeFlags handleType = default;

		public this() {}
		public this(Fence fence_,ExternalFenceHandleTypeFlags handleType_)
		{
			fence = fence_;
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ImportMemoryWin32HandleInfoNV 
	{
		public readonly StructureType sType = .ImportMemoryWin32HandleInfoNV;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlagsNV handleType = default;
		public HANDLE handle = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlagsNV handleType_,HANDLE handle_)
		{
			handleType = handleType_;
			handle = handle_;
		}
	}

	[CRepr]
	public struct ExportMemoryWin32HandleInfoNV 
	{
		public readonly StructureType sType = .ExportMemoryWin32HandleInfoNV;
		public void* pNext = null;
		public SECURITY_ATTRIBUTES* pAttributes = default;
		public int32 dwAccess = default;

		public this() {}
		public this(SECURITY_ATTRIBUTES* pAttributes_,int32 dwAccess_)
		{
			pAttributes = pAttributes_;
			dwAccess = dwAccess_;
		}
	}

	[CRepr]
	public struct Win32KeyedMutexAcquireReleaseInfoNV 
	{
		public readonly StructureType sType = .Win32KeyedMutexAcquireReleaseInfoNV;
		public void* pNext = null;
		public uint32 acquireCount = default;
		public DeviceMemory* pAcquireSyncs = default;
		public uint64* pAcquireKeys = default;
		public uint32* pAcquireTimeoutMilliseconds = default;
		public uint32 releaseCount = default;
		public DeviceMemory* pReleaseSyncs = default;
		public uint64* pReleaseKeys = default;

		public this() {}
		public this(uint32 acquireCount_,DeviceMemory* pAcquireSyncs_,uint64* pAcquireKeys_,uint32* pAcquireTimeoutMilliseconds_,uint32 releaseCount_,DeviceMemory* pReleaseSyncs_,uint64* pReleaseKeys_)
		{
			acquireCount = acquireCount_;
			pAcquireSyncs = pAcquireSyncs_;
			pAcquireKeys = pAcquireKeys_;
			pAcquireTimeoutMilliseconds = pAcquireTimeoutMilliseconds_;
			releaseCount = releaseCount_;
			pReleaseSyncs = pReleaseSyncs_;
			pReleaseKeys = pReleaseKeys_;
		}
	}

	[CRepr]
	public struct SurfaceFullScreenExclusiveInfoEXT 
	{
		public readonly StructureType sType = .SurfaceFullScreenExclusiveInfoEXT;
		public void* pNext = null;
		public FullScreenExclusiveEXT fullScreenExclusive = default;

		public this() {}
		public this(FullScreenExclusiveEXT fullScreenExclusive_)
		{
			fullScreenExclusive = fullScreenExclusive_;
		}
	}

	[CRepr]
	public struct SurfaceCapabilitiesFullScreenExclusiveEXT 
	{
		public readonly StructureType sType = .SurfaceCapabilitiesFullScreenExclusiveEXT;
		public void* pNext = null;
		public Bool32 fullScreenExclusiveSupported = default;

		public this() {}
		public this(Bool32 fullScreenExclusiveSupported_)
		{
			fullScreenExclusiveSupported = fullScreenExclusiveSupported_;
		}
	}

	[CRepr]
	public struct SurfaceFullScreenExclusiveWin32InfoEXT 
	{
		public readonly StructureType sType = .SurfaceFullScreenExclusiveWin32InfoEXT;
		public void* pNext = null;
		public HMONITOR hmonitor = default;

		public this() {}
		public this(HMONITOR hmonitor_)
		{
			hmonitor = hmonitor_;
		}
	}


}
#endif