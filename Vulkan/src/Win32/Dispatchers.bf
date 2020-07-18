#if BF_PLATFORM_WINDOWS
using System;

namespace Vulkan.Win32 
{
	public struct DispatchLoaderStatic 
	{
		public Result vkCreateWin32SurfaceKHR(Instance instance,Win32SurfaceCreateInfoKHR* pCreateInfo,AllocationCallbacks* pAllocator,SurfaceKHR* pSurface) => CreateWin32SurfaceKHR(instance,pCreateInfo,pAllocator,pSurface);
		public Bool32 vkGetPhysicalDeviceWin32PresentationSupportKHR(PhysicalDevice physicalDevice,uint32 queueFamilyIndex) => GetPhysicalDeviceWin32PresentationSupportKHR(physicalDevice,queueFamilyIndex);
		public Result vkGetMemoryWin32HandleKHR(Device device,MemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle) => GetMemoryWin32HandleKHR(device,pGetWin32HandleInfo,pHandle);
		public Result vkGetMemoryWin32HandlePropertiesKHR(Device device,ExternalMemoryHandleTypeFlags handleType,HANDLE handle,MemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties) => GetMemoryWin32HandlePropertiesKHR(device,handleType,handle,pMemoryWin32HandleProperties);
		public Result vkImportSemaphoreWin32HandleKHR(Device device,ImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo) => ImportSemaphoreWin32HandleKHR(device,pImportSemaphoreWin32HandleInfo);
		public Result vkGetSemaphoreWin32HandleKHR(Device device,SemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle) => GetSemaphoreWin32HandleKHR(device,pGetWin32HandleInfo,pHandle);
		public Result vkImportFenceWin32HandleKHR(Device device,ImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo) => ImportFenceWin32HandleKHR(device,pImportFenceWin32HandleInfo);
		public Result vkGetFenceWin32HandleKHR(Device device,FenceGetWin32HandleInfoKHR* pGetWin32HandleInfo,HANDLE* pHandle) => GetFenceWin32HandleKHR(device,pGetWin32HandleInfo,pHandle);
		public Result vkGetMemoryWin32HandleNV(Device device,DeviceMemory memory,ExternalMemoryHandleTypeFlagsNV handleType,HANDLE* pHandle) => GetMemoryWin32HandleNV(device,memory,handleType,pHandle);
		public Result vkGetPhysicalDeviceSurfacePresentModes2EXT(PhysicalDevice physicalDevice,PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo,uint32* pPresentModeCount,PresentModeKHR* pPresentModes) => GetPhysicalDeviceSurfacePresentModes2EXT(physicalDevice,pSurfaceInfo,pPresentModeCount,pPresentModes);
		public Result vkAcquireFullScreenExclusiveModeEXT(Device device,SwapchainKHR swapchain) => AcquireFullScreenExclusiveModeEXT(device,swapchain);
		public Result vkReleaseFullScreenExclusiveModeEXT(Device device,SwapchainKHR swapchain) => ReleaseFullScreenExclusiveModeEXT(device,swapchain);
		public Result vkGetDeviceGroupSurfacePresentModes2EXT(Device device,PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo,DeviceGroupPresentModeFlagsKHR* pModes) => GetDeviceGroupSurfacePresentModes2EXT(device,pSurfaceInfo,pModes);

	}
	public struct DispatchLoaderDynamic 
	{
		public PFN_vkCreateWin32SurfaceKHR vkCreateWin32SurfaceKHR = null;
		public PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR vkGetPhysicalDeviceWin32PresentationSupportKHR = null;
		public PFN_vkGetMemoryWin32HandleKHR vkGetMemoryWin32HandleKHR = null;
		public PFN_vkGetMemoryWin32HandlePropertiesKHR vkGetMemoryWin32HandlePropertiesKHR = null;
		public PFN_vkImportSemaphoreWin32HandleKHR vkImportSemaphoreWin32HandleKHR = null;
		public PFN_vkGetSemaphoreWin32HandleKHR vkGetSemaphoreWin32HandleKHR = null;
		public PFN_vkImportFenceWin32HandleKHR vkImportFenceWin32HandleKHR = null;
		public PFN_vkGetFenceWin32HandleKHR vkGetFenceWin32HandleKHR = null;
		public PFN_vkGetMemoryWin32HandleNV vkGetMemoryWin32HandleNV = null;
		public PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT vkGetPhysicalDeviceSurfacePresentModes2EXT = null;
		public PFN_vkAcquireFullScreenExclusiveModeEXT vkAcquireFullScreenExclusiveModeEXT = null;
		public PFN_vkReleaseFullScreenExclusiveModeEXT vkReleaseFullScreenExclusiveModeEXT = null;
		public PFN_vkGetDeviceGroupSurfacePresentModes2EXT vkGetDeviceGroupSurfacePresentModes2EXT = null;

	}
}
#endif