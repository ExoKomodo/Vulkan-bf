#if BF_PLATFORM_WINDOWS
using System;

namespace Vulkan.Win32 
{
	function Result PFN_vkCreateWin32SurfaceKHR(Instance instance, Win32SurfaceCreateInfoKHR* pCreateInfo, AllocationCallbacks* pAllocator, SurfaceKHR* pSurface);

	function Bool32 PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR(PhysicalDevice physicalDevice, uint32 queueFamilyIndex);

	function Result PFN_vkGetMemoryWin32HandleKHR(Device device, MemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle);

	function Result PFN_vkGetMemoryWin32HandlePropertiesKHR(Device device, ExternalMemoryHandleTypeFlags handleType, HANDLE handle, MemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties);

	function Result PFN_vkImportSemaphoreWin32HandleKHR(Device device, ImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo);

	function Result PFN_vkGetSemaphoreWin32HandleKHR(Device device, SemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle);

	function Result PFN_vkImportFenceWin32HandleKHR(Device device, ImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo);

	function Result PFN_vkGetFenceWin32HandleKHR(Device device, FenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle);

	function Result PFN_vkGetMemoryWin32HandleNV(Device device, DeviceMemory memory, ExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle);

	function Result PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT(PhysicalDevice physicalDevice, PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32* pPresentModeCount, PresentModeKHR* pPresentModes);

	function Result PFN_vkAcquireFullScreenExclusiveModeEXT(Device device, SwapchainKHR swapchain);

	function Result PFN_vkReleaseFullScreenExclusiveModeEXT(Device device, SwapchainKHR swapchain);

	function Result PFN_vkGetDeviceGroupSurfacePresentModes2EXT(Device device, PhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, DeviceGroupPresentModeFlagsKHR* pModes);


}
#endif