#if BF_PLATFORM_WINDOWS
using System;

namespace Vulkan.Win32 
{
	[AllowDuplicates]
	public enum FullScreenExclusiveEXT : Flags 
	{
		DefaultEXT = 0,
		AllowedEXT = 1,
		DisallowedEXT = 2,
		ApplicationControlledEXT = 3,
	}


}
#endif