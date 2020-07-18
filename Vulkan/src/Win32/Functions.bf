#if BF_PLATFORM_WINDOWS
using System;

namespace Vulkan.Win32 
{
	public static 
	{
		[LinkName("vkCreateWin32SurfaceKHR"), CallingConvention(.Stdcall)]
		public static extern Result CreateWin32SurfaceKHR(Instance instance,Win32SurfaceCreateInfoKHR* pCreateInfo,AllocationCallbacks* pAllocator,SurfaceKHR* pSurface);

		[LinkName("vkGetPhysicalDeviceWin32PresentationSupportKHR"), CallingConvention(.Stdcall)]
		public static extern Bool32 GetPhysicalDeviceWin32PresentationSupportKHR(PhysicalDevice physicalDevice,uint32 queueFamilyIndex);

		[LinkName("vkGetMemoryWin32HandleKHR"), CallingConvention(.Stdcall)]
		public static extern Result GetMemoryWin32HandleKHR(Device device,MemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle);

		[LinkName("vkGetMemoryWin32HandlePropertiesKHR"), CallingConvention(.Stdcall)]
		public static extern Result GetMemoryWin32HandlePropertiesKHR(Device device,ExternalMemoryHandleTypeFlags handleType,HANDLE handle,MemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties);

		[LinkName("vkImportSemaphoreWin32HandleKHR"), CallingConvention(.Stdcall)]
		public static extern Result ImportSemaphoreWin32HandleKHR(Device device,ImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo);

		[LinkName("vkGetSemaphoreWin32HandleKHR"), CallingConvention(.Stdcall)]
		public static extern Result GetSemaphoreWin32HandleKHR(Device device,SemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle);

		[LinkName("vkImportFenceWin32HandleKHR"), CallingConvention(.Stdcall)]
		public static extern Result ImportFenceWin32HandleKHR(Device device,ImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo);

		[LinkName("vkGetFenceWin32HandleKHR"), CallingConvention(.Stdcall)]
		public static extern Result GetFenceWin32HandleKHR(Device device,FenceGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle);

		[LinkName("vkGetMemoryWin32HandleNV"), CallingConvention(.Stdcall)]
		public static extern Result GetMemoryWin32HandleNV(Device device,DeviceMemory memory,ExternalMemoryHandleTypeFlagsNV handleType,HANDLE* pHandle);

		[LinkName("vkGetPhysicalDeviceSurfacePresentModes2EXT"), CallingConvention(.Stdcall)]
		public static extern Result GetPhysicalDeviceSurfacePresentModes2EXT(PhysicalDevice physicalDevice,PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo,uint32* pPresentModeCount,PresentModeKHR* pPresentModes);

		[LinkName("vkAcquireFullScreenExclusiveModeEXT"), CallingConvention(.Stdcall)]
		public static extern Result AcquireFullScreenExclusiveModeEXT(Device device,SwapchainKHR swapchain);

		[LinkName("vkReleaseFullScreenExclusiveModeEXT"), CallingConvention(.Stdcall)]
		public static extern Result ReleaseFullScreenExclusiveModeEXT(Device device,SwapchainKHR swapchain);

		[LinkName("vkGetDeviceGroupSurfacePresentModes2EXT"), CallingConvention(.Stdcall)]
		public static extern Result GetDeviceGroupSurfacePresentModes2EXT(Device device,PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo,DeviceGroupPresentModeFlagsKHR* pModes);


}
}
#endif