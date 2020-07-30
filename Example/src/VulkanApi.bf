using System;
using System.Collections;
using SDL2;
using Vulkan;
#if BF_PLATFORM_WINDOWS
using Vulkan.Win32;
#endif
using System.IO;
using Example.Util;

namespace Example
{
	public class VulkanApi
	{
#region Public

#region Constructors
		public this()
		{
			char8* validationLayer = "VK_LAYER_KHRONOS_validation";

			_validationLayers = new List<char8*>();
			_validationLayers.Add(validationLayer);

			_requiredExtensionNames = new List<char8*>();
			char8* swapchainExtension = VK_KHR_SWAPCHAIN_EXTENSION_NAME;
			_requiredExtensionNames.Add(swapchainExtension);

			_dynamicStates = new List<DynamicState>();
			_dynamicStates.Add(DynamicState.Viewport);
			_dynamicStates.Add(DynamicState.LineWidth);

			_waitStages = new List<PipelineStageFlags>();
			_waitStages.Add(PipelineStageFlags.ColorAttachmentOutputBit);

			_commandBuffers = new List<CommandBuffer>();
			_descriptorSets = new List<DescriptorSet>();
			_imageAvailableSemaphores = new List<Semaphore>();
			_imagesInFlight = new List<Fence>();
			_inFlightFences = new List<Fence>();
			_renderFinishedSemaphores = new List<Semaphore>();
			_signalSemaphores = new List<List<Semaphore>>();
			_swapchainFrameBuffers = new List<Framebuffer>();
			_swapchainImageViews = new List<ImageView>();
			_swapchainImages = new List<Vulkan.Image>();
			_swapchains = new List<SwapchainKHR>();
			_swapchainSupportDetails = new SwapchainSupportDetails();
			_uniformBufferMemories = new List<DeviceMemory>();
			_uniformBuffers = new List<Vulkan.Buffer>();
			_waitSemaphores = new List<List<Semaphore>>();

			for (var i = 0; i < MAX_FRAMES_IN_FLIGHT; ++i)
			{
				_imageAvailableSemaphores.Add(Semaphore());
				_inFlightFences.Add(Fence());
				_renderFinishedSemaphores.Add(Semaphore());
				_signalSemaphores.Add(new List<Semaphore>());
				_waitSemaphores.Add(new List<Semaphore>());
			}

			// Vertices have to be in clockwise order
			_vertices = new List<Vertex>();
			_vertices.Add(
				Vertex(Vector2(-0.5f, -0.5f), Vector3(1f, 0f, 0f))
			);
			_vertices.Add(
				Vertex(Vector2(0.5f, -0.5f), Vector3(0f, 1f, 0f))
			);
			_vertices.Add(
				Vertex(Vector2(0.5f, 0.5f), Vector3(0f, 0f, 1f))
			);
			_vertices.Add(
				Vertex(Vector2(-0.5f, 0.5f), Vector3(1f, 1f, 1f))
			);

			_indices = new List<uint16>();
			_indices.Add(0);
			_indices.Add(1);
			_indices.Add(2);
			_indices.Add(2);
			_indices.Add(3);
			_indices.Add(0);

			_uniformBufferObject = UniformBufferObject(
				Matrix(
					Vector4(0f, 0f, 0f, 0f),
					Vector4(0f, 0f, 0f, 0f),
					Vector4(0f, 0f, 0f, 0f),
					Vector4(0f, 0f, 0f, 0f)
				),
				Matrix(),
				Matrix()
			);
		}
#endregion

#region Member Methods
		public Result<void> Blit()
		{
			uint32 imageIndex = 0;
			vkWaitForFences(_logicalDevice, 1, &_inFlightFences[_currentFrame], Bool32(true), uint64.MaxValue);
			
			var result = vkAcquireNextImageKHR(_logicalDevice, _swapchain, uint64.MaxValue, _imageAvailableSemaphores[_currentFrame], VK_NULL_HANDLE, &imageIndex);
			switch (result) {
				case .ErrorOutOfDateKHR: {
					return .Ok(RecreateSwapchain());
				}
				default:
					if (result != .Success && result != .SuboptimalKHR)
					{
					 	return LogError("Failed to acquire swap chain image");
					}
			}

			UpdateUniformBuffer(imageIndex);

			if (_imagesInFlight[imageIndex] != VK_NULL_HANDLE)
			{
				vkWaitForFences(_logicalDevice, 1, &_imagesInFlight[imageIndex], Bool32(true), uint64.MaxValue);
			}
			_imagesInFlight[imageIndex] = _inFlightFences[_currentFrame];

			var submitInfo = SubmitInfo();
			submitInfo.waitSemaphoreCount = (uint32)_waitSemaphores[_currentFrame].Count;
			submitInfo.pWaitSemaphores = _waitSemaphores[_currentFrame].Ptr;
			submitInfo.pWaitDstStageMask = _waitStages.Ptr;
			submitInfo.commandBufferCount = 1;
			submitInfo.pCommandBuffers = &_commandBuffers[imageIndex];
			submitInfo.signalSemaphoreCount = (uint32)_signalSemaphores[_currentFrame].Count;
			submitInfo.pSignalSemaphores = _signalSemaphores[_currentFrame].Ptr;

			vkResetFences(_logicalDevice, 1, &_inFlightFences[_currentFrame]);
			if (vkQueueSubmit(_graphicsQueue, 1, &submitInfo, _inFlightFences[_currentFrame]) != .Success)
			{
				return LogError("Failed to submit queue");
			}

			var subpassDependency = SubpassDependency();
			subpassDependency.srcSubpass = VK_SUBPASS_EXTERNAL;
			subpassDependency.dstSubpass = 0;

			subpassDependency.srcStageMask = PipelineStageFlags.ColorAttachmentOutputBit;
			subpassDependency.srcAccessMask = 0;

			subpassDependency.dstStageMask = PipelineStageFlags.ColorAttachmentOutputBit;
			subpassDependency.dstAccessMask = AccessFlags.ColorAttachmentWriteBit;

			var renderPassCreateInfo = RenderPassCreateInfo();
			renderPassCreateInfo.dependencyCount = 1;
			renderPassCreateInfo.pDependencies = &subpassDependency;

			var presentInfo = PresentInfoKHR();
			presentInfo.waitSemaphoreCount = (uint32)_signalSemaphores[_currentFrame].Count;
			presentInfo.pWaitSemaphores = _signalSemaphores[_currentFrame].Ptr;
			presentInfo.swapchainCount = (uint32)_swapchains.Count;
			presentInfo.pSwapchains = _swapchains.Ptr;
			presentInfo.pImageIndices = &imageIndex;
			presentInfo.pResults = null;

			result = vkQueuePresentKHR(_presentQueue, &presentInfo);
			switch (result)
			{
				case .ErrorOutOfDateKHR:
					_frameBufferResized = false;
					RecreateSwapchain();
			default:
				if (result != .Success)
				{
					return LogError("Failed to present swap chain image");
				}
			}

			_currentFrame = (_currentFrame + 1) % MAX_FRAMES_IN_FLIGHT;

			return .Ok;
		}

		public Result<void> CreateInstance()
		{
			if (_window == null)
			{
				return LogError("Window is null");
			}
			if (_enableValidation && !CheckValidationLayerSupport())
			{
				return LogError("Validation layers requested and not supported");
			}
			uint32 extensionCount = ?;
			SDL.Vulkan_GetInstanceExtensions(_window, out extensionCount, null);

			var extensionNames = scope List<char8*>(extensionCount);
			for (var i = 0; i < extensionCount; ++i)
			{
				extensionNames.Add("");
			}

			SDL.Vulkan_GetInstanceExtensions(_window, out extensionCount, extensionNames.Ptr);

			var instanceCreateInfo = InstanceCreateInfo();
			instanceCreateInfo.pApplicationInfo = &_appInfo;
			if (_enableValidation)
			{
				instanceCreateInfo.enabledLayerCount = (uint32)_validationLayers.Count;
				instanceCreateInfo.ppEnabledLayerNames = _validationLayers.Ptr;
			}
			else
			{
				instanceCreateInfo.enabledLayerCount = 0;
				instanceCreateInfo.ppEnabledLayerNames = null;
			}
			instanceCreateInfo.enabledExtensionCount = extensionCount;
			instanceCreateInfo.ppEnabledExtensionNames = extensionNames.Ptr;

			if (vkCreateInstance(&instanceCreateInfo, _allocationCallbacks, &_instance) != .Success)
			{
				return LogError("Failed to create instance");
			}
			return .Ok;
		}

#if !BF_PLATFORM_WINDOWS
		public Result<void> CreateSurface()
		{
			if (_window == null)
			{
				return LogError("Window is null");
			}
			#if !BF_PLATFORM_WINDOWS
			var surface = (SDL.VkSurfaceKHR)_surface;
			if (!SDL.Vulkan_CreateSurface(_window, (SDL.VkInstance)_instance, out surface))
			{
				return LogError("Failed to create surface");
			}
			_surface = (SurfaceKHR)surface;
			#else
			if (!SDL.Vulkan_CreateSurface(_window, (SDL.VkInstance)_instance, out _surface))
			{
				return LogError("Failed to create windows surface");
			}
			#endif
			return .Ok;
		}
#else
		public Result<void> CreateWin32Surface(ref SDL.SDL_SysWMinfo windowInfo)
		{
			var winSurfaceCreateInfo = Win32SurfaceCreateInfoKHR();
			winSurfaceCreateInfo.hwnd = windowInfo.info.win.window;
			winSurfaceCreateInfo.hinstance = windowInfo.info.win.hinstance;

			if (CreateWin32SurfaceKHR(_instance, &winSurfaceCreateInfo, null, &_surface) != .Success)
			{
				return LogError("Failed to create Win32Surface");
			}
			return .Ok;
		}
#endif

		public Result<void> FinishInitialize()
		{
			if (_window == null)
			{
				return LogError("Window is null");
			}
			if (
				SelectPhysicalDevice() == .Err
				|| CreateLogicalDevice() == .Err
				|| CreateSwapchain() == .Err
				|| CreateImageViews() == .Err
				|| CreateRenderPass() == .Err
				|| CreateDescriptorSetLayout() == .Err
				|| CreateGraphicsPipeline() == .Err
				|| CreateFrameBuffers() == .Err
				|| CreateCommandPool() == .Err
				|| CreateVertexBuffer() == .Err
				|| CreateIndexBuffer() == .Err
				|| CreateUniformBuffers() == .Err
				|| CreateDescriptorPool() == .Err
				|| CreateDescriptorSets() == .Err
				|| CreateCommandBuffers() == .Err
				|| CreateSyncObjects() == .Err
			)
			{
				return .Err;
			}
			return .Ok;
		}

		public void HandleResizeEvent()
		{
			_frameBufferResized = true;
		}

#endregion

#endregion

#region Private

#region Members
		private const bool _enableValidation = true;
		private const int UNINITIALIZED_SURFACE = 0;
		private const int MAX_FRAMES_IN_FLIGHT = 2;

		private AllocationCallbacks* _allocationCallbacks = null;

		private ApplicationInfo _appInfo = ApplicationInfo();
		private bool _frameBufferResized = false;
		private CommandPool _commandPool = CommandPool();
		private DescriptorPool _descriptorPool = DescriptorPool();
		private DescriptorSetLayout _descriptorSetLayout = DescriptorSetLayout();
		private List<DescriptorSet> _descriptorSets;
		private Device _logicalDevice = VK_NULL_HANDLE;
		private DeviceMemory _vertexBufferMemory = DeviceMemory();
		private DeviceMemory _indexBufferMemory = DeviceMemory();
		private List<DeviceMemory> _uniformBufferMemories;
		private Extent2D _extent;
		private Instance _instance = VK_NULL_HANDLE;
		private int _currentFrame = 0;
		private SDL.Window* _window;
		
		private List<char8*> _requiredExtensionNames;
		private List<char8*> _validationLayers;
		private List<CommandBuffer> _commandBuffers;
		private List<DynamicState> _dynamicStates;
		private List<Fence> _imagesInFlight;
		private List<Fence> _inFlightFences;
		private List<Vertex> _vertices;
		private List<uint16> _indices;
		private List<ImageView> _swapchainImageViews;
		private List<Vulkan.Image> _swapchainImages;
		private List<Framebuffer> _swapchainFrameBuffers;
		private List<PipelineStageFlags> _waitStages;
		private List<List<Semaphore>> _signalSemaphores;
		private List<List<Semaphore>> _waitSemaphores;
		private List<SwapchainKHR> _swapchains;
		private PhysicalDevice _physicalDevice = VK_NULL_HANDLE;
		private PhysicalDeviceFeatures _deviceFeatures = PhysicalDeviceFeatures();
		private Pipeline _graphicsPipeline = Pipeline();
		private PipelineLayout _pipelineLayout = PipelineLayout();
		private PresentModeKHR _presentMode = PresentModeKHR();
		private RenderPass _renderPass = RenderPass();
		private List<Semaphore> _imageAvailableSemaphores;
		private List<Semaphore> _renderFinishedSemaphores;
		private SurfaceFormatKHR _surfaceFormat = SurfaceFormatKHR();
		private SwapchainKHR _swapchain = VK_NULL_HANDLE;
		private SwapchainSupportDetails _swapchainSupportDetails;
		private Vulkan.Buffer _vertexBuffer = Vulkan.Buffer();
		private Vulkan.Buffer _indexBuffer = Vulkan.Buffer();
		private List<Vulkan.Buffer> _uniformBuffers;
		private UniformBufferObject _uniformBufferObject = UniformBufferObject();
		private Vulkan.Queue _graphicsQueue = Vulkan.Queue();
		private Vulkan.Queue _presentQueue = Vulkan.Queue();
		private Vulkan.Rect2D _scissor = Vulkan.Rect2D();
		private Vulkan.Viewport _viewport = Vulkan.Viewport();
		private SurfaceKHR _surface;
#endregion

#region Member Methods
		private bool CheckDeviceExtensionSupport(PhysicalDevice device)
		{
			uint32 extensionCount = 0;
			vkEnumerateDeviceExtensionProperties(device, null, &extensionCount, null);

			let availableExtensions = scope List<ExtensionProperties>();
			for (var i = 0; i < extensionCount; ++i)
			{
				availableExtensions.Add(ExtensionProperties());
			}
			vkEnumerateDeviceExtensionProperties(device, null, &extensionCount, availableExtensions.Ptr);

			for (let requiredExtension in _requiredExtensionNames)
			{
				var found = false;
				for (let availableExtension in availableExtensions)
				{
					ComparePointerAndArray(requiredExtension, availableExtension.extensionName, ref found);
				}
				if (!found)
				{
					return false;
				}
			}

			return true;
		}

		private bool CheckValidationLayerSupport()
		{
		    uint32 layerCount = 0;
		    vkEnumerateInstanceLayerProperties(&layerCount, null);
		
			var availableLayers = scope List<LayerProperties>();
			for (var i = 0; i < layerCount; ++i)
			{
				availableLayers.Add(LayerProperties());
			}
		    vkEnumerateInstanceLayerProperties(&layerCount, availableLayers.Ptr);

			for (let layerName in _validationLayers)
			{
				var layerFound = false;

				for (let layer in availableLayers)
				{
					ComparePointerAndArray(layerName, layer.layerName, ref layerFound);
				}
				if (layerFound)
				{
					return true;
				}
			}

		    return false;
		}

		private void CleanupSwapchain()
		{
			for (let framebuffer in _swapchainFrameBuffers)
			{
				vkDestroyFramebuffer(_logicalDevice, framebuffer, _allocationCallbacks);
			}

			vkFreeCommandBuffers(_logicalDevice, _commandPool, (uint32)_commandBuffers.Count, _commandBuffers.Ptr);
			vkDestroyPipeline(_logicalDevice, _graphicsPipeline, _allocationCallbacks);
			vkDestroyPipelineLayout(_logicalDevice, _pipelineLayout, _allocationCallbacks);
			vkDestroyRenderPass(_logicalDevice, _renderPass, _allocationCallbacks);
			for (let imageView in _swapchainImageViews)
			{
				vkDestroyImageView(_logicalDevice, imageView, _allocationCallbacks);
			}
			if (_swapchain != VK_NULL_HANDLE)
			{
				vkDestroySwapchainKHR(_logicalDevice, _swapchain, _allocationCallbacks);
			}
			for (var i = 0; i < _swapchainImages.Count; ++i)
			{
				if (i < _uniformBuffers.Count)
				{
					vkDestroyBuffer(_logicalDevice, _uniformBuffers[i], _allocationCallbacks);
				}
				if (i < _uniformBufferMemories.Count)
				{
					vkFreeMemory(_logicalDevice, _uniformBufferMemories[i], _allocationCallbacks);
				}
			}

			vkDestroyDescriptorPool(_logicalDevice, _descriptorPool, _allocationCallbacks);

			delete _swapchainSupportDetails;
			_swapchainSupportDetails = new SwapchainSupportDetails();
			_commandBuffers.Clear();
			_swapchainFrameBuffers.Clear();
			_swapchainImageViews.Clear();
			_swapchainImages.Clear();
			_swapchains.Clear();
			_uniformBufferMemories.Clear();
			_uniformBuffers.Clear();
		}

		private void ComparePointerAndArray(char8* val1, char8[256] val2, ref bool result)
		{
			for (var i = 0; i < 256; ++i)
			{
				if (val1[i] == '\0' && val2[i] == '\0')
				{
					result = true;
					break;
				}
				else if (val1[i] != val2[i]) {
					break;
				}
			}
		}

		private Result<void> CopyBuffer(Vulkan.Buffer sourceBuffer, Vulkan.Buffer destinationBuffer, DeviceSize size)
		{
			var commandBufferAllocateInfo = CommandBufferAllocateInfo();
			commandBufferAllocateInfo.level = CommandBufferLevel.Primary;
			commandBufferAllocateInfo.commandPool = _commandPool;
			commandBufferAllocateInfo.commandBufferCount = 1;

			var commandBuffer = CommandBuffer();
			if (vkAllocateCommandBuffers(_logicalDevice, &commandBufferAllocateInfo, &commandBuffer) != .Success)
			{
				return LogError("Failed to allocate command buffer while copying");
			}

			var commandBufferBeginInfo = CommandBufferBeginInfo();
			commandBufferBeginInfo.flags = CommandBufferUsageFlags.OneTimeSubmitBit;
			if (vkBeginCommandBuffer(commandBuffer, &commandBufferBeginInfo) != .Success)
			{
				return LogError("Failed to begin recording command buffer while copying");
			}

			var copyRegion = BufferCopy();
			copyRegion.srcOffset = 0;
			copyRegion.dstOffset = 0;
			copyRegion.size = size;
			vkCmdCopyBuffer(commandBuffer, sourceBuffer, destinationBuffer, 1, &copyRegion);

			if (vkEndCommandBuffer(commandBuffer) != .Success)
			{
				return LogError("Failed to record command buffer while copying");
			}

			var submitInfo = SubmitInfo();
			submitInfo.commandBufferCount = 1;
			submitInfo.pCommandBuffers = &commandBuffer;
			if (vkQueueSubmit(_graphicsQueue, 1, &submitInfo, VK_NULL_HANDLE) != .Success)
			{
				return LogError("Failed to submit queue while copying buffer");
			}

			if (vkQueueWaitIdle(_graphicsQueue) != .Success)
			{
				return LogError("Failed while waiting for queue to idle");
			}

			vkFreeCommandBuffers(_logicalDevice, _commandPool, 1, &commandBuffer);

			return .Ok;
		}

		private Result<void> CreateBuffer(DeviceSize size, BufferUsageFlags usageFlags, MemoryPropertyFlags propertyFlags, ref Vulkan.Buffer buffer, ref DeviceMemory bufferMemory)
		{
			var bufferCreateInfo = BufferCreateInfo();
			bufferCreateInfo.size = size;
			bufferCreateInfo.usage = usageFlags;
			bufferCreateInfo.sharingMode = SharingMode.Exclusive;

			if (vkCreateBuffer(_logicalDevice, &bufferCreateInfo, _allocationCallbacks, &buffer) != .Success)
			{
				return LogError("Failed to create vertex buffer");
			}

			var memoryRequirements = MemoryRequirements();
			vkGetBufferMemoryRequirements(_logicalDevice, buffer, &memoryRequirements);

			var memoryAllocateInfo = MemoryAllocateInfo();
			memoryAllocateInfo.allocationSize = memoryRequirements.size;
			switch (FindMemoryType(memoryRequirements.memoryTypeBits, propertyFlags))
			{
				case .Ok(let result): memoryAllocateInfo.memoryTypeIndex = result;
				case .Err: return LogError("Failed to find suitable memory type");
			}

			if (vkAllocateMemory(_logicalDevice, &memoryAllocateInfo, _allocationCallbacks, &bufferMemory) != .Success)
			{
				return LogError("Failed to allocate vertex buffer memory");
			}
			vkBindBufferMemory(_logicalDevice, buffer, bufferMemory, 0);

			return .Ok;
		}

		private Result<void> CreateCommandBuffers()
		{
			for (let frameBuffer in _swapchainFrameBuffers)
			{
				_commandBuffers.Add(CommandBuffer());
			}

			var commandBufferAllocateInfo = CommandBufferAllocateInfo();
			commandBufferAllocateInfo.commandPool = _commandPool;
			commandBufferAllocateInfo.level = CommandBufferLevel.Primary;
			commandBufferAllocateInfo.commandBufferCount = (uint32) _commandBuffers.Count;

			if (vkAllocateCommandBuffers(_logicalDevice, &commandBufferAllocateInfo, _commandBuffers.Ptr) != .Success)
			{
				return LogError("Failed to allocate command buffers");
			}

			if (RecordCommandBuffers() == .Err)
			{
				return .Err;
			}

			return .Ok;
		}

		private Result<void> CreateCommandPool()
		{
			QueueFamilyIndices indices = ?;
			switch (FindQueueFamilies(_physicalDevice))
			{
				case .Ok(let result): indices = result;
				case .Err: return LogError("Failed to get queue families");
			}

			var commandPoolCreateInfo = CommandPoolCreateInfo();
			commandPoolCreateInfo.queueFamilyIndex = indices.GraphicsFamily;
			commandPoolCreateInfo.flags = 0;

			if (vkCreateCommandPool(_logicalDevice, &commandPoolCreateInfo, _allocationCallbacks, &_commandPool) != .Success)
			{
				return LogError("Failed to create command pool");
			}

			return .Ok;
		}

		private Result<void> CreateDescriptorPool()
		{
			var descriptorPoolSize = DescriptorPoolSize();
			descriptorPoolSize.type = DescriptorType.UniformBuffer;
			descriptorPoolSize.descriptorCount = (uint32)_swapchainImages.Count;

			var descriptorPoolCreateInfo = DescriptorPoolCreateInfo();
			descriptorPoolCreateInfo.poolSizeCount = 1;
			descriptorPoolCreateInfo.pPoolSizes = &descriptorPoolSize;
			descriptorPoolCreateInfo.maxSets = (uint32)_swapchainImages.Count;

			if (vkCreateDescriptorPool(_logicalDevice, &descriptorPoolCreateInfo, _allocationCallbacks, &_descriptorPool) != .Success)
			{
				return LogError("Failed to creat descriptor pool");
			}

			return .Ok;
		}

		private Result<void> CreateDescriptorSets()
		{
			var descriptorSetLayouts = scope List<DescriptorSetLayout>();
			for (let image in _swapchainImages)
			{
				descriptorSetLayouts.Add(_descriptorSetLayout);
			}

			var descriptorSetAllocateInfo = DescriptorSetAllocateInfo();
			descriptorSetAllocateInfo.descriptorPool = _descriptorPool;
			descriptorSetAllocateInfo.descriptorSetCount = (uint32)_swapchainImages.Count;
			descriptorSetAllocateInfo.pSetLayouts = descriptorSetLayouts.Ptr;

			for (let _ in _swapchainImages)
			{
				_descriptorSets.Add(DescriptorSet());
			}
			if (vkAllocateDescriptorSets(_logicalDevice, &descriptorSetAllocateInfo, _descriptorSets.Ptr) != .Success)
			{
				return LogError("Failed to allocate descriptor sets");
			}
			for (var i = 0; i < _swapchainImages.Count; ++i)
			{
				var descriptorBufferInfo = DescriptorBufferInfo();
				descriptorBufferInfo.buffer = _uniformBuffers[i];
				descriptorBufferInfo.offset = 0;
				descriptorBufferInfo.range = sizeof(UniformBufferObject);

				var descriptorWriteSet = WriteDescriptorSet();
				descriptorWriteSet.dstSet = _descriptorSets[i];
				descriptorWriteSet.dstBinding = 0;
				descriptorWriteSet.dstArrayElement = 0;
				descriptorWriteSet.descriptorType = DescriptorType.UniformBuffer;
				descriptorWriteSet.descriptorCount = 1;
				descriptorWriteSet.pBufferInfo = &descriptorBufferInfo;
				descriptorWriteSet.pImageInfo = null;
				descriptorWriteSet.pTexelBufferView = null;

				vkUpdateDescriptorSets(_logicalDevice, 1, &descriptorWriteSet, 0, null);
			}

			return .Ok;
		}

		private Result<void> CreateDescriptorSetLayout()
		{
			var descriptorSetLayoutBinding = DescriptorSetLayoutBinding();
			descriptorSetLayoutBinding.binding = 0;
			descriptorSetLayoutBinding.descriptorCount = 1;
			descriptorSetLayoutBinding.descriptorType = DescriptorType.UniformBuffer;
			descriptorSetLayoutBinding.stageFlags = ShaderStageFlags.VertexBit;
			descriptorSetLayoutBinding.pImmutableSamplers = null;

			var desciptorSetLayoutCreateInfo = DescriptorSetLayoutCreateInfo();
			desciptorSetLayoutCreateInfo.bindingCount = 1;
			desciptorSetLayoutCreateInfo.pBindings = &descriptorSetLayoutBinding;

			if (vkCreateDescriptorSetLayout(_logicalDevice, &desciptorSetLayoutCreateInfo, _allocationCallbacks, &_descriptorSetLayout) != .Success)
			{
				return LogError("Failed to create descriptor set layout");
			}

			return .Ok;
		}

		private Result<void> CreateFrameBuffers()
		{
			for (var i = 0; i < _swapchainImageViews.Count; ++i)
			{
				let imageView = _swapchainImageViews[i];
				_swapchainFrameBuffers.Add(Framebuffer());

				let attachments = scope List<ImageView>();
				attachments.Add(imageView);

				var frameBufferCreateInfo = FramebufferCreateInfo();
				frameBufferCreateInfo.renderPass = _renderPass;
				frameBufferCreateInfo.attachmentCount = 1;
				frameBufferCreateInfo.pAttachments = attachments.Ptr;
				frameBufferCreateInfo.width = _extent.width;
				frameBufferCreateInfo.height = _extent.height;
				frameBufferCreateInfo.layers = 1;

				if (vkCreateFramebuffer(_logicalDevice, &frameBufferCreateInfo, _allocationCallbacks, &_swapchainFrameBuffers[i]) != .Success)
				{
					return LogError("Failed to create frame buffer");
				}
			}

			return .Ok;
		}

		private Result<void> CreateGraphicsPipeline()
		{
			let fragShaderCode = scope List<uint32>();
			let vertShaderCode = scope List<uint32>();
			ReadShaderFile<uint32>("shaders/triangle/frag.spv", fragShaderCode);
			ReadShaderFile<uint32>("shaders/triangle/vert.spv", vertShaderCode);
			
			let vertexShaderModule = CreateShaderModule(vertShaderCode);
			let fragmentShaderModule = CreateShaderModule(fragShaderCode);

			var vertexShaderStageCreateInfo = PipelineShaderStageCreateInfo();
			vertexShaderStageCreateInfo.stage = ShaderStageFlags.VertexBit;
			vertexShaderStageCreateInfo.module = vertexShaderModule;
			vertexShaderStageCreateInfo.pName = "main";

			var fragmentShaderStageCreateInfo = PipelineShaderStageCreateInfo();
			fragmentShaderStageCreateInfo.stage = ShaderStageFlags.FragmentBit;
			fragmentShaderStageCreateInfo.module = fragmentShaderModule;
			fragmentShaderStageCreateInfo.pName = "main";

			var bindingDescription = GetVertexBindingDescription();
			var attributeDescriptions = GetVertexAttributeDescriptions();

			var vertexInputStateCreateInfo = PipelineVertexInputStateCreateInfo();
			vertexInputStateCreateInfo.vertexAttributeDescriptionCount = attributeDescriptions.Count;
			vertexInputStateCreateInfo.pVertexAttributeDescriptions = &attributeDescriptions;
			vertexInputStateCreateInfo.vertexBindingDescriptionCount = 1;
			vertexInputStateCreateInfo.pVertexBindingDescriptions = &bindingDescription;

			var inputAssemblyStateCreateInfo = PipelineInputAssemblyStateCreateInfo();
			inputAssemblyStateCreateInfo.topology = PrimitiveTopology.TriangleList;
			inputAssemblyStateCreateInfo.primitiveRestartEnable = VK_FALSE;

			_viewport.x = 0f;
			_viewport.y = 0f;
			_viewport.width = (float)_extent.width;
			_viewport.height = (float)_extent.height;
			_viewport.minDepth = 0f;
			_viewport.maxDepth = 1f;

			_scissor.offset = Vulkan.Offset2D(0, 0);
			_scissor.extent = _extent;

			var viewportStateCreateInfo = PipelineViewportStateCreateInfo();
			viewportStateCreateInfo.viewportCount = 1;
			viewportStateCreateInfo.pViewports = &_viewport;
			viewportStateCreateInfo.scissorCount = 1;
			viewportStateCreateInfo.pScissors = &_scissor;

			var rasterizationStateCreateInfo = PipelineRasterizationStateCreateInfo();
			rasterizationStateCreateInfo.depthClampEnable = VK_FALSE;
			rasterizationStateCreateInfo.rasterizerDiscardEnable = VK_FALSE;
			rasterizationStateCreateInfo.polygonMode = PolygonMode.Fill;
			rasterizationStateCreateInfo.lineWidth = 1f;
			rasterizationStateCreateInfo.cullMode = CullModeFlags.BackBit;
			rasterizationStateCreateInfo.frontFace = FrontFace.Clockwise;
			rasterizationStateCreateInfo.depthBiasEnable = VK_FALSE;
			rasterizationStateCreateInfo.depthBiasConstantFactor = 0f;
			rasterizationStateCreateInfo.depthBiasClamp = 0f;
			rasterizationStateCreateInfo.depthBiasSlopeFactor = 0f;

			var multisampleStateCreateInfo = PipelineMultisampleStateCreateInfo();
			multisampleStateCreateInfo.sampleShadingEnable = VK_FALSE;
			multisampleStateCreateInfo.rasterizationSamples = SampleCountFlags.e1Bit;
			multisampleStateCreateInfo.minSampleShading = 1f;
			multisampleStateCreateInfo.pSampleMask = null;
			multisampleStateCreateInfo.alphaToCoverageEnable = VK_FALSE;
			multisampleStateCreateInfo.alphaToOneEnable = VK_FALSE;

			var colorBlendAttachmentState = PipelineColorBlendAttachmentState();
			colorBlendAttachmentState.colorWriteMask = ColorComponentFlags.RBit | ColorComponentFlags.GBit | ColorComponentFlags.BBit | ColorComponentFlags.ABit;
			colorBlendAttachmentState.blendEnable = VK_FALSE;
			colorBlendAttachmentState.srcColorBlendFactor = BlendFactor.One;
			colorBlendAttachmentState.dstColorBlendFactor = BlendFactor.Zero;
			colorBlendAttachmentState.colorBlendOp = BlendOp.Add;
			colorBlendAttachmentState.srcAlphaBlendFactor = BlendFactor.One;
			colorBlendAttachmentState.dstAlphaBlendFactor = BlendFactor.Zero;
			colorBlendAttachmentState.alphaBlendOp = BlendOp.Add;

			var colorBlendStateCreateInfo = PipelineColorBlendStateCreateInfo();
			colorBlendStateCreateInfo.logicOpEnable = VK_FALSE;
			colorBlendStateCreateInfo.logicOp = LogicOp.Copy;
			colorBlendStateCreateInfo.attachmentCount = 1;
			colorBlendStateCreateInfo.pAttachments = &colorBlendAttachmentState;
			colorBlendStateCreateInfo.blendConstants[0] = 0f;
			colorBlendStateCreateInfo.blendConstants[1] = 0f;
			colorBlendStateCreateInfo.blendConstants[2] = 0f;
			colorBlendStateCreateInfo.blendConstants[3] = 0f;

			var dynamicStateCreateInfo = PipelineDynamicStateCreateInfo();
			dynamicStateCreateInfo.dynamicStateCount = 2;
			dynamicStateCreateInfo.pDynamicStates = _dynamicStates.Ptr;

			var layoutCreateInfo = PipelineLayoutCreateInfo();
			layoutCreateInfo.setLayoutCount = 1;
			layoutCreateInfo.pSetLayouts = &_descriptorSetLayout;
			layoutCreateInfo.pushConstantRangeCount = 0;
			layoutCreateInfo.pPushConstantRanges = null;

			if (vkCreatePipelineLayout(_logicalDevice, &layoutCreateInfo, _allocationCallbacks, &_pipelineLayout) != .Success)
			{
				return LogError("Failed to create pipeline layout");
			}

			let shaderStages = scope List<PipelineShaderStageCreateInfo>();
			shaderStages.Add(vertexShaderStageCreateInfo);
			shaderStages.Add(fragmentShaderStageCreateInfo);

			var graphicsPipelineCreateInfo = GraphicsPipelineCreateInfo();
			graphicsPipelineCreateInfo.stageCount = 2;
			graphicsPipelineCreateInfo.pStages = shaderStages.Ptr;
			graphicsPipelineCreateInfo.pVertexInputState = &vertexInputStateCreateInfo;
			graphicsPipelineCreateInfo.pInputAssemblyState = &inputAssemblyStateCreateInfo;
			graphicsPipelineCreateInfo.pViewportState = &viewportStateCreateInfo;
			graphicsPipelineCreateInfo.pRasterizationState = &rasterizationStateCreateInfo;
			graphicsPipelineCreateInfo.pMultisampleState = &multisampleStateCreateInfo;
			graphicsPipelineCreateInfo.pDepthStencilState = null;
			graphicsPipelineCreateInfo.pColorBlendState = &colorBlendStateCreateInfo;
			graphicsPipelineCreateInfo.pDynamicState = null;
			graphicsPipelineCreateInfo.layout = _pipelineLayout;
			graphicsPipelineCreateInfo.renderPass = _renderPass;
			graphicsPipelineCreateInfo.subpass = 0;
			graphicsPipelineCreateInfo.basePipelineHandle = VK_NULL_HANDLE;
			graphicsPipelineCreateInfo.basePipelineIndex = -1;

			if (vkCreateGraphicsPipelines(_logicalDevice, VK_NULL_HANDLE, 1, &graphicsPipelineCreateInfo, _allocationCallbacks, &_graphicsPipeline) != .Success)
			{
				return LogError("Failed to create graphics pipeline");
			}

			vkDestroyShaderModule(_logicalDevice, fragmentShaderModule, _allocationCallbacks);
			vkDestroyShaderModule(_logicalDevice, vertexShaderModule, _allocationCallbacks);

			return .Ok;
		}

		private Result<void> CreateImageViews()
		{
			for (var i = 0; i < _swapchainImages.Count; ++i)
			{
				_swapchainImageViews.Add(ImageView());
			}

			for (var i = 0; i < _swapchainImageViews.Count; ++i)
			{
				var imageViewCreateInfo = ImageViewCreateInfo();
				imageViewCreateInfo.image = _swapchainImages[i];
				imageViewCreateInfo.viewType = ImageViewType.e2D;
				imageViewCreateInfo.format = _surfaceFormat.format;

				imageViewCreateInfo.components.r = ComponentSwizzle.Identity;
				imageViewCreateInfo.components.g = ComponentSwizzle.Identity;
				imageViewCreateInfo.components.b = ComponentSwizzle.Identity;
				imageViewCreateInfo.components.a = ComponentSwizzle.Identity;

				imageViewCreateInfo.subresourceRange.aspectMask = ImageAspectFlags.ColorBit;
				imageViewCreateInfo.subresourceRange.baseMipLevel = 0;
				imageViewCreateInfo.subresourceRange.levelCount = 1;
				imageViewCreateInfo.subresourceRange.baseArrayLayer = 0;
				imageViewCreateInfo.subresourceRange.layerCount = 1;

				if (vkCreateImageView(_logicalDevice, &imageViewCreateInfo, null, &_swapchainImageViews[i]) != .Success)
				{
					return LogError("Failed to create image view");
				}
			}
			return .Ok;
		}

		private Result<void> CreateIndexBuffer()
		{
			DeviceSize size = sizeof(Vertex) * (uint32)_indices.Count;

			var stagingBuffer = Vulkan.Buffer();
			var stagingBufferMemory = DeviceMemory();
			if (
				CreateBuffer(
					size,
					BufferUsageFlags.TransferSrcBit,
					MemoryPropertyFlags.HostVisibleBit | MemoryPropertyFlags.HostCoherentBit,
					ref stagingBuffer,
					ref stagingBufferMemory
				) == .Err
			)
			{
				return LogError("Failed to create index staging buffer");
			}

			void* data = ?;
			vkMapMemory(_logicalDevice, stagingBufferMemory, 0, size, 0, &data);
			Internal.MemCpy(data, _indices.Ptr, (int)size);
			vkUnmapMemory(_logicalDevice, stagingBufferMemory);

			if (
				CreateBuffer(
					size,
					BufferUsageFlags.TransferDstBit | BufferUsageFlags.IndexBufferBit,
					MemoryPropertyFlags.DeviceLocalBit,
					ref _indexBuffer,
					ref _indexBufferMemory
				) == .Err
			)
			{
				return LogError("Failed to create index buffer");
			}
			if (CopyBuffer(stagingBuffer, _indexBuffer, size) == .Err)
			{
				return LogError("Failed to copy staging index buffer");
			}

			vkDestroyBuffer(_logicalDevice, stagingBuffer, _allocationCallbacks);
			vkFreeMemory(_logicalDevice, stagingBufferMemory, _allocationCallbacks);

			return .Ok;
		}

		private Result<void> CreateLogicalDevice()
		{
			QueueFamilyIndices indices = ?;
			switch (FindQueueFamilies(_physicalDevice))
			{
				case .Ok(let result): indices = result;
				case .Err: return LogError("Failed to find queue families when creating logical device");
			}

			var queuePriority = 1.0f;

			var deviceGraphicsQueueCreateInfo = DeviceQueueCreateInfo();
			deviceGraphicsQueueCreateInfo.queueFamilyIndex = indices.GraphicsFamily;
			deviceGraphicsQueueCreateInfo.queueCount = 1;
			deviceGraphicsQueueCreateInfo.pQueuePriorities = &queuePriority;

			var devicePresentQueueCreateInfo = DeviceQueueCreateInfo();
			devicePresentQueueCreateInfo.queueFamilyIndex = indices.PresentFamily;
			devicePresentQueueCreateInfo.queueCount = 1;
			devicePresentQueueCreateInfo.pQueuePriorities = &queuePriority;

			var deviceQueues = scope List<DeviceQueueCreateInfo>();
			deviceQueues.Add(deviceGraphicsQueueCreateInfo);
			if (indices.GraphicsFamily != indices.PresentFamily)
			{
				deviceQueues.Add(devicePresentQueueCreateInfo);
			}

			var deviceCreateInfo = DeviceCreateInfo();
			deviceCreateInfo.pQueueCreateInfos = deviceQueues.Ptr;
			deviceCreateInfo.queueCreateInfoCount = (uint32)deviceQueues.Count;
			deviceCreateInfo.pEnabledFeatures = &_deviceFeatures;
			deviceCreateInfo.enabledExtensionCount = (uint32)_requiredExtensionNames.Count;
			deviceCreateInfo.ppEnabledExtensionNames = _requiredExtensionNames.Ptr;

			if (_enableValidation)
			{
				deviceCreateInfo.enabledLayerCount = (uint32)_validationLayers.Count;
				deviceCreateInfo.ppEnabledLayerNames = _validationLayers.Ptr;
			}
			else
			{
				deviceCreateInfo.enabledLayerCount = 0;
			}
			if (vkCreateDevice(_physicalDevice, &deviceCreateInfo, _allocationCallbacks, &_logicalDevice) != .Success)
			{
				return LogError("Failed to create logical device");
			}
			vkGetDeviceQueue(_logicalDevice, indices.GraphicsFamily, 0, &_graphicsQueue);
			vkGetDeviceQueue(_logicalDevice, indices.PresentFamily, 0, &_presentQueue);
			
			return .Ok;
		}

		private Result<void> CreateRenderPass()
		{
			var attachmentDescription = AttachmentDescription();
			attachmentDescription.format = _surfaceFormat.format;
			attachmentDescription.samples = SampleCountFlags.e1Bit;
			attachmentDescription.loadOp = AttachmentLoadOp.Clear;
			attachmentDescription.storeOp = AttachmentStoreOp.Store;
			attachmentDescription.stencilLoadOp = AttachmentLoadOp.DontCare;
			attachmentDescription.stencilStoreOp = AttachmentStoreOp.DontCare;
			attachmentDescription.initialLayout = ImageLayout.Undefined;
			attachmentDescription.finalLayout = ImageLayout.PresentSrcKHR;

			var attachmentReference = AttachmentReference();
			attachmentReference.attachment = 0;
			attachmentReference.layout = ImageLayout.ColorAttachmentOptimal;

			var subpassDescription = SubpassDescription();
			subpassDescription.pipelineBindPoint = PipelineBindPoint.Graphics;
			subpassDescription.colorAttachmentCount = 1;
			subpassDescription.pColorAttachments = &attachmentReference;

			var renderPassCreateInfo = RenderPassCreateInfo();
			renderPassCreateInfo.attachmentCount = 1;
			renderPassCreateInfo.pAttachments = &attachmentDescription;
			renderPassCreateInfo.subpassCount = 1;
			renderPassCreateInfo.pSubpasses = &subpassDescription;

			if (vkCreateRenderPass(_logicalDevice, &renderPassCreateInfo, null, &_renderPass) != .Success)
			{
				return LogError("Failed to create render pass");
			}

			return .Ok;
		}

		private Result<void> CreateSyncObjects()
		{
			var semaphoreCreateInfo = SemaphoreCreateInfo();
			var fenceCreateInfo = FenceCreateInfo();
			fenceCreateInfo.flags = FenceCreateFlags.SignaledBit;

			for (var i = 0; i < _swapchainImages.Count; ++i)
			{
				_imagesInFlight.Add(VK_NULL_HANDLE);
			}

			for (var i = 0; i < MAX_FRAMES_IN_FLIGHT; ++i)
			{
				if (
					vkCreateSemaphore(_logicalDevice, &semaphoreCreateInfo, _allocationCallbacks, &_imageAvailableSemaphores[i]) != .Success
					|| vkCreateSemaphore(_logicalDevice, &semaphoreCreateInfo, _allocationCallbacks, &_renderFinishedSemaphores[i]) != .Success
					|| vkCreateFence(_logicalDevice, &fenceCreateInfo, _allocationCallbacks, &_inFlightFences[i]) != .Success
				)
				{
					return LogError("Failed to create sync objects for a frame");
				}

				_signalSemaphores[i].Add(_renderFinishedSemaphores[i]);
				_waitSemaphores[i].Add(_imageAvailableSemaphores[i]);
			}
			return .Ok;
		}

		private Result<ShaderModule> CreateShaderModule(List<uint32> code)
		{
			var shaderModuleCreateInfo = ShaderModuleCreateInfo();
			shaderModuleCreateInfo.codeSize = (uint)code.Count * sizeof(uint32);
			shaderModuleCreateInfo.pCode = code.Ptr;

			var shaderModule = ShaderModule();
			if (vkCreateShaderModule(_logicalDevice, &shaderModuleCreateInfo, null, &shaderModule) != .Success)
			{
				LogError("Failed to create shader module");
				return .Err;
			}
			return .Ok(shaderModule);
		}

		private Result<void> CreateSwapchain()
		{
			QuerySwapchainSupportDetails(_physicalDevice, _swapchainSupportDetails);
			_surfaceFormat = _swapchainSupportDetails.ChooseSwapSurfaceFormat();
			_presentMode = _swapchainSupportDetails.ChooseSwapPresentMode();
			_extent = _swapchainSupportDetails.ChooseSwapExtent(_window);

			uint32 imageCount = _swapchainSupportDetails.Capabilities.minImageCount + 1;
			if (_swapchainSupportDetails.Capabilities.maxImageCount > 0 && imageCount > _swapchainSupportDetails.Capabilities.maxImageCount)
			{
				imageCount = _swapchainSupportDetails.Capabilities.maxImageCount;
			}

			var swapchainCreateInfo = SwapchainCreateInfoKHR();
			swapchainCreateInfo.surface = _surface;
			swapchainCreateInfo.minImageCount = imageCount;
			swapchainCreateInfo.imageFormat = _surfaceFormat.format;
			swapchainCreateInfo.imageColorSpace = _surfaceFormat.colorSpace;
			swapchainCreateInfo.imageExtent = _extent;
			swapchainCreateInfo.imageArrayLayers = 1;
			swapchainCreateInfo.imageUsage = ImageUsageFlags.ColorAttachmentBit;
			QueueFamilyIndices indices = ?;
			switch (FindQueueFamilies(_physicalDevice))
			{
				case .Ok(let result): indices = result;
				case .Err: return .Err;
			}
			let familyIndices = scope List<uint32>();
			familyIndices.Add(indices.GraphicsFamily);
			familyIndices.Add(indices.PresentFamily);
			if (indices.GraphicsFamily != indices.PresentFamily)
			{
				swapchainCreateInfo.imageSharingMode = SharingMode.Concurrent;
				swapchainCreateInfo.queueFamilyIndexCount = 2;
				swapchainCreateInfo.pQueueFamilyIndices = familyIndices.Ptr;
			}
			else
			{
				swapchainCreateInfo.imageSharingMode = SharingMode.Exclusive;
				swapchainCreateInfo.queueFamilyIndexCount = 0;
				swapchainCreateInfo.pQueueFamilyIndices = null;
			}
			swapchainCreateInfo.preTransform = _swapchainSupportDetails.Capabilities.currentTransform;
			swapchainCreateInfo.compositeAlpha = CompositeAlphaFlagsKHR.OpaqueBitKHR;
			swapchainCreateInfo.presentMode = _presentMode;
			swapchainCreateInfo.clipped = Bool32(true);
			swapchainCreateInfo.oldSwapchain = VK_NULL_HANDLE;

			if (vkCreateSwapchainKHR(_logicalDevice, &swapchainCreateInfo, _allocationCallbacks, &_swapchain) != .Success)
			{
				return LogError("Failed to create swap chain");
			}

			vkGetSwapchainImagesKHR(_logicalDevice, _swapchain, &imageCount, null);
			for (var i = 0; i < imageCount; ++i)
			{
				_swapchainImages.Add(Vulkan.Image());
			}
			vkGetSwapchainImagesKHR(_logicalDevice, _swapchain, &imageCount, _swapchainImages.Ptr);

			_swapchains.Add(_swapchain);

			return .Ok;
		}

		private Result<void> CreateUniformBuffers()
		{
			DeviceSize size = sizeof(UniformBufferObject);
			for (var i = 0; i < _swapchainImages.Count; ++i)
			{
				_uniformBuffers.Add(Vulkan.Buffer());
				_uniformBufferMemories.Add(DeviceMemory());

				if (
					CreateBuffer(
						size,
						BufferUsageFlags.UniformBufferBit,
						MemoryPropertyFlags.HostVisibleBit | MemoryPropertyFlags.HostCoherentBit,
						ref _uniformBuffers[i],
						ref _uniformBufferMemories[i]
					) == .Err
				)
				{
					return LogError("Failed to create a uniform buffer");
				}
			}

			return .Ok;
		}

		private Result<void> CreateVertexBuffer()
		{
			let size = sizeof(Vertex) * (uint64)_vertices.Count;
			var stagingBuffer = Vulkan.Buffer();
			var stagingBufferMemory = DeviceMemory();

			if (
				CreateBuffer(
					size,
					BufferUsageFlags.TransferSrcBit,
					MemoryPropertyFlags.HostVisibleBit | MemoryPropertyFlags.HostCoherentBit,
					ref stagingBuffer,
					ref stagingBufferMemory
				) == .Err
			)
			{
				return LogError("Failed to create vertex staging buffer");
			}

			void* data = ?;
			vkMapMemory(_logicalDevice, stagingBufferMemory, 0, size, 0, &data);
			Internal.MemCpy(data, _vertices.Ptr, (int)size);
			vkUnmapMemory(_logicalDevice, stagingBufferMemory);

			if (
				CreateBuffer(
					size,
					BufferUsageFlags.TransferDstBit | BufferUsageFlags.VertexBufferBit,
					MemoryPropertyFlags.HostVisibleBit | MemoryPropertyFlags.HostCoherentBit,
					ref _vertexBuffer,
					ref _vertexBufferMemory
				) == .Err
			)
			{
				return LogError("Failed to create vertex buffer");
			}
			if (CopyBuffer(stagingBuffer, _vertexBuffer, size) == .Err)
			{
				return LogError("Failed to copy staging vertex buffer");
			}

			vkDestroyBuffer(_logicalDevice, stagingBuffer, _allocationCallbacks);
			vkFreeMemory(_logicalDevice, stagingBufferMemory, _allocationCallbacks);

			return .Ok;
		}

		private Result<uint32> FindMemoryType(uint32 typeFilter, MemoryPropertyFlags properties)
		{
			var memoryProperties = PhysicalDeviceMemoryProperties();
			vkGetPhysicalDeviceMemoryProperties(_physicalDevice, &memoryProperties);

			for (uint32 i = 0; i < memoryProperties.memoryTypeCount; ++i)
			{
				if (
					(typeFilter & (1 << i)) != 0
					&& (memoryProperties.memoryTypes[i].propertyFlags & properties) != 0
				)
				{
					return .Ok(i);
				}
			}

			return .Err;
		}	

		private Result<QueueFamilyIndices> FindQueueFamilies(PhysicalDevice device)
		{
			QueueFamilyIndices indices = ?;

			vkGetPhysicalDeviceQueueFamilyProperties(device, &indices.GraphicsFamily, null);

			var families = scope List<QueueFamilyProperties>(indices.GraphicsFamily);
			for (var i = 0; i < indices.GraphicsFamily; ++i)
			{
				families.Add(QueueFamilyProperties());
			}
			vkGetPhysicalDeviceQueueFamilyProperties(device, &indices.GraphicsFamily, families.Ptr);

			var foundGraphicsFamily = false;
			var foundPresentFamily = false;
			for (uint32 i = 0u; i < families.Count; ++i)
			{
				let family = families[i];
				if (family.queueFlags & QueueFlags.GraphicsBit != 0)
				{
					indices.GraphicsFamily = i;
					foundGraphicsFamily = true;

					Bool32 presentSupport = false;
					vkGetPhysicalDeviceSurfaceSupportKHR(device, i, _surface, &presentSupport);
					if (presentSupport == Bool32(true))
					{
						indices.PresentFamily = i;
						foundPresentFamily = true;
					}
				}
			}

			return foundGraphicsFamily && foundPresentFamily ? .Ok(indices) : .Err;
		}

		private VertexInputAttributeDescription[2] GetVertexAttributeDescriptions()
		{
			var attributeDescriptions = VertexInputAttributeDescription[2](VertexInputAttributeDescription(), VertexInputAttributeDescription());

			uint32 offset = 0; // First element in the struct so it has no offset
			attributeDescriptions[0].binding = 0;
			attributeDescriptions[0].location = 0;
			attributeDescriptions[0].format = Format.R32G32Sfloat;
			attributeDescriptions[0].offset = offset;
			offset += sizeof(Vector2);

			attributeDescriptions[1].binding = 0;
			attributeDescriptions[1].location = 1;
			attributeDescriptions[1].format = Format.R32G32B32Sfloat;
			attributeDescriptions[1].offset = offset;
			offset += sizeof(Vector3);

			return attributeDescriptions;
		}

		private VertexInputBindingDescription GetVertexBindingDescription()
		{
			var bindingDescription = VertexInputBindingDescription();
			bindingDescription.binding = 0;
			bindingDescription.stride = sizeof(Vertex);
			bindingDescription.inputRate = VertexInputRate.Vertex;

			return bindingDescription;
		}

		private bool IsSuitablePhysicalDevice(PhysicalDevice device)
		{
			if (FindQueueFamilies(device) == .Err)
			{
				return false;
			}

			if (!CheckDeviceExtensionSupport(device))
			{
				return false;
			}

			var swapchainSupport = scope SwapchainSupportDetails();
			QuerySwapchainSupportDetails(device, swapchainSupport);
			if (swapchainSupport.Formats.IsEmpty || swapchainSupport.PresentModes.IsEmpty)
			{
				return false;
			}

			return true;
		}

		private Result<void> PerformRenderPass(int index)
		{
			let commandBuffer = _commandBuffers[index];
			let frameBuffer = _swapchainFrameBuffers[index];

			var clearColor = ClearValue();
			const let color = float[4](0f, 0f, 0f, 1f);
			clearColor.color.float32 = color;

			var renderPassBeginInfo = RenderPassBeginInfo();
			renderPassBeginInfo.renderPass = _renderPass;
			renderPassBeginInfo.framebuffer = frameBuffer;
			renderPassBeginInfo.renderArea.offset = Offset2D(0, 0);
			renderPassBeginInfo.renderArea.extent = _extent;
			renderPassBeginInfo.clearValueCount = 0;
			renderPassBeginInfo.clearValueCount = 1;
			renderPassBeginInfo.pClearValues = &clearColor;

			vkCmdBeginRenderPass(commandBuffer, &renderPassBeginInfo, SubpassContents.Inline);

			vkCmdBindPipeline(commandBuffer, PipelineBindPoint.Graphics, _graphicsPipeline);
			var vertexBuffers = scope List<Vulkan.Buffer>();
			vertexBuffers.Add(_vertexBuffer);
			var offsets = scope List<DeviceSize>();
			offsets.Add(DeviceSize(0));
			vkCmdBindVertexBuffers(commandBuffer, 0, 1, vertexBuffers.Ptr, offsets.Ptr);
			vkCmdBindIndexBuffer(commandBuffer, _indexBuffer, 0, IndexType.Uint16);
			vkCmdBindDescriptorSets(commandBuffer, PipelineBindPoint.Graphics, _pipelineLayout, 0, 1, &_descriptorSets[index], 0, null);

			vkCmdDrawIndexed(commandBuffer, (uint32)_indices.Count, 1, 0, 0, 0);

			vkCmdEndRenderPass(commandBuffer);

			return .Ok;
		}

		private void QuerySwapchainSupportDetails(PhysicalDevice device, SwapchainSupportDetails outDetails)
		{
			vkGetPhysicalDeviceSurfaceCapabilitiesKHR(device, _surface, &(outDetails.Capabilities));

			uint32 formatCount = 0;
			vkGetPhysicalDeviceSurfaceFormatsKHR(device, _surface, &formatCount, null);
			if (formatCount != 0)
			{
				for (var i = 0; i < formatCount; ++i)
				{
					outDetails.Formats.Add(SurfaceFormatKHR());
				}
				vkGetPhysicalDeviceSurfaceFormatsKHR(device, _surface, &formatCount, outDetails.Formats.Ptr);
			}

			uint32 presentModeCount = 0;
			vkGetPhysicalDeviceSurfacePresentModesKHR(device, _surface, &presentModeCount, null);
			if (presentModeCount != 0)
			{
				for (var i = 0; i < presentModeCount; ++i)
				{
					outDetails.PresentModes.Add(PresentModeKHR());
				}
				vkGetPhysicalDeviceSurfacePresentModesKHR(device, _surface, &presentModeCount, outDetails.PresentModes.Ptr);
			}
		}

		private uint32 RatePhysicalDevice(PhysicalDevice device)
		{
			uint32 score = 0;
			var properties = PhysicalDeviceProperties();
			var features = PhysicalDeviceFeatures();
			vkGetPhysicalDeviceProperties(device, &properties);
			vkGetPhysicalDeviceFeatures(device, &features);

			if (features.geometryShader == VK_FALSE)
			{
				return 0;
			}

			if (properties.deviceType == PhysicalDeviceType.DiscreteGpu)
			{
				score += 1000;
			}

			score += properties.limits.maxImageDimension2D;

			return score;
		}

		private void ReadShaderFile<T>(String path, List<T> outContent) where T : struct
		{
			var stream = scope FileStream();
			stream.Open(path, FileAccess.Read, FileShare.Read);
			var isReading = true;
			while (isReading)
			{
				switch (stream.Read<T>())
				{
					case .Ok(let val): outContent.Add(val);
					case .Err: isReading = false;
				}
			}
			stream.Close();
		}

		private Result<void> RecordCommandBuffers()
		{
			for (var i = 0; i < _commandBuffers.Count; ++i)
			{
				let commandBuffer = _commandBuffers[i];
				var commandBufferBeginInfo = CommandBufferBeginInfo();
				commandBufferBeginInfo.flags = 0;
				commandBufferBeginInfo.pInheritanceInfo = null;

				if (vkBeginCommandBuffer(commandBuffer, &commandBufferBeginInfo) != .Success)
				{
					return LogError("Failed to begin recording command buffer");
				}
				if (PerformRenderPass(i) == .Err)
				{
					return .Err;
				}
				if (vkEndCommandBuffer(commandBuffer) != .Success)
				{
					return LogError("Failed to record command buffer");
				}
			}

			return .Ok;
		}

		private Result<void> RecreateSwapchain()
		{
			var isMinimized = (SDL.GetWindowFlags(_window) & (uint32)SDL.WindowFlags.Minimized) != 0;
			var event = SDL.Event();
			while (isMinimized)
			{
				isMinimized = (SDL.GetWindowFlags(_window) & (uint32)SDL.WindowFlags.Minimized) != 0;
				SDL.WaitEvent(out event);
			}
			vkDeviceWaitIdle(_logicalDevice);

			CleanupSwapchain();

			if (
				CreateSwapchain() == .Err
				|| CreateImageViews() == .Err
				|| CreateRenderPass() == .Err
				|| CreateGraphicsPipeline() == .Err
				|| CreateFrameBuffers() == .Err
				|| CreateUniformBuffers() == .Err
				|| CreateDescriptorPool() == .Err
				|| CreateDescriptorSets() == .Err
				|| CreateCommandBuffers() == .Err
			)
			{
				return .Err;
			}

			return .Ok;
		}

		private Result<void> SelectPhysicalDevice()
		{
			uint32 deviceCount = 0;
			vkEnumeratePhysicalDevices(_instance, &deviceCount, null);
			if (deviceCount == 0)
			{
				return LogError("There are no graphics devices with Vulkan support on this system");
			}

			var devices = scope List<Vulkan.PhysicalDevice>(deviceCount);
			for (var i = 0; i < deviceCount; ++i)
			{
				devices.Add(Vulkan.PhysicalDevice());
			}
			vkEnumeratePhysicalDevices(_instance, &deviceCount, devices.Ptr);

			uint32 highestScore = 0;
			for (var device in devices)
			{
				if (!IsSuitablePhysicalDevice(device))
				{
					continue;
				}
				let score = RatePhysicalDevice(device);
				if (score > highestScore)
				{
					highestScore = score;
					_physicalDevice = device;
				}
			}

			if (highestScore == 0 || _physicalDevice == VK_NULL_HANDLE)
			{
				return LogError("Unable to find a suitable graphics device");
			}
			
			return .Ok;
		}

		private void SetWindow(SDL.Window* window)
		{
		    _window = window;
		}

		private void UpdateUniformBuffer(uint32 currentImageIndex)
		{
			void* data = ?;
			vkMapMemory(_logicalDevice, _uniformBufferMemories[currentImageIndex], 0, sizeof(UniformBufferObject), 0, &data);
			Internal.MemCpy(data, &_uniformBufferObject, sizeof(UniformBufferObject));
			vkUnmapMemory(_logicalDevice, _uniformBufferMemories[currentImageIndex]);
		}
#endregion

#region Static Methods
		private static Result<void> LogError(String message)
		{
			let prefix = "Vulkan: ";
			Console.Error.Write(prefix);
			Console.Error.WriteLine(message);
			return .Err;
		}
#endregion

#region Structs
		private struct QueueFamilyIndices
		{
			public uint32 GraphicsFamily;
			public uint32 PresentFamily;
		}

		private class SwapchainSupportDetails
		{
			#region Public

			#region Constructors
			public this()
			{
				Capabilities = SurfaceCapabilitiesKHR();
				Formats = new List<SurfaceFormatKHR>();
				PresentModes = new List<PresentModeKHR>();
			}
			#endregion

			#region Members
			public SurfaceCapabilitiesKHR Capabilities;
			public List<SurfaceFormatKHR> Formats;
			public List<PresentModeKHR> PresentModes;
			#endregion

			#region Member Methods
			public Extent2D ChooseSwapExtent(SDL.Window* window)
			{
				if (Capabilities.currentExtent.width != uint32.MaxValue)
				{
					return Capabilities.currentExtent;
				}
				
				int32 width = 0;
				int32 height = 0;
				SDL.GetWindowSize(window, out width, out height);

				var extent = Extent2D((uint32)width, (uint32)height);
				extent.width = Math.Max(
					Capabilities.minImageExtent.width,
					Math.Min(
						Capabilities.maxImageExtent.width,
						extent.width
					)
				);
				extent.height = Math.Max(
					Capabilities.minImageExtent.height,
					Math.Min(
						Capabilities.maxImageExtent.height,
					extent.height
					)
				);
				return extent;
			}

			public PresentModeKHR ChooseSwapPresentMode()
			{
				for (let presentMode in PresentModes)
				{
					if (presentMode == PresentModeKHR.MailboxKHR)
					{
						return presentMode;
					}
				}
				return PresentModeKHR.FifoKHR;
			}

			public SurfaceFormatKHR ChooseSwapSurfaceFormat()
			{
				for (let format in Formats)
				{
					if (format.format == Format.B8G8R8A8Srgb && format.colorSpace == ColorSpaceKHR.SrgbNonlinearKHR)
					{
						return format;
					}
				}
				return Formats[0];
			}

			#endregion

			public ~this()
			{
				delete Formats;
				delete PresentModes;
			}
		}

		private struct UniformBufferObject
		{
			#region Public

			#region Constructors
			public this()
			{
				this = default;
			}

			public this(Matrix model, Matrix view, Matrix projection)
			{
				Model = model;
				View = view;
				Projection = projection;
			}
			#endregion

			#region Members
			public Matrix Model { get; }
			public Matrix View { get; }
			public Matrix Projection { get; }
			#endregion

			#endregion
		}
#endregion

#endregion

		public ~this()
		{
			vkDeviceWaitIdle(_logicalDevice);

			CleanupSwapchain();

			vkDestroyDescriptorSetLayout(_logicalDevice, _descriptorSetLayout, _allocationCallbacks);

			vkDestroyBuffer(_logicalDevice, _indexBuffer, _allocationCallbacks);
			vkFreeMemory(_logicalDevice, _indexBufferMemory, _allocationCallbacks);

			vkDestroyBuffer(_logicalDevice, _vertexBuffer, _allocationCallbacks);
			vkFreeMemory(_logicalDevice, _vertexBufferMemory, _allocationCallbacks);

			for (var i = 0; i < MAX_FRAMES_IN_FLIGHT; ++i)
			{
				vkDestroySemaphore(_logicalDevice, _imageAvailableSemaphores[i], _allocationCallbacks);
				vkDestroySemaphore(_logicalDevice, _renderFinishedSemaphores[i], _allocationCallbacks);
				vkDestroyFence(_logicalDevice, _inFlightFences[i], _allocationCallbacks);
			}
			
			vkDestroyCommandPool(_logicalDevice, _commandPool, _allocationCallbacks);
			vkDestroyDevice(_logicalDevice, _allocationCallbacks);
			if (_surface != UNINITIALIZED_SURFACE)
			{
				vkDestroySurfaceKHR(_instance, (SurfaceKHR)_surface, _allocationCallbacks);
			}
			vkDestroyInstance(_instance, _allocationCallbacks);

			delete _commandBuffers;
			delete _descriptorSets;
			delete _dynamicStates;
			delete _imageAvailableSemaphores;
			delete _imagesInFlight;
			delete _inFlightFences;
			delete _renderFinishedSemaphores;
			delete _requiredExtensionNames;
			delete _swapchainFrameBuffers;
			delete _swapchainImageViews;
			delete _swapchainImages;
			delete _swapchainSupportDetails;
			delete _swapchains;
			delete _validationLayers;
			delete _uniformBuffers;
			delete _uniformBufferMemories;
			delete _waitStages;

			for (var i = 0; i < MAX_FRAMES_IN_FLIGHT; ++i)
			{
				delete _signalSemaphores[i];
				delete _waitSemaphores[i];
			}
			delete _signalSemaphores;
			delete _waitSemaphores;

			delete _vertices;
			delete _indices;
		}
	}
}