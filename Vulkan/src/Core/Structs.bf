using System;

namespace Vulkan 
{
	[CRepr]
	public struct ApplicationInfo 
	{
		public readonly StructureType sType = .ApplicationInfo;
		public void* pNext = null;
		public char8* pApplicationName = default;
		public uint32 applicationVersion = default;
		public char8* pEngineName = default;
		public uint32 engineVersion = default;
		public uint32 apiVersion = default;

		public this() {}
		public this(char8* pApplicationName_,uint32 applicationVersion_,char8* pEngineName_,uint32 engineVersion_,uint32 apiVersion_)
		{
			pApplicationName = pApplicationName_;
			applicationVersion = applicationVersion_;
			pEngineName = pEngineName_;
			engineVersion = engineVersion_;
			apiVersion = apiVersion_;
		}
	}

	[CRepr]
	public struct InstanceCreateInfo 
	{
		public readonly StructureType sType = .InstanceCreateInfo;
		public void* pNext = null;
		public InstanceCreateFlags flags = default;
		public ApplicationInfo* pApplicationInfo = default;
		public uint32 enabledLayerCount = default;
		public char8** ppEnabledLayerNames = default;
		public uint32 enabledExtensionCount = default;
		public char8** ppEnabledExtensionNames = default;

		public this() {}
		public this(InstanceCreateFlags flags_,ApplicationInfo* pApplicationInfo_,uint32 enabledLayerCount_,char8** ppEnabledLayerNames_,uint32 enabledExtensionCount_,char8** ppEnabledExtensionNames_)
		{
			flags = flags_;
			pApplicationInfo = pApplicationInfo_;
			enabledLayerCount = enabledLayerCount_;
			ppEnabledLayerNames = ppEnabledLayerNames_;
			enabledExtensionCount = enabledExtensionCount_;
			ppEnabledExtensionNames = ppEnabledExtensionNames_;
		}
	}

	[CRepr]
	public struct AllocationCallbacks 
	{
		public void* pUserData = default;
		public PFN_vkAllocationFunction pfnAllocation = default;
		public PFN_vkReallocationFunction pfnReallocation = default;
		public PFN_vkFreeFunction pfnFree = default;
		public PFN_vkInternalAllocationNotification pfnInternalAllocation = default;
		public PFN_vkInternalFreeNotification pfnInternalFree = default;

		public this() {}
		public this(void* pUserData_,PFN_vkAllocationFunction pfnAllocation_,PFN_vkReallocationFunction pfnReallocation_,PFN_vkFreeFunction pfnFree_,PFN_vkInternalAllocationNotification pfnInternalAllocation_,PFN_vkInternalFreeNotification pfnInternalFree_)
		{
			pUserData = pUserData_;
			pfnAllocation = pfnAllocation_;
			pfnReallocation = pfnReallocation_;
			pfnFree = pfnFree_;
			pfnInternalAllocation = pfnInternalAllocation_;
			pfnInternalFree = pfnInternalFree_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFeatures 
	{
		public Bool32 robustBufferAccess = default;
		public Bool32 fullDrawIndexUint32 = default;
		public Bool32 imageCubeArray = default;
		public Bool32 independentBlend = default;
		public Bool32 geometryShader = default;
		public Bool32 tessellationShader = default;
		public Bool32 sampleRateShading = default;
		public Bool32 dualSrcBlend = default;
		public Bool32 logicOp = default;
		public Bool32 multiDrawIndirect = default;
		public Bool32 drawIndirectFirstInstance = default;
		public Bool32 depthClamp = default;
		public Bool32 depthBiasClamp = default;
		public Bool32 fillModeNonSolid = default;
		public Bool32 depthBounds = default;
		public Bool32 wideLines = default;
		public Bool32 largePoints = default;
		public Bool32 alphaToOne = default;
		public Bool32 multiViewport = default;
		public Bool32 samplerAnisotropy = default;
		public Bool32 textureCompressionETC2 = default;
		public Bool32 textureCompressionASTC_LDR = default;
		public Bool32 textureCompressionBC = default;
		public Bool32 occlusionQueryPrecise = default;
		public Bool32 pipelineStatisticsQuery = default;
		public Bool32 vertexPipelineStoresAndAtomics = default;
		public Bool32 fragmentStoresAndAtomics = default;
		public Bool32 shaderTessellationAndGeometryPointSize = default;
		public Bool32 shaderImageGatherExtended = default;
		public Bool32 shaderStorageImageExtendedFormats = default;
		public Bool32 shaderStorageImageMultisample = default;
		public Bool32 shaderStorageImageReadWithoutFormat = default;
		public Bool32 shaderStorageImageWriteWithoutFormat = default;
		public Bool32 shaderUniformBufferArrayDynamicIndexing = default;
		public Bool32 shaderSampledImageArrayDynamicIndexing = default;
		public Bool32 shaderStorageBufferArrayDynamicIndexing = default;
		public Bool32 shaderStorageImageArrayDynamicIndexing = default;
		public Bool32 shaderClipDistance = default;
		public Bool32 shaderCullDistance = default;
		public Bool32 shaderFloat64 = default;
		public Bool32 shaderInt64 = default;
		public Bool32 shaderInt16 = default;
		public Bool32 shaderResourceResidency = default;
		public Bool32 shaderResourceMinLod = default;
		public Bool32 sparseBinding = default;
		public Bool32 sparseResidencyBuffer = default;
		public Bool32 sparseResidencyImage2D = default;
		public Bool32 sparseResidencyImage3D = default;
		public Bool32 sparseResidency2Samples = default;
		public Bool32 sparseResidency4Samples = default;
		public Bool32 sparseResidency8Samples = default;
		public Bool32 sparseResidency16Samples = default;
		public Bool32 sparseResidencyAliased = default;
		public Bool32 variableMultisampleRate = default;
		public Bool32 inheritedQueries = default;

		public this() {}
		public this(Bool32 robustBufferAccess_,Bool32 fullDrawIndexUint32_,Bool32 imageCubeArray_,Bool32 independentBlend_,Bool32 geometryShader_,Bool32 tessellationShader_,Bool32 sampleRateShading_,Bool32 dualSrcBlend_,Bool32 logicOp_,Bool32 multiDrawIndirect_,Bool32 drawIndirectFirstInstance_,Bool32 depthClamp_,Bool32 depthBiasClamp_,Bool32 fillModeNonSolid_,Bool32 depthBounds_,Bool32 wideLines_,Bool32 largePoints_,Bool32 alphaToOne_,Bool32 multiViewport_,Bool32 samplerAnisotropy_,Bool32 textureCompressionETC2_,Bool32 textureCompressionASTC_LDR_,Bool32 textureCompressionBC_,Bool32 occlusionQueryPrecise_,Bool32 pipelineStatisticsQuery_,Bool32 vertexPipelineStoresAndAtomics_,Bool32 fragmentStoresAndAtomics_,Bool32 shaderTessellationAndGeometryPointSize_,Bool32 shaderImageGatherExtended_,Bool32 shaderStorageImageExtendedFormats_,Bool32 shaderStorageImageMultisample_,Bool32 shaderStorageImageReadWithoutFormat_,Bool32 shaderStorageImageWriteWithoutFormat_,Bool32 shaderUniformBufferArrayDynamicIndexing_,Bool32 shaderSampledImageArrayDynamicIndexing_,Bool32 shaderStorageBufferArrayDynamicIndexing_,Bool32 shaderStorageImageArrayDynamicIndexing_,Bool32 shaderClipDistance_,Bool32 shaderCullDistance_,Bool32 shaderFloat64_,Bool32 shaderInt64_,Bool32 shaderInt16_,Bool32 shaderResourceResidency_,Bool32 shaderResourceMinLod_,Bool32 sparseBinding_,Bool32 sparseResidencyBuffer_,Bool32 sparseResidencyImage2D_,Bool32 sparseResidencyImage3D_,Bool32 sparseResidency2Samples_,Bool32 sparseResidency4Samples_,Bool32 sparseResidency8Samples_,Bool32 sparseResidency16Samples_,Bool32 sparseResidencyAliased_,Bool32 variableMultisampleRate_,Bool32 inheritedQueries_)
		{
			robustBufferAccess = robustBufferAccess_;
			fullDrawIndexUint32 = fullDrawIndexUint32_;
			imageCubeArray = imageCubeArray_;
			independentBlend = independentBlend_;
			geometryShader = geometryShader_;
			tessellationShader = tessellationShader_;
			sampleRateShading = sampleRateShading_;
			dualSrcBlend = dualSrcBlend_;
			logicOp = logicOp_;
			multiDrawIndirect = multiDrawIndirect_;
			drawIndirectFirstInstance = drawIndirectFirstInstance_;
			depthClamp = depthClamp_;
			depthBiasClamp = depthBiasClamp_;
			fillModeNonSolid = fillModeNonSolid_;
			depthBounds = depthBounds_;
			wideLines = wideLines_;
			largePoints = largePoints_;
			alphaToOne = alphaToOne_;
			multiViewport = multiViewport_;
			samplerAnisotropy = samplerAnisotropy_;
			textureCompressionETC2 = textureCompressionETC2_;
			textureCompressionASTC_LDR = textureCompressionASTC_LDR_;
			textureCompressionBC = textureCompressionBC_;
			occlusionQueryPrecise = occlusionQueryPrecise_;
			pipelineStatisticsQuery = pipelineStatisticsQuery_;
			vertexPipelineStoresAndAtomics = vertexPipelineStoresAndAtomics_;
			fragmentStoresAndAtomics = fragmentStoresAndAtomics_;
			shaderTessellationAndGeometryPointSize = shaderTessellationAndGeometryPointSize_;
			shaderImageGatherExtended = shaderImageGatherExtended_;
			shaderStorageImageExtendedFormats = shaderStorageImageExtendedFormats_;
			shaderStorageImageMultisample = shaderStorageImageMultisample_;
			shaderStorageImageReadWithoutFormat = shaderStorageImageReadWithoutFormat_;
			shaderStorageImageWriteWithoutFormat = shaderStorageImageWriteWithoutFormat_;
			shaderUniformBufferArrayDynamicIndexing = shaderUniformBufferArrayDynamicIndexing_;
			shaderSampledImageArrayDynamicIndexing = shaderSampledImageArrayDynamicIndexing_;
			shaderStorageBufferArrayDynamicIndexing = shaderStorageBufferArrayDynamicIndexing_;
			shaderStorageImageArrayDynamicIndexing = shaderStorageImageArrayDynamicIndexing_;
			shaderClipDistance = shaderClipDistance_;
			shaderCullDistance = shaderCullDistance_;
			shaderFloat64 = shaderFloat64_;
			shaderInt64 = shaderInt64_;
			shaderInt16 = shaderInt16_;
			shaderResourceResidency = shaderResourceResidency_;
			shaderResourceMinLod = shaderResourceMinLod_;
			sparseBinding = sparseBinding_;
			sparseResidencyBuffer = sparseResidencyBuffer_;
			sparseResidencyImage2D = sparseResidencyImage2D_;
			sparseResidencyImage3D = sparseResidencyImage3D_;
			sparseResidency2Samples = sparseResidency2Samples_;
			sparseResidency4Samples = sparseResidency4Samples_;
			sparseResidency8Samples = sparseResidency8Samples_;
			sparseResidency16Samples = sparseResidency16Samples_;
			sparseResidencyAliased = sparseResidencyAliased_;
			variableMultisampleRate = variableMultisampleRate_;
			inheritedQueries = inheritedQueries_;
		}
	}

	[CRepr]
	public struct FormatProperties 
	{
		public FormatFeatureFlags linearTilingFeatures = default;
		public FormatFeatureFlags optimalTilingFeatures = default;
		public FormatFeatureFlags bufferFeatures = default;

		public this() {}
		public this(FormatFeatureFlags linearTilingFeatures_,FormatFeatureFlags optimalTilingFeatures_,FormatFeatureFlags bufferFeatures_)
		{
			linearTilingFeatures = linearTilingFeatures_;
			optimalTilingFeatures = optimalTilingFeatures_;
			bufferFeatures = bufferFeatures_;
		}
	}

	[CRepr]
	public struct Extent3D 
	{
		public uint32 width = default;
		public uint32 height = default;
		public uint32 depth = default;

		public this() {}
		public this(uint32 width_,uint32 height_,uint32 depth_)
		{
			width = width_;
			height = height_;
			depth = depth_;
		}
	}

	[CRepr]
	public struct ImageFormatProperties 
	{
		public Extent3D maxExtent = default;
		public uint32 maxMipLevels = default;
		public uint32 maxArrayLayers = default;
		public SampleCountFlags sampleCounts = default;
		public DeviceSize maxResourceSize = default;

		public this() {}
		public this(Extent3D maxExtent_,uint32 maxMipLevels_,uint32 maxArrayLayers_,SampleCountFlags sampleCounts_,DeviceSize maxResourceSize_)
		{
			maxExtent = maxExtent_;
			maxMipLevels = maxMipLevels_;
			maxArrayLayers = maxArrayLayers_;
			sampleCounts = sampleCounts_;
			maxResourceSize = maxResourceSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceLimits 
	{
		public uint32 maxImageDimension1D = default;
		public uint32 maxImageDimension2D = default;
		public uint32 maxImageDimension3D = default;
		public uint32 maxImageDimensionCube = default;
		public uint32 maxImageArrayLayers = default;
		public uint32 maxTexelBufferElements = default;
		public uint32 maxUniformBufferRange = default;
		public uint32 maxStorageBufferRange = default;
		public uint32 maxPushConstantsSize = default;
		public uint32 maxMemoryAllocationCount = default;
		public uint32 maxSamplerAllocationCount = default;
		public DeviceSize bufferImageGranularity = default;
		public DeviceSize sparseAddressSpaceSize = default;
		public uint32 maxBoundDescriptorSets = default;
		public uint32 maxPerStageDescriptorSamplers = default;
		public uint32 maxPerStageDescriptorUniformBuffers = default;
		public uint32 maxPerStageDescriptorStorageBuffers = default;
		public uint32 maxPerStageDescriptorSampledImages = default;
		public uint32 maxPerStageDescriptorStorageImages = default;
		public uint32 maxPerStageDescriptorInputAttachments = default;
		public uint32 maxPerStageResources = default;
		public uint32 maxDescriptorSetSamplers = default;
		public uint32 maxDescriptorSetUniformBuffers = default;
		public uint32 maxDescriptorSetUniformBuffersDynamic = default;
		public uint32 maxDescriptorSetStorageBuffers = default;
		public uint32 maxDescriptorSetStorageBuffersDynamic = default;
		public uint32 maxDescriptorSetSampledImages = default;
		public uint32 maxDescriptorSetStorageImages = default;
		public uint32 maxDescriptorSetInputAttachments = default;
		public uint32 maxVertexInputAttributes = default;
		public uint32 maxVertexInputBindings = default;
		public uint32 maxVertexInputAttributeOffset = default;
		public uint32 maxVertexInputBindingStride = default;
		public uint32 maxVertexOutputComponents = default;
		public uint32 maxTessellationGenerationLevel = default;
		public uint32 maxTessellationPatchSize = default;
		public uint32 maxTessellationControlPerVertexInputComponents = default;
		public uint32 maxTessellationControlPerVertexOutputComponents = default;
		public uint32 maxTessellationControlPerPatchOutputComponents = default;
		public uint32 maxTessellationControlTotalOutputComponents = default;
		public uint32 maxTessellationEvaluationInputComponents = default;
		public uint32 maxTessellationEvaluationOutputComponents = default;
		public uint32 maxGeometryShaderInvocations = default;
		public uint32 maxGeometryInputComponents = default;
		public uint32 maxGeometryOutputComponents = default;
		public uint32 maxGeometryOutputVertices = default;
		public uint32 maxGeometryTotalOutputComponents = default;
		public uint32 maxFragmentInputComponents = default;
		public uint32 maxFragmentOutputAttachments = default;
		public uint32 maxFragmentDualSrcAttachments = default;
		public uint32 maxFragmentCombinedOutputResources = default;
		public uint32 maxComputeSharedMemorySize = default;
		public uint32[3] maxComputeWorkGroupCount = default;
		public uint32 maxComputeWorkGroupInvocations = default;
		public uint32[3] maxComputeWorkGroupSize = default;
		public uint32 subPixelPrecisionBits = default;
		public uint32 subTexelPrecisionBits = default;
		public uint32 mipmapPrecisionBits = default;
		public uint32 maxDrawIndexedIndexValue = default;
		public uint32 maxDrawIndirectCount = default;
		public float maxSamplerLodBias = default;
		public float maxSamplerAnisotropy = default;
		public uint32 maxViewports = default;
		public uint32[2] maxViewportDimensions = default;
		public float[2] viewportBoundsRange = default;
		public uint32 viewportSubPixelBits = default;
		public uint minMemoryMapAlignment = default;
		public DeviceSize minTexelBufferOffsetAlignment = default;
		public DeviceSize minUniformBufferOffsetAlignment = default;
		public DeviceSize minStorageBufferOffsetAlignment = default;
		public int32 minTexelOffset = default;
		public uint32 maxTexelOffset = default;
		public int32 minTexelGatherOffset = default;
		public uint32 maxTexelGatherOffset = default;
		public float minInterpolationOffset = default;
		public float maxInterpolationOffset = default;
		public uint32 subPixelInterpolationOffsetBits = default;
		public uint32 maxFramebufferWidth = default;
		public uint32 maxFramebufferHeight = default;
		public uint32 maxFramebufferLayers = default;
		public SampleCountFlags framebufferColorSampleCounts = default;
		public SampleCountFlags framebufferDepthSampleCounts = default;
		public SampleCountFlags framebufferStencilSampleCounts = default;
		public SampleCountFlags framebufferNoAttachmentsSampleCounts = default;
		public uint32 maxColorAttachments = default;
		public SampleCountFlags sampledImageColorSampleCounts = default;
		public SampleCountFlags sampledImageIntegerSampleCounts = default;
		public SampleCountFlags sampledImageDepthSampleCounts = default;
		public SampleCountFlags sampledImageStencilSampleCounts = default;
		public SampleCountFlags storageImageSampleCounts = default;
		public uint32 maxSampleMaskWords = default;
		public Bool32 timestampComputeAndGraphics = default;
		public float timestampPeriod = default;
		public uint32 maxClipDistances = default;
		public uint32 maxCullDistances = default;
		public uint32 maxCombinedClipAndCullDistances = default;
		public uint32 discreteQueuePriorities = default;
		public float[2] pointSizeRange = default;
		public float[2] lineWidthRange = default;
		public float pointSizeGranularity = default;
		public float lineWidthGranularity = default;
		public Bool32 strictLines = default;
		public Bool32 standardSampleLocations = default;
		public DeviceSize optimalBufferCopyOffsetAlignment = default;
		public DeviceSize optimalBufferCopyRowPitchAlignment = default;
		public DeviceSize nonCoherentAtomSize = default;

		public this() {}
		public this(uint32 maxImageDimension1D_,uint32 maxImageDimension2D_,uint32 maxImageDimension3D_,uint32 maxImageDimensionCube_,uint32 maxImageArrayLayers_,uint32 maxTexelBufferElements_,uint32 maxUniformBufferRange_,uint32 maxStorageBufferRange_,uint32 maxPushConstantsSize_,uint32 maxMemoryAllocationCount_,uint32 maxSamplerAllocationCount_,DeviceSize bufferImageGranularity_,DeviceSize sparseAddressSpaceSize_,uint32 maxBoundDescriptorSets_,uint32 maxPerStageDescriptorSamplers_,uint32 maxPerStageDescriptorUniformBuffers_,uint32 maxPerStageDescriptorStorageBuffers_,uint32 maxPerStageDescriptorSampledImages_,uint32 maxPerStageDescriptorStorageImages_,uint32 maxPerStageDescriptorInputAttachments_,uint32 maxPerStageResources_,uint32 maxDescriptorSetSamplers_,uint32 maxDescriptorSetUniformBuffers_,uint32 maxDescriptorSetUniformBuffersDynamic_,uint32 maxDescriptorSetStorageBuffers_,uint32 maxDescriptorSetStorageBuffersDynamic_,uint32 maxDescriptorSetSampledImages_,uint32 maxDescriptorSetStorageImages_,uint32 maxDescriptorSetInputAttachments_,uint32 maxVertexInputAttributes_,uint32 maxVertexInputBindings_,uint32 maxVertexInputAttributeOffset_,uint32 maxVertexInputBindingStride_,uint32 maxVertexOutputComponents_,uint32 maxTessellationGenerationLevel_,uint32 maxTessellationPatchSize_,uint32 maxTessellationControlPerVertexInputComponents_,uint32 maxTessellationControlPerVertexOutputComponents_,uint32 maxTessellationControlPerPatchOutputComponents_,uint32 maxTessellationControlTotalOutputComponents_,uint32 maxTessellationEvaluationInputComponents_,uint32 maxTessellationEvaluationOutputComponents_,uint32 maxGeometryShaderInvocations_,uint32 maxGeometryInputComponents_,uint32 maxGeometryOutputComponents_,uint32 maxGeometryOutputVertices_,uint32 maxGeometryTotalOutputComponents_,uint32 maxFragmentInputComponents_,uint32 maxFragmentOutputAttachments_,uint32 maxFragmentDualSrcAttachments_,uint32 maxFragmentCombinedOutputResources_,uint32 maxComputeSharedMemorySize_,uint32[3] maxComputeWorkGroupCount_,uint32 maxComputeWorkGroupInvocations_,uint32[3] maxComputeWorkGroupSize_,uint32 subPixelPrecisionBits_,uint32 subTexelPrecisionBits_,uint32 mipmapPrecisionBits_,uint32 maxDrawIndexedIndexValue_,uint32 maxDrawIndirectCount_,float maxSamplerLodBias_,float maxSamplerAnisotropy_,uint32 maxViewports_,uint32[2] maxViewportDimensions_,float[2] viewportBoundsRange_,uint32 viewportSubPixelBits_,uint minMemoryMapAlignment_,DeviceSize minTexelBufferOffsetAlignment_,DeviceSize minUniformBufferOffsetAlignment_,DeviceSize minStorageBufferOffsetAlignment_,int32 minTexelOffset_,uint32 maxTexelOffset_,int32 minTexelGatherOffset_,uint32 maxTexelGatherOffset_,float minInterpolationOffset_,float maxInterpolationOffset_,uint32 subPixelInterpolationOffsetBits_,uint32 maxFramebufferWidth_,uint32 maxFramebufferHeight_,uint32 maxFramebufferLayers_,SampleCountFlags framebufferColorSampleCounts_,SampleCountFlags framebufferDepthSampleCounts_,SampleCountFlags framebufferStencilSampleCounts_,SampleCountFlags framebufferNoAttachmentsSampleCounts_,uint32 maxColorAttachments_,SampleCountFlags sampledImageColorSampleCounts_,SampleCountFlags sampledImageIntegerSampleCounts_,SampleCountFlags sampledImageDepthSampleCounts_,SampleCountFlags sampledImageStencilSampleCounts_,SampleCountFlags storageImageSampleCounts_,uint32 maxSampleMaskWords_,Bool32 timestampComputeAndGraphics_,float timestampPeriod_,uint32 maxClipDistances_,uint32 maxCullDistances_,uint32 maxCombinedClipAndCullDistances_,uint32 discreteQueuePriorities_,float[2] pointSizeRange_,float[2] lineWidthRange_,float pointSizeGranularity_,float lineWidthGranularity_,Bool32 strictLines_,Bool32 standardSampleLocations_,DeviceSize optimalBufferCopyOffsetAlignment_,DeviceSize optimalBufferCopyRowPitchAlignment_,DeviceSize nonCoherentAtomSize_)
		{
			maxImageDimension1D = maxImageDimension1D_;
			maxImageDimension2D = maxImageDimension2D_;
			maxImageDimension3D = maxImageDimension3D_;
			maxImageDimensionCube = maxImageDimensionCube_;
			maxImageArrayLayers = maxImageArrayLayers_;
			maxTexelBufferElements = maxTexelBufferElements_;
			maxUniformBufferRange = maxUniformBufferRange_;
			maxStorageBufferRange = maxStorageBufferRange_;
			maxPushConstantsSize = maxPushConstantsSize_;
			maxMemoryAllocationCount = maxMemoryAllocationCount_;
			maxSamplerAllocationCount = maxSamplerAllocationCount_;
			bufferImageGranularity = bufferImageGranularity_;
			sparseAddressSpaceSize = sparseAddressSpaceSize_;
			maxBoundDescriptorSets = maxBoundDescriptorSets_;
			maxPerStageDescriptorSamplers = maxPerStageDescriptorSamplers_;
			maxPerStageDescriptorUniformBuffers = maxPerStageDescriptorUniformBuffers_;
			maxPerStageDescriptorStorageBuffers = maxPerStageDescriptorStorageBuffers_;
			maxPerStageDescriptorSampledImages = maxPerStageDescriptorSampledImages_;
			maxPerStageDescriptorStorageImages = maxPerStageDescriptorStorageImages_;
			maxPerStageDescriptorInputAttachments = maxPerStageDescriptorInputAttachments_;
			maxPerStageResources = maxPerStageResources_;
			maxDescriptorSetSamplers = maxDescriptorSetSamplers_;
			maxDescriptorSetUniformBuffers = maxDescriptorSetUniformBuffers_;
			maxDescriptorSetUniformBuffersDynamic = maxDescriptorSetUniformBuffersDynamic_;
			maxDescriptorSetStorageBuffers = maxDescriptorSetStorageBuffers_;
			maxDescriptorSetStorageBuffersDynamic = maxDescriptorSetStorageBuffersDynamic_;
			maxDescriptorSetSampledImages = maxDescriptorSetSampledImages_;
			maxDescriptorSetStorageImages = maxDescriptorSetStorageImages_;
			maxDescriptorSetInputAttachments = maxDescriptorSetInputAttachments_;
			maxVertexInputAttributes = maxVertexInputAttributes_;
			maxVertexInputBindings = maxVertexInputBindings_;
			maxVertexInputAttributeOffset = maxVertexInputAttributeOffset_;
			maxVertexInputBindingStride = maxVertexInputBindingStride_;
			maxVertexOutputComponents = maxVertexOutputComponents_;
			maxTessellationGenerationLevel = maxTessellationGenerationLevel_;
			maxTessellationPatchSize = maxTessellationPatchSize_;
			maxTessellationControlPerVertexInputComponents = maxTessellationControlPerVertexInputComponents_;
			maxTessellationControlPerVertexOutputComponents = maxTessellationControlPerVertexOutputComponents_;
			maxTessellationControlPerPatchOutputComponents = maxTessellationControlPerPatchOutputComponents_;
			maxTessellationControlTotalOutputComponents = maxTessellationControlTotalOutputComponents_;
			maxTessellationEvaluationInputComponents = maxTessellationEvaluationInputComponents_;
			maxTessellationEvaluationOutputComponents = maxTessellationEvaluationOutputComponents_;
			maxGeometryShaderInvocations = maxGeometryShaderInvocations_;
			maxGeometryInputComponents = maxGeometryInputComponents_;
			maxGeometryOutputComponents = maxGeometryOutputComponents_;
			maxGeometryOutputVertices = maxGeometryOutputVertices_;
			maxGeometryTotalOutputComponents = maxGeometryTotalOutputComponents_;
			maxFragmentInputComponents = maxFragmentInputComponents_;
			maxFragmentOutputAttachments = maxFragmentOutputAttachments_;
			maxFragmentDualSrcAttachments = maxFragmentDualSrcAttachments_;
			maxFragmentCombinedOutputResources = maxFragmentCombinedOutputResources_;
			maxComputeSharedMemorySize = maxComputeSharedMemorySize_;
			maxComputeWorkGroupCount = maxComputeWorkGroupCount_;
			maxComputeWorkGroupInvocations = maxComputeWorkGroupInvocations_;
			maxComputeWorkGroupSize = maxComputeWorkGroupSize_;
			subPixelPrecisionBits = subPixelPrecisionBits_;
			subTexelPrecisionBits = subTexelPrecisionBits_;
			mipmapPrecisionBits = mipmapPrecisionBits_;
			maxDrawIndexedIndexValue = maxDrawIndexedIndexValue_;
			maxDrawIndirectCount = maxDrawIndirectCount_;
			maxSamplerLodBias = maxSamplerLodBias_;
			maxSamplerAnisotropy = maxSamplerAnisotropy_;
			maxViewports = maxViewports_;
			maxViewportDimensions = maxViewportDimensions_;
			viewportBoundsRange = viewportBoundsRange_;
			viewportSubPixelBits = viewportSubPixelBits_;
			minMemoryMapAlignment = minMemoryMapAlignment_;
			minTexelBufferOffsetAlignment = minTexelBufferOffsetAlignment_;
			minUniformBufferOffsetAlignment = minUniformBufferOffsetAlignment_;
			minStorageBufferOffsetAlignment = minStorageBufferOffsetAlignment_;
			minTexelOffset = minTexelOffset_;
			maxTexelOffset = maxTexelOffset_;
			minTexelGatherOffset = minTexelGatherOffset_;
			maxTexelGatherOffset = maxTexelGatherOffset_;
			minInterpolationOffset = minInterpolationOffset_;
			maxInterpolationOffset = maxInterpolationOffset_;
			subPixelInterpolationOffsetBits = subPixelInterpolationOffsetBits_;
			maxFramebufferWidth = maxFramebufferWidth_;
			maxFramebufferHeight = maxFramebufferHeight_;
			maxFramebufferLayers = maxFramebufferLayers_;
			framebufferColorSampleCounts = framebufferColorSampleCounts_;
			framebufferDepthSampleCounts = framebufferDepthSampleCounts_;
			framebufferStencilSampleCounts = framebufferStencilSampleCounts_;
			framebufferNoAttachmentsSampleCounts = framebufferNoAttachmentsSampleCounts_;
			maxColorAttachments = maxColorAttachments_;
			sampledImageColorSampleCounts = sampledImageColorSampleCounts_;
			sampledImageIntegerSampleCounts = sampledImageIntegerSampleCounts_;
			sampledImageDepthSampleCounts = sampledImageDepthSampleCounts_;
			sampledImageStencilSampleCounts = sampledImageStencilSampleCounts_;
			storageImageSampleCounts = storageImageSampleCounts_;
			maxSampleMaskWords = maxSampleMaskWords_;
			timestampComputeAndGraphics = timestampComputeAndGraphics_;
			timestampPeriod = timestampPeriod_;
			maxClipDistances = maxClipDistances_;
			maxCullDistances = maxCullDistances_;
			maxCombinedClipAndCullDistances = maxCombinedClipAndCullDistances_;
			discreteQueuePriorities = discreteQueuePriorities_;
			pointSizeRange = pointSizeRange_;
			lineWidthRange = lineWidthRange_;
			pointSizeGranularity = pointSizeGranularity_;
			lineWidthGranularity = lineWidthGranularity_;
			strictLines = strictLines_;
			standardSampleLocations = standardSampleLocations_;
			optimalBufferCopyOffsetAlignment = optimalBufferCopyOffsetAlignment_;
			optimalBufferCopyRowPitchAlignment = optimalBufferCopyRowPitchAlignment_;
			nonCoherentAtomSize = nonCoherentAtomSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSparseProperties 
	{
		public Bool32 residencyStandard2DBlockShape = default;
		public Bool32 residencyStandard2DMultisampleBlockShape = default;
		public Bool32 residencyStandard3DBlockShape = default;
		public Bool32 residencyAlignedMipSize = default;
		public Bool32 residencyNonResidentStrict = default;

		public this() {}
		public this(Bool32 residencyStandard2DBlockShape_,Bool32 residencyStandard2DMultisampleBlockShape_,Bool32 residencyStandard3DBlockShape_,Bool32 residencyAlignedMipSize_,Bool32 residencyNonResidentStrict_)
		{
			residencyStandard2DBlockShape = residencyStandard2DBlockShape_;
			residencyStandard2DMultisampleBlockShape = residencyStandard2DMultisampleBlockShape_;
			residencyStandard3DBlockShape = residencyStandard3DBlockShape_;
			residencyAlignedMipSize = residencyAlignedMipSize_;
			residencyNonResidentStrict = residencyNonResidentStrict_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceProperties 
	{
		public uint32 apiVersion = default;
		public uint32 driverVersion = default;
		public uint32 vendorID = default;
		public uint32 deviceID = default;
		public PhysicalDeviceType deviceType = default;
		public char8[VK_MAX_PHYSICAL_DEVICE_NAME_SIZE] deviceName = default;
		public uint8[VK_UUID_SIZE] pipelineCacheUUID = default;
		public PhysicalDeviceLimits limits = default;
		public PhysicalDeviceSparseProperties sparseProperties = default;

		public this() {}
		public this(uint32 apiVersion_,uint32 driverVersion_,uint32 vendorID_,uint32 deviceID_,PhysicalDeviceType deviceType_,char8[Vulkan.VK_MAX_PHYSICAL_DEVICE_NAME_SIZE] deviceName_,uint8[Vulkan.VK_UUID_SIZE] pipelineCacheUUID_,PhysicalDeviceLimits limits_,PhysicalDeviceSparseProperties sparseProperties_)
		{
			apiVersion = apiVersion_;
			driverVersion = driverVersion_;
			vendorID = vendorID_;
			deviceID = deviceID_;
			deviceType = deviceType_;
			deviceName = deviceName_;
			pipelineCacheUUID = pipelineCacheUUID_;
			limits = limits_;
			sparseProperties = sparseProperties_;
		}
	}

	[CRepr]
	public struct QueueFamilyProperties 
	{
		public QueueFlags queueFlags = default;
		public uint32 queueCount = default;
		public uint32 timestampValidBits = default;
		public Extent3D minImageTransferGranularity = default;

		public this() {}
		public this(QueueFlags queueFlags_,uint32 queueCount_,uint32 timestampValidBits_,Extent3D minImageTransferGranularity_)
		{
			queueFlags = queueFlags_;
			queueCount = queueCount_;
			timestampValidBits = timestampValidBits_;
			minImageTransferGranularity = minImageTransferGranularity_;
		}
	}

	[CRepr]
	public struct MemoryType 
	{
		public MemoryPropertyFlags propertyFlags = default;
		public uint32 heapIndex = default;

		public this() {}
		public this(MemoryPropertyFlags propertyFlags_,uint32 heapIndex_)
		{
			propertyFlags = propertyFlags_;
			heapIndex = heapIndex_;
		}
	}

	[CRepr]
	public struct MemoryHeap 
	{
		public DeviceSize size = default;
		public MemoryHeapFlags flags = default;

		public this() {}
		public this(DeviceSize size_,MemoryHeapFlags flags_)
		{
			size = size_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMemoryProperties 
	{
		public uint32 memoryTypeCount = default;
		public MemoryType[VK_MAX_MEMORY_TYPES] memoryTypes = default;
		public uint32 memoryHeapCount = default;
		public MemoryHeap[VK_MAX_MEMORY_HEAPS] memoryHeaps = default;

		public this() {}
		public this(uint32 memoryTypeCount_,MemoryType[Vulkan.VK_MAX_MEMORY_TYPES] memoryTypes_,uint32 memoryHeapCount_,MemoryHeap[Vulkan.VK_MAX_MEMORY_HEAPS] memoryHeaps_)
		{
			memoryTypeCount = memoryTypeCount_;
			memoryTypes = memoryTypes_;
			memoryHeapCount = memoryHeapCount_;
			memoryHeaps = memoryHeaps_;
		}
	}

	[CRepr]
	public struct DeviceQueueCreateInfo 
	{
		public readonly StructureType sType = .DeviceQueueCreateInfo;
		public void* pNext = null;
		public DeviceQueueCreateFlags flags = default;
		public uint32 queueFamilyIndex = default;
		public uint32 queueCount = default;
		public float* pQueuePriorities = default;

		public this() {}
		public this(DeviceQueueCreateFlags flags_,uint32 queueFamilyIndex_,uint32 queueCount_,float* pQueuePriorities_)
		{
			flags = flags_;
			queueFamilyIndex = queueFamilyIndex_;
			queueCount = queueCount_;
			pQueuePriorities = pQueuePriorities_;
		}
	}

	[CRepr]
	public struct DeviceCreateInfo 
	{
		public readonly StructureType sType = .DeviceCreateInfo;
		public void* pNext = null;
		public DeviceCreateFlags flags = default;
		public uint32 queueCreateInfoCount = default;
		public DeviceQueueCreateInfo* pQueueCreateInfos = default;
		public uint32 enabledLayerCount = default;
		public char8** ppEnabledLayerNames = default;
		public uint32 enabledExtensionCount = default;
		public char8** ppEnabledExtensionNames = default;
		public PhysicalDeviceFeatures* pEnabledFeatures = default;

		public this() {}
		public this(DeviceCreateFlags flags_,uint32 queueCreateInfoCount_,DeviceQueueCreateInfo* pQueueCreateInfos_,uint32 enabledLayerCount_,char8** ppEnabledLayerNames_,uint32 enabledExtensionCount_,char8** ppEnabledExtensionNames_,PhysicalDeviceFeatures* pEnabledFeatures_)
		{
			flags = flags_;
			queueCreateInfoCount = queueCreateInfoCount_;
			pQueueCreateInfos = pQueueCreateInfos_;
			enabledLayerCount = enabledLayerCount_;
			ppEnabledLayerNames = ppEnabledLayerNames_;
			enabledExtensionCount = enabledExtensionCount_;
			ppEnabledExtensionNames = ppEnabledExtensionNames_;
			pEnabledFeatures = pEnabledFeatures_;
		}
	}

	[CRepr]
	public struct ExtensionProperties 
	{
		public char8[VK_MAX_EXTENSION_NAME_SIZE] extensionName = default;
		public uint32 specVersion = default;

		public this() {}
		public this(char8[Vulkan.VK_MAX_EXTENSION_NAME_SIZE] extensionName_,uint32 specVersion_)
		{
			extensionName = extensionName_;
			specVersion = specVersion_;
		}
	}

	[CRepr]
	public struct LayerProperties 
	{
		public char8[VK_MAX_EXTENSION_NAME_SIZE] layerName = default;
		public uint32 specVersion = default;
		public uint32 implementationVersion = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;

		public this() {}
		public this(char8[Vulkan.VK_MAX_EXTENSION_NAME_SIZE] layerName_,uint32 specVersion_,uint32 implementationVersion_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_)
		{
			layerName = layerName_;
			specVersion = specVersion_;
			implementationVersion = implementationVersion_;
			description = description_;
		}
	}

	[CRepr]
	public struct SubmitInfo 
	{
		public readonly StructureType sType = .SubmitInfo;
		public void* pNext = null;
		public uint32 waitSemaphoreCount = default;
		public Semaphore* pWaitSemaphores = default;
		public PipelineStageFlags* pWaitDstStageMask = default;
		public uint32 commandBufferCount = default;
		public CommandBuffer* pCommandBuffers = default;
		public uint32 signalSemaphoreCount = default;
		public Semaphore* pSignalSemaphores = default;

		public this() {}
		public this(uint32 waitSemaphoreCount_,Semaphore* pWaitSemaphores_,PipelineStageFlags* pWaitDstStageMask_,uint32 commandBufferCount_,CommandBuffer* pCommandBuffers_,uint32 signalSemaphoreCount_,Semaphore* pSignalSemaphores_)
		{
			waitSemaphoreCount = waitSemaphoreCount_;
			pWaitSemaphores = pWaitSemaphores_;
			pWaitDstStageMask = pWaitDstStageMask_;
			commandBufferCount = commandBufferCount_;
			pCommandBuffers = pCommandBuffers_;
			signalSemaphoreCount = signalSemaphoreCount_;
			pSignalSemaphores = pSignalSemaphores_;
		}
	}

	[CRepr]
	public struct MemoryAllocateInfo 
	{
		public readonly StructureType sType = .MemoryAllocateInfo;
		public void* pNext = null;
		public DeviceSize allocationSize = default;
		public uint32 memoryTypeIndex = default;

		public this() {}
		public this(DeviceSize allocationSize_,uint32 memoryTypeIndex_)
		{
			allocationSize = allocationSize_;
			memoryTypeIndex = memoryTypeIndex_;
		}
	}

	[CRepr]
	public struct MappedMemoryRange 
	{
		public readonly StructureType sType = .MappedMemoryRange;
		public void* pNext = null;
		public DeviceMemory memory = default;
		public DeviceSize offset = default;
		public DeviceSize size = default;

		public this() {}
		public this(DeviceMemory memory_,DeviceSize offset_,DeviceSize size_)
		{
			memory = memory_;
			offset = offset_;
			size = size_;
		}
	}

	[CRepr]
	public struct MemoryRequirements 
	{
		public DeviceSize size = default;
		public DeviceSize alignment = default;
		public uint32 memoryTypeBits = default;

		public this() {}
		public this(DeviceSize size_,DeviceSize alignment_,uint32 memoryTypeBits_)
		{
			size = size_;
			alignment = alignment_;
			memoryTypeBits = memoryTypeBits_;
		}
	}

	[CRepr]
	public struct SparseImageFormatProperties 
	{
		public ImageAspectFlags aspectMask = default;
		public Extent3D imageGranularity = default;
		public SparseImageFormatFlags flags = default;

		public this() {}
		public this(ImageAspectFlags aspectMask_,Extent3D imageGranularity_,SparseImageFormatFlags flags_)
		{
			aspectMask = aspectMask_;
			imageGranularity = imageGranularity_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct SparseImageMemoryRequirements 
	{
		public SparseImageFormatProperties formatProperties = default;
		public uint32 imageMipTailFirstLod = default;
		public DeviceSize imageMipTailSize = default;
		public DeviceSize imageMipTailOffset = default;
		public DeviceSize imageMipTailStride = default;

		public this() {}
		public this(SparseImageFormatProperties formatProperties_,uint32 imageMipTailFirstLod_,DeviceSize imageMipTailSize_,DeviceSize imageMipTailOffset_,DeviceSize imageMipTailStride_)
		{
			formatProperties = formatProperties_;
			imageMipTailFirstLod = imageMipTailFirstLod_;
			imageMipTailSize = imageMipTailSize_;
			imageMipTailOffset = imageMipTailOffset_;
			imageMipTailStride = imageMipTailStride_;
		}
	}

	[CRepr]
	public struct SparseMemoryBind 
	{
		public DeviceSize resourceOffset = default;
		public DeviceSize size = default;
		public DeviceMemory memory = default;
		public DeviceSize memoryOffset = default;
		public SparseMemoryBindFlags flags = default;

		public this() {}
		public this(DeviceSize resourceOffset_,DeviceSize size_,DeviceMemory memory_,DeviceSize memoryOffset_,SparseMemoryBindFlags flags_)
		{
			resourceOffset = resourceOffset_;
			size = size_;
			memory = memory_;
			memoryOffset = memoryOffset_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct SparseBufferMemoryBindInfo 
	{
		public Buffer buffer = default;
		public uint32 bindCount = default;
		public SparseMemoryBind* pBinds = default;

		public this() {}
		public this(Buffer buffer_,uint32 bindCount_,SparseMemoryBind* pBinds_)
		{
			buffer = buffer_;
			bindCount = bindCount_;
			pBinds = pBinds_;
		}
	}

	[CRepr]
	public struct SparseImageOpaqueMemoryBindInfo 
	{
		public Image image = default;
		public uint32 bindCount = default;
		public SparseMemoryBind* pBinds = default;

		public this() {}
		public this(Image image_,uint32 bindCount_,SparseMemoryBind* pBinds_)
		{
			image = image_;
			bindCount = bindCount_;
			pBinds = pBinds_;
		}
	}

	[CRepr]
	public struct ImageSubresource 
	{
		public ImageAspectFlags aspectMask = default;
		public uint32 mipLevel = default;
		public uint32 arrayLayer = default;

		public this() {}
		public this(ImageAspectFlags aspectMask_,uint32 mipLevel_,uint32 arrayLayer_)
		{
			aspectMask = aspectMask_;
			mipLevel = mipLevel_;
			arrayLayer = arrayLayer_;
		}
	}

	[CRepr]
	public struct Offset3D 
	{
		public int32 x = default;
		public int32 y = default;
		public int32 z = default;

		public this() {}
		public this(int32 x_,int32 y_,int32 z_)
		{
			x = x_;
			y = y_;
			z = z_;
		}
	}

	[CRepr]
	public struct SparseImageMemoryBind 
	{
		public ImageSubresource subresource = default;
		public Offset3D offset = default;
		public Extent3D extent = default;
		public DeviceMemory memory = default;
		public DeviceSize memoryOffset = default;
		public SparseMemoryBindFlags flags = default;

		public this() {}
		public this(ImageSubresource subresource_,Offset3D offset_,Extent3D extent_,DeviceMemory memory_,DeviceSize memoryOffset_,SparseMemoryBindFlags flags_)
		{
			subresource = subresource_;
			offset = offset_;
			extent = extent_;
			memory = memory_;
			memoryOffset = memoryOffset_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct SparseImageMemoryBindInfo 
	{
		public Image image = default;
		public uint32 bindCount = default;
		public SparseImageMemoryBind* pBinds = default;

		public this() {}
		public this(Image image_,uint32 bindCount_,SparseImageMemoryBind* pBinds_)
		{
			image = image_;
			bindCount = bindCount_;
			pBinds = pBinds_;
		}
	}

	[CRepr]
	public struct BindSparseInfo 
	{
		public readonly StructureType sType = .BindSparseInfo;
		public void* pNext = null;
		public uint32 waitSemaphoreCount = default;
		public Semaphore* pWaitSemaphores = default;
		public uint32 bufferBindCount = default;
		public SparseBufferMemoryBindInfo* pBufferBinds = default;
		public uint32 imageOpaqueBindCount = default;
		public SparseImageOpaqueMemoryBindInfo* pImageOpaqueBinds = default;
		public uint32 imageBindCount = default;
		public SparseImageMemoryBindInfo* pImageBinds = default;
		public uint32 signalSemaphoreCount = default;
		public Semaphore* pSignalSemaphores = default;

		public this() {}
		public this(uint32 waitSemaphoreCount_,Semaphore* pWaitSemaphores_,uint32 bufferBindCount_,SparseBufferMemoryBindInfo* pBufferBinds_,uint32 imageOpaqueBindCount_,SparseImageOpaqueMemoryBindInfo* pImageOpaqueBinds_,uint32 imageBindCount_,SparseImageMemoryBindInfo* pImageBinds_,uint32 signalSemaphoreCount_,Semaphore* pSignalSemaphores_)
		{
			waitSemaphoreCount = waitSemaphoreCount_;
			pWaitSemaphores = pWaitSemaphores_;
			bufferBindCount = bufferBindCount_;
			pBufferBinds = pBufferBinds_;
			imageOpaqueBindCount = imageOpaqueBindCount_;
			pImageOpaqueBinds = pImageOpaqueBinds_;
			imageBindCount = imageBindCount_;
			pImageBinds = pImageBinds_;
			signalSemaphoreCount = signalSemaphoreCount_;
			pSignalSemaphores = pSignalSemaphores_;
		}
	}

	[CRepr]
	public struct FenceCreateInfo 
	{
		public readonly StructureType sType = .FenceCreateInfo;
		public void* pNext = null;
		public FenceCreateFlags flags = default;

		public this() {}
		public this(FenceCreateFlags flags_)
		{
			flags = flags_;
		}
	}

	[CRepr]
	public struct SemaphoreCreateInfo 
	{
		public readonly StructureType sType = .SemaphoreCreateInfo;
		public void* pNext = null;
		public SemaphoreCreateFlags flags = default;

		public this() {}
		public this(SemaphoreCreateFlags flags_)
		{
			flags = flags_;
		}
	}

	[CRepr]
	public struct EventCreateInfo 
	{
		public readonly StructureType sType = .EventCreateInfo;
		public void* pNext = null;
		public EventCreateFlags flags = default;

		public this() {}
		public this(EventCreateFlags flags_)
		{
			flags = flags_;
		}
	}

	[CRepr]
	public struct QueryPoolCreateInfo 
	{
		public readonly StructureType sType = .QueryPoolCreateInfo;
		public void* pNext = null;
		public QueryPoolCreateFlags flags = default;
		public QueryType queryType = default;
		public uint32 queryCount = default;
		public QueryPipelineStatisticFlags pipelineStatistics = default;

		public this() {}
		public this(QueryPoolCreateFlags flags_,QueryType queryType_,uint32 queryCount_,QueryPipelineStatisticFlags pipelineStatistics_)
		{
			flags = flags_;
			queryType = queryType_;
			queryCount = queryCount_;
			pipelineStatistics = pipelineStatistics_;
		}
	}

	[CRepr]
	public struct BufferCreateInfo 
	{
		public readonly StructureType sType = .BufferCreateInfo;
		public void* pNext = null;
		public BufferCreateFlags flags = default;
		public DeviceSize size = default;
		public BufferUsageFlags usage = default;
		public SharingMode sharingMode = default;
		public uint32 queueFamilyIndexCount = default;
		public uint32* pQueueFamilyIndices = default;

		public this() {}
		public this(BufferCreateFlags flags_,DeviceSize size_,BufferUsageFlags usage_,SharingMode sharingMode_,uint32 queueFamilyIndexCount_,uint32* pQueueFamilyIndices_)
		{
			flags = flags_;
			size = size_;
			usage = usage_;
			sharingMode = sharingMode_;
			queueFamilyIndexCount = queueFamilyIndexCount_;
			pQueueFamilyIndices = pQueueFamilyIndices_;
		}
	}

	[CRepr]
	public struct BufferViewCreateInfo 
	{
		public readonly StructureType sType = .BufferViewCreateInfo;
		public void* pNext = null;
		public BufferViewCreateFlags flags = default;
		public Buffer buffer = default;
		public Format format = default;
		public DeviceSize offset = default;
		public DeviceSize range = default;

		public this() {}
		public this(BufferViewCreateFlags flags_,Buffer buffer_,Format format_,DeviceSize offset_,DeviceSize range_)
		{
			flags = flags_;
			buffer = buffer_;
			format = format_;
			offset = offset_;
			range = range_;
		}
	}

	[CRepr]
	public struct ImageCreateInfo 
	{
		public readonly StructureType sType = .ImageCreateInfo;
		public void* pNext = null;
		public ImageCreateFlags flags = default;
		public ImageType imageType = default;
		public Format format = default;
		public Extent3D extent = default;
		public uint32 mipLevels = default;
		public uint32 arrayLayers = default;
		public SampleCountFlags samples = default;
		public ImageTiling tiling = default;
		public ImageUsageFlags usage = default;
		public SharingMode sharingMode = default;
		public uint32 queueFamilyIndexCount = default;
		public uint32* pQueueFamilyIndices = default;
		public ImageLayout initialLayout = default;

		public this() {}
		public this(ImageCreateFlags flags_,ImageType imageType_,Format format_,Extent3D extent_,uint32 mipLevels_,uint32 arrayLayers_,SampleCountFlags samples_,ImageTiling tiling_,ImageUsageFlags usage_,SharingMode sharingMode_,uint32 queueFamilyIndexCount_,uint32* pQueueFamilyIndices_,ImageLayout initialLayout_)
		{
			flags = flags_;
			imageType = imageType_;
			format = format_;
			extent = extent_;
			mipLevels = mipLevels_;
			arrayLayers = arrayLayers_;
			samples = samples_;
			tiling = tiling_;
			usage = usage_;
			sharingMode = sharingMode_;
			queueFamilyIndexCount = queueFamilyIndexCount_;
			pQueueFamilyIndices = pQueueFamilyIndices_;
			initialLayout = initialLayout_;
		}
	}

	[CRepr]
	public struct SubresourceLayout 
	{
		public DeviceSize offset = default;
		public DeviceSize size = default;
		public DeviceSize rowPitch = default;
		public DeviceSize arrayPitch = default;
		public DeviceSize depthPitch = default;

		public this() {}
		public this(DeviceSize offset_,DeviceSize size_,DeviceSize rowPitch_,DeviceSize arrayPitch_,DeviceSize depthPitch_)
		{
			offset = offset_;
			size = size_;
			rowPitch = rowPitch_;
			arrayPitch = arrayPitch_;
			depthPitch = depthPitch_;
		}
	}

	[CRepr]
	public struct ComponentMapping 
	{
		public ComponentSwizzle r = default;
		public ComponentSwizzle g = default;
		public ComponentSwizzle b = default;
		public ComponentSwizzle a = default;

		public this() {}
		public this(ComponentSwizzle r_,ComponentSwizzle g_,ComponentSwizzle b_,ComponentSwizzle a_)
		{
			r = r_;
			g = g_;
			b = b_;
			a = a_;
		}
	}

	[CRepr]
	public struct ImageSubresourceRange 
	{
		public ImageAspectFlags aspectMask = default;
		public uint32 baseMipLevel = default;
		public uint32 levelCount = default;
		public uint32 baseArrayLayer = default;
		public uint32 layerCount = default;

		public this() {}
		public this(ImageAspectFlags aspectMask_,uint32 baseMipLevel_,uint32 levelCount_,uint32 baseArrayLayer_,uint32 layerCount_)
		{
			aspectMask = aspectMask_;
			baseMipLevel = baseMipLevel_;
			levelCount = levelCount_;
			baseArrayLayer = baseArrayLayer_;
			layerCount = layerCount_;
		}
	}

	[CRepr]
	public struct ImageViewCreateInfo 
	{
		public readonly StructureType sType = .ImageViewCreateInfo;
		public void* pNext = null;
		public ImageViewCreateFlags flags = default;
		public Image image = default;
		public ImageViewType viewType = default;
		public Format format = default;
		public ComponentMapping components = default;
		public ImageSubresourceRange subresourceRange = default;

		public this() {}
		public this(ImageViewCreateFlags flags_,Image image_,ImageViewType viewType_,Format format_,ComponentMapping components_,ImageSubresourceRange subresourceRange_)
		{
			flags = flags_;
			image = image_;
			viewType = viewType_;
			format = format_;
			components = components_;
			subresourceRange = subresourceRange_;
		}
	}

	[CRepr]
	public struct ShaderModuleCreateInfo 
	{
		public readonly StructureType sType = .ShaderModuleCreateInfo;
		public void* pNext = null;
		public ShaderModuleCreateFlags flags = default;
		public uint codeSize = default;
		public uint32* pCode = default;

		public this() {}
		public this(ShaderModuleCreateFlags flags_,uint codeSize_,uint32* pCode_)
		{
			flags = flags_;
			codeSize = codeSize_;
			pCode = pCode_;
		}
	}

	[CRepr]
	public struct PipelineCacheCreateInfo 
	{
		public readonly StructureType sType = .PipelineCacheCreateInfo;
		public void* pNext = null;
		public PipelineCacheCreateFlags flags = default;
		public uint initialDataSize = default;
		public void* pInitialData = default;

		public this() {}
		public this(PipelineCacheCreateFlags flags_,uint initialDataSize_,void* pInitialData_)
		{
			flags = flags_;
			initialDataSize = initialDataSize_;
			pInitialData = pInitialData_;
		}
	}

	[CRepr]
	public struct SpecializationMapEntry 
	{
		public uint32 constantID = default;
		public uint32 offset = default;
		public uint size = default;

		public this() {}
		public this(uint32 constantID_,uint32 offset_,uint size_)
		{
			constantID = constantID_;
			offset = offset_;
			size = size_;
		}
	}

	[CRepr]
	public struct SpecializationInfo 
	{
		public uint32 mapEntryCount = default;
		public SpecializationMapEntry* pMapEntries = default;
		public uint dataSize = default;
		public void* pData = default;

		public this() {}
		public this(uint32 mapEntryCount_,SpecializationMapEntry* pMapEntries_,uint dataSize_,void* pData_)
		{
			mapEntryCount = mapEntryCount_;
			pMapEntries = pMapEntries_;
			dataSize = dataSize_;
			pData = pData_;
		}
	}

	[CRepr]
	public struct PipelineShaderStageCreateInfo 
	{
		public readonly StructureType sType = .PipelineShaderStageCreateInfo;
		public void* pNext = null;
		public PipelineShaderStageCreateFlags flags = default;
		public ShaderStageFlags stage = default;
		public ShaderModule module = default;
		public char8* pName = default;
		public SpecializationInfo* pSpecializationInfo = default;

		public this() {}
		public this(PipelineShaderStageCreateFlags flags_,ShaderStageFlags stage_,ShaderModule module_,char8* pName_,SpecializationInfo* pSpecializationInfo_)
		{
			flags = flags_;
			stage = stage_;
			module = module_;
			pName = pName_;
			pSpecializationInfo = pSpecializationInfo_;
		}
	}

	[CRepr]
	public struct VertexInputBindingDescription 
	{
		public uint32 binding = default;
		public uint32 stride = default;
		public VertexInputRate inputRate = default;

		public this() {}
		public this(uint32 binding_,uint32 stride_,VertexInputRate inputRate_)
		{
			binding = binding_;
			stride = stride_;
			inputRate = inputRate_;
		}
	}

	[CRepr]
	public struct VertexInputAttributeDescription 
	{
		public uint32 location = default;
		public uint32 binding = default;
		public Format format = default;
		public uint32 offset = default;

		public this() {}
		public this(uint32 location_,uint32 binding_,Format format_,uint32 offset_)
		{
			location = location_;
			binding = binding_;
			format = format_;
			offset = offset_;
		}
	}

	[CRepr]
	public struct PipelineVertexInputStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineVertexInputStateCreateInfo;
		public void* pNext = null;
		public PipelineVertexInputStateCreateFlags flags = default;
		public uint32 vertexBindingDescriptionCount = default;
		public VertexInputBindingDescription* pVertexBindingDescriptions = default;
		public uint32 vertexAttributeDescriptionCount = default;
		public VertexInputAttributeDescription* pVertexAttributeDescriptions = default;

		public this() {}
		public this(PipelineVertexInputStateCreateFlags flags_,uint32 vertexBindingDescriptionCount_,VertexInputBindingDescription* pVertexBindingDescriptions_,uint32 vertexAttributeDescriptionCount_,VertexInputAttributeDescription* pVertexAttributeDescriptions_)
		{
			flags = flags_;
			vertexBindingDescriptionCount = vertexBindingDescriptionCount_;
			pVertexBindingDescriptions = pVertexBindingDescriptions_;
			vertexAttributeDescriptionCount = vertexAttributeDescriptionCount_;
			pVertexAttributeDescriptions = pVertexAttributeDescriptions_;
		}
	}

	[CRepr]
	public struct PipelineInputAssemblyStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineInputAssemblyStateCreateInfo;
		public void* pNext = null;
		public PipelineInputAssemblyStateCreateFlags flags = default;
		public PrimitiveTopology topology = default;
		public Bool32 primitiveRestartEnable = default;

		public this() {}
		public this(PipelineInputAssemblyStateCreateFlags flags_,PrimitiveTopology topology_,Bool32 primitiveRestartEnable_)
		{
			flags = flags_;
			topology = topology_;
			primitiveRestartEnable = primitiveRestartEnable_;
		}
	}

	[CRepr]
	public struct PipelineTessellationStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineTessellationStateCreateInfo;
		public void* pNext = null;
		public PipelineTessellationStateCreateFlags flags = default;
		public uint32 patchControlPoints = default;

		public this() {}
		public this(PipelineTessellationStateCreateFlags flags_,uint32 patchControlPoints_)
		{
			flags = flags_;
			patchControlPoints = patchControlPoints_;
		}
	}

	[CRepr]
	public struct Viewport 
	{
		public float x = default;
		public float y = default;
		public float width = default;
		public float height = default;
		public float minDepth = default;
		public float maxDepth = default;

		public this() {}
		public this(float x_,float y_,float width_,float height_,float minDepth_,float maxDepth_)
		{
			x = x_;
			y = y_;
			width = width_;
			height = height_;
			minDepth = minDepth_;
			maxDepth = maxDepth_;
		}
	}

	[CRepr]
	public struct Offset2D 
	{
		public int32 x = default;
		public int32 y = default;

		public this() {}
		public this(int32 x_,int32 y_)
		{
			x = x_;
			y = y_;
		}
	}

	[CRepr]
	public struct Extent2D 
	{
		public uint32 width = default;
		public uint32 height = default;

		public this() {}
		public this(uint32 width_,uint32 height_)
		{
			width = width_;
			height = height_;
		}
	}

	[CRepr]
	public struct Rect2D 
	{
		public Offset2D offset = default;
		public Extent2D extent = default;

		public this() {}
		public this(Offset2D offset_,Extent2D extent_)
		{
			offset = offset_;
			extent = extent_;
		}
	}

	[CRepr]
	public struct PipelineViewportStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineViewportStateCreateInfo;
		public void* pNext = null;
		public PipelineViewportStateCreateFlags flags = default;
		public uint32 viewportCount = default;
		public Viewport* pViewports = default;
		public uint32 scissorCount = default;
		public Rect2D* pScissors = default;

		public this() {}
		public this(PipelineViewportStateCreateFlags flags_,uint32 viewportCount_,Viewport* pViewports_,uint32 scissorCount_,Rect2D* pScissors_)
		{
			flags = flags_;
			viewportCount = viewportCount_;
			pViewports = pViewports_;
			scissorCount = scissorCount_;
			pScissors = pScissors_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineRasterizationStateCreateInfo;
		public void* pNext = null;
		public PipelineRasterizationStateCreateFlags flags = default;
		public Bool32 depthClampEnable = default;
		public Bool32 rasterizerDiscardEnable = default;
		public PolygonMode polygonMode = default;
		public CullModeFlags cullMode = default;
		public FrontFace frontFace = default;
		public Bool32 depthBiasEnable = default;
		public float depthBiasConstantFactor = default;
		public float depthBiasClamp = default;
		public float depthBiasSlopeFactor = default;
		public float lineWidth = default;

		public this() {}
		public this(PipelineRasterizationStateCreateFlags flags_,Bool32 depthClampEnable_,Bool32 rasterizerDiscardEnable_,PolygonMode polygonMode_,CullModeFlags cullMode_,FrontFace frontFace_,Bool32 depthBiasEnable_,float depthBiasConstantFactor_,float depthBiasClamp_,float depthBiasSlopeFactor_,float lineWidth_)
		{
			flags = flags_;
			depthClampEnable = depthClampEnable_;
			rasterizerDiscardEnable = rasterizerDiscardEnable_;
			polygonMode = polygonMode_;
			cullMode = cullMode_;
			frontFace = frontFace_;
			depthBiasEnable = depthBiasEnable_;
			depthBiasConstantFactor = depthBiasConstantFactor_;
			depthBiasClamp = depthBiasClamp_;
			depthBiasSlopeFactor = depthBiasSlopeFactor_;
			lineWidth = lineWidth_;
		}
	}

	[CRepr]
	public struct PipelineMultisampleStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineMultisampleStateCreateInfo;
		public void* pNext = null;
		public PipelineMultisampleStateCreateFlags flags = default;
		public SampleCountFlags rasterizationSamples = default;
		public Bool32 sampleShadingEnable = default;
		public float minSampleShading = default;
		public SampleMask* pSampleMask = default;
		public Bool32 alphaToCoverageEnable = default;
		public Bool32 alphaToOneEnable = default;

		public this() {}
		public this(PipelineMultisampleStateCreateFlags flags_,SampleCountFlags rasterizationSamples_,Bool32 sampleShadingEnable_,float minSampleShading_,SampleMask* pSampleMask_,Bool32 alphaToCoverageEnable_,Bool32 alphaToOneEnable_)
		{
			flags = flags_;
			rasterizationSamples = rasterizationSamples_;
			sampleShadingEnable = sampleShadingEnable_;
			minSampleShading = minSampleShading_;
			pSampleMask = pSampleMask_;
			alphaToCoverageEnable = alphaToCoverageEnable_;
			alphaToOneEnable = alphaToOneEnable_;
		}
	}

	[CRepr]
	public struct StencilOpState 
	{
		public StencilOp failOp = default;
		public StencilOp passOp = default;
		public StencilOp depthFailOp = default;
		public CompareOp compareOp = default;
		public uint32 compareMask = default;
		public uint32 writeMask = default;
		public uint32 reference = default;

		public this() {}
		public this(StencilOp failOp_,StencilOp passOp_,StencilOp depthFailOp_,CompareOp compareOp_,uint32 compareMask_,uint32 writeMask_,uint32 reference_)
		{
			failOp = failOp_;
			passOp = passOp_;
			depthFailOp = depthFailOp_;
			compareOp = compareOp_;
			compareMask = compareMask_;
			writeMask = writeMask_;
			reference = reference_;
		}
	}

	[CRepr]
	public struct PipelineDepthStencilStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineDepthStencilStateCreateInfo;
		public void* pNext = null;
		public PipelineDepthStencilStateCreateFlags flags = default;
		public Bool32 depthTestEnable = default;
		public Bool32 depthWriteEnable = default;
		public CompareOp depthCompareOp = default;
		public Bool32 depthBoundsTestEnable = default;
		public Bool32 stencilTestEnable = default;
		public StencilOpState front = default;
		public StencilOpState back = default;
		public float minDepthBounds = default;
		public float maxDepthBounds = default;

		public this() {}
		public this(PipelineDepthStencilStateCreateFlags flags_,Bool32 depthTestEnable_,Bool32 depthWriteEnable_,CompareOp depthCompareOp_,Bool32 depthBoundsTestEnable_,Bool32 stencilTestEnable_,StencilOpState front_,StencilOpState back_,float minDepthBounds_,float maxDepthBounds_)
		{
			flags = flags_;
			depthTestEnable = depthTestEnable_;
			depthWriteEnable = depthWriteEnable_;
			depthCompareOp = depthCompareOp_;
			depthBoundsTestEnable = depthBoundsTestEnable_;
			stencilTestEnable = stencilTestEnable_;
			front = front_;
			back = back_;
			minDepthBounds = minDepthBounds_;
			maxDepthBounds = maxDepthBounds_;
		}
	}

	[CRepr]
	public struct PipelineColorBlendAttachmentState 
	{
		public Bool32 blendEnable = default;
		public BlendFactor srcColorBlendFactor = default;
		public BlendFactor dstColorBlendFactor = default;
		public BlendOp colorBlendOp = default;
		public BlendFactor srcAlphaBlendFactor = default;
		public BlendFactor dstAlphaBlendFactor = default;
		public BlendOp alphaBlendOp = default;
		public ColorComponentFlags colorWriteMask = default;

		public this() {}
		public this(Bool32 blendEnable_,BlendFactor srcColorBlendFactor_,BlendFactor dstColorBlendFactor_,BlendOp colorBlendOp_,BlendFactor srcAlphaBlendFactor_,BlendFactor dstAlphaBlendFactor_,BlendOp alphaBlendOp_,ColorComponentFlags colorWriteMask_)
		{
			blendEnable = blendEnable_;
			srcColorBlendFactor = srcColorBlendFactor_;
			dstColorBlendFactor = dstColorBlendFactor_;
			colorBlendOp = colorBlendOp_;
			srcAlphaBlendFactor = srcAlphaBlendFactor_;
			dstAlphaBlendFactor = dstAlphaBlendFactor_;
			alphaBlendOp = alphaBlendOp_;
			colorWriteMask = colorWriteMask_;
		}
	}

	[CRepr]
	public struct PipelineColorBlendStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineColorBlendStateCreateInfo;
		public void* pNext = null;
		public PipelineColorBlendStateCreateFlags flags = default;
		public Bool32 logicOpEnable = default;
		public LogicOp logicOp = default;
		public uint32 attachmentCount = default;
		public PipelineColorBlendAttachmentState* pAttachments = default;
		public float[4] blendConstants = default;

		public this() {}
		public this(PipelineColorBlendStateCreateFlags flags_,Bool32 logicOpEnable_,LogicOp logicOp_,uint32 attachmentCount_,PipelineColorBlendAttachmentState* pAttachments_,float[4] blendConstants_)
		{
			flags = flags_;
			logicOpEnable = logicOpEnable_;
			logicOp = logicOp_;
			attachmentCount = attachmentCount_;
			pAttachments = pAttachments_;
			blendConstants = blendConstants_;
		}
	}

	[CRepr]
	public struct PipelineDynamicStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineDynamicStateCreateInfo;
		public void* pNext = null;
		public PipelineDynamicStateCreateFlags flags = default;
		public uint32 dynamicStateCount = default;
		public DynamicState* pDynamicStates = default;

		public this() {}
		public this(PipelineDynamicStateCreateFlags flags_,uint32 dynamicStateCount_,DynamicState* pDynamicStates_)
		{
			flags = flags_;
			dynamicStateCount = dynamicStateCount_;
			pDynamicStates = pDynamicStates_;
		}
	}

	[CRepr]
	public struct GraphicsPipelineCreateInfo 
	{
		public readonly StructureType sType = .GraphicsPipelineCreateInfo;
		public void* pNext = null;
		public PipelineCreateFlags flags = default;
		public uint32 stageCount = default;
		public PipelineShaderStageCreateInfo* pStages = default;
		public PipelineVertexInputStateCreateInfo* pVertexInputState = default;
		public PipelineInputAssemblyStateCreateInfo* pInputAssemblyState = default;
		public PipelineTessellationStateCreateInfo* pTessellationState = default;
		public PipelineViewportStateCreateInfo* pViewportState = default;
		public PipelineRasterizationStateCreateInfo* pRasterizationState = default;
		public PipelineMultisampleStateCreateInfo* pMultisampleState = default;
		public PipelineDepthStencilStateCreateInfo* pDepthStencilState = default;
		public PipelineColorBlendStateCreateInfo* pColorBlendState = default;
		public PipelineDynamicStateCreateInfo* pDynamicState = default;
		public PipelineLayout layout = default;
		public RenderPass renderPass = default;
		public uint32 subpass = default;
		public Pipeline basePipelineHandle = default;
		public int32 basePipelineIndex = default;

		public this() {}
		public this(PipelineCreateFlags flags_,uint32 stageCount_,PipelineShaderStageCreateInfo* pStages_,PipelineVertexInputStateCreateInfo* pVertexInputState_,PipelineInputAssemblyStateCreateInfo* pInputAssemblyState_,PipelineTessellationStateCreateInfo* pTessellationState_,PipelineViewportStateCreateInfo* pViewportState_,PipelineRasterizationStateCreateInfo* pRasterizationState_,PipelineMultisampleStateCreateInfo* pMultisampleState_,PipelineDepthStencilStateCreateInfo* pDepthStencilState_,PipelineColorBlendStateCreateInfo* pColorBlendState_,PipelineDynamicStateCreateInfo* pDynamicState_,PipelineLayout layout_,RenderPass renderPass_,uint32 subpass_,Pipeline basePipelineHandle_,int32 basePipelineIndex_)
		{
			flags = flags_;
			stageCount = stageCount_;
			pStages = pStages_;
			pVertexInputState = pVertexInputState_;
			pInputAssemblyState = pInputAssemblyState_;
			pTessellationState = pTessellationState_;
			pViewportState = pViewportState_;
			pRasterizationState = pRasterizationState_;
			pMultisampleState = pMultisampleState_;
			pDepthStencilState = pDepthStencilState_;
			pColorBlendState = pColorBlendState_;
			pDynamicState = pDynamicState_;
			layout = layout_;
			renderPass = renderPass_;
			subpass = subpass_;
			basePipelineHandle = basePipelineHandle_;
			basePipelineIndex = basePipelineIndex_;
		}
	}

	[CRepr]
	public struct ComputePipelineCreateInfo 
	{
		public readonly StructureType sType = .ComputePipelineCreateInfo;
		public void* pNext = null;
		public PipelineCreateFlags flags = default;
		public PipelineShaderStageCreateInfo stage = default;
		public PipelineLayout layout = default;
		public Pipeline basePipelineHandle = default;
		public int32 basePipelineIndex = default;

		public this() {}
		public this(PipelineCreateFlags flags_,PipelineShaderStageCreateInfo stage_,PipelineLayout layout_,Pipeline basePipelineHandle_,int32 basePipelineIndex_)
		{
			flags = flags_;
			stage = stage_;
			layout = layout_;
			basePipelineHandle = basePipelineHandle_;
			basePipelineIndex = basePipelineIndex_;
		}
	}

	[CRepr]
	public struct PushConstantRange 
	{
		public ShaderStageFlags stageFlags = default;
		public uint32 offset = default;
		public uint32 size = default;

		public this() {}
		public this(ShaderStageFlags stageFlags_,uint32 offset_,uint32 size_)
		{
			stageFlags = stageFlags_;
			offset = offset_;
			size = size_;
		}
	}

	[CRepr]
	public struct PipelineLayoutCreateInfo 
	{
		public readonly StructureType sType = .PipelineLayoutCreateInfo;
		public void* pNext = null;
		public PipelineLayoutCreateFlags flags = default;
		public uint32 setLayoutCount = default;
		public DescriptorSetLayout* pSetLayouts = default;
		public uint32 pushConstantRangeCount = default;
		public PushConstantRange* pPushConstantRanges = default;

		public this() {}
		public this(PipelineLayoutCreateFlags flags_,uint32 setLayoutCount_,DescriptorSetLayout* pSetLayouts_,uint32 pushConstantRangeCount_,PushConstantRange* pPushConstantRanges_)
		{
			flags = flags_;
			setLayoutCount = setLayoutCount_;
			pSetLayouts = pSetLayouts_;
			pushConstantRangeCount = pushConstantRangeCount_;
			pPushConstantRanges = pPushConstantRanges_;
		}
	}

	[CRepr]
	public struct SamplerCreateInfo 
	{
		public readonly StructureType sType = .SamplerCreateInfo;
		public void* pNext = null;
		public SamplerCreateFlags flags = default;
		public Filter magFilter = default;
		public Filter minFilter = default;
		public SamplerMipmapMode mipmapMode = default;
		public SamplerAddressMode addressModeU = default;
		public SamplerAddressMode addressModeV = default;
		public SamplerAddressMode addressModeW = default;
		public float mipLodBias = default;
		public Bool32 anisotropyEnable = default;
		public float maxAnisotropy = default;
		public Bool32 compareEnable = default;
		public CompareOp compareOp = default;
		public float minLod = default;
		public float maxLod = default;
		public BorderColor borderColor = default;
		public Bool32 unnormalizedCoordinates = default;

		public this() {}
		public this(SamplerCreateFlags flags_,Filter magFilter_,Filter minFilter_,SamplerMipmapMode mipmapMode_,SamplerAddressMode addressModeU_,SamplerAddressMode addressModeV_,SamplerAddressMode addressModeW_,float mipLodBias_,Bool32 anisotropyEnable_,float maxAnisotropy_,Bool32 compareEnable_,CompareOp compareOp_,float minLod_,float maxLod_,BorderColor borderColor_,Bool32 unnormalizedCoordinates_)
		{
			flags = flags_;
			magFilter = magFilter_;
			minFilter = minFilter_;
			mipmapMode = mipmapMode_;
			addressModeU = addressModeU_;
			addressModeV = addressModeV_;
			addressModeW = addressModeW_;
			mipLodBias = mipLodBias_;
			anisotropyEnable = anisotropyEnable_;
			maxAnisotropy = maxAnisotropy_;
			compareEnable = compareEnable_;
			compareOp = compareOp_;
			minLod = minLod_;
			maxLod = maxLod_;
			borderColor = borderColor_;
			unnormalizedCoordinates = unnormalizedCoordinates_;
		}
	}

	[CRepr]
	public struct DescriptorSetLayoutBinding 
	{
		public uint32 binding = default;
		public DescriptorType descriptorType = default;
		public uint32 descriptorCount = default;
		public ShaderStageFlags stageFlags = default;
		public Sampler* pImmutableSamplers = default;

		public this() {}
		public this(uint32 binding_,DescriptorType descriptorType_,uint32 descriptorCount_,ShaderStageFlags stageFlags_,Sampler* pImmutableSamplers_)
		{
			binding = binding_;
			descriptorType = descriptorType_;
			descriptorCount = descriptorCount_;
			stageFlags = stageFlags_;
			pImmutableSamplers = pImmutableSamplers_;
		}
	}

	[CRepr]
	public struct DescriptorSetLayoutCreateInfo 
	{
		public readonly StructureType sType = .DescriptorSetLayoutCreateInfo;
		public void* pNext = null;
		public DescriptorSetLayoutCreateFlags flags = default;
		public uint32 bindingCount = default;
		public DescriptorSetLayoutBinding* pBindings = default;

		public this() {}
		public this(DescriptorSetLayoutCreateFlags flags_,uint32 bindingCount_,DescriptorSetLayoutBinding* pBindings_)
		{
			flags = flags_;
			bindingCount = bindingCount_;
			pBindings = pBindings_;
		}
	}

	[CRepr]
	public struct DescriptorPoolSize 
	{
		public DescriptorType type = default;
		public uint32 descriptorCount = default;

		public this() {}
		public this(DescriptorType type_,uint32 descriptorCount_)
		{
			type = type_;
			descriptorCount = descriptorCount_;
		}
	}

	[CRepr]
	public struct DescriptorPoolCreateInfo 
	{
		public readonly StructureType sType = .DescriptorPoolCreateInfo;
		public void* pNext = null;
		public DescriptorPoolCreateFlags flags = default;
		public uint32 maxSets = default;
		public uint32 poolSizeCount = default;
		public DescriptorPoolSize* pPoolSizes = default;

		public this() {}
		public this(DescriptorPoolCreateFlags flags_,uint32 maxSets_,uint32 poolSizeCount_,DescriptorPoolSize* pPoolSizes_)
		{
			flags = flags_;
			maxSets = maxSets_;
			poolSizeCount = poolSizeCount_;
			pPoolSizes = pPoolSizes_;
		}
	}

	[CRepr]
	public struct DescriptorSetAllocateInfo 
	{
		public readonly StructureType sType = .DescriptorSetAllocateInfo;
		public void* pNext = null;
		public DescriptorPool descriptorPool = default;
		public uint32 descriptorSetCount = default;
		public DescriptorSetLayout* pSetLayouts = default;

		public this() {}
		public this(DescriptorPool descriptorPool_,uint32 descriptorSetCount_,DescriptorSetLayout* pSetLayouts_)
		{
			descriptorPool = descriptorPool_;
			descriptorSetCount = descriptorSetCount_;
			pSetLayouts = pSetLayouts_;
		}
	}

	[CRepr]
	public struct DescriptorImageInfo 
	{
		public Sampler sampler = default;
		public ImageView imageView = default;
		public ImageLayout imageLayout = default;

		public this() {}
		public this(Sampler sampler_,ImageView imageView_,ImageLayout imageLayout_)
		{
			sampler = sampler_;
			imageView = imageView_;
			imageLayout = imageLayout_;
		}
	}

	[CRepr]
	public struct DescriptorBufferInfo 
	{
		public Buffer buffer = default;
		public DeviceSize offset = default;
		public DeviceSize range = default;

		public this() {}
		public this(Buffer buffer_,DeviceSize offset_,DeviceSize range_)
		{
			buffer = buffer_;
			offset = offset_;
			range = range_;
		}
	}

	[CRepr]
	public struct WriteDescriptorSet 
	{
		public readonly StructureType sType = .WriteDescriptorSet;
		public void* pNext = null;
		public DescriptorSet dstSet = default;
		public uint32 dstBinding = default;
		public uint32 dstArrayElement = default;
		public uint32 descriptorCount = default;
		public DescriptorType descriptorType = default;
		public DescriptorImageInfo* pImageInfo = default;
		public DescriptorBufferInfo* pBufferInfo = default;
		public BufferView* pTexelBufferView = default;

		public this() {}
		public this(DescriptorSet dstSet_,uint32 dstBinding_,uint32 dstArrayElement_,uint32 descriptorCount_,DescriptorType descriptorType_,DescriptorImageInfo* pImageInfo_,DescriptorBufferInfo* pBufferInfo_,BufferView* pTexelBufferView_)
		{
			dstSet = dstSet_;
			dstBinding = dstBinding_;
			dstArrayElement = dstArrayElement_;
			descriptorCount = descriptorCount_;
			descriptorType = descriptorType_;
			pImageInfo = pImageInfo_;
			pBufferInfo = pBufferInfo_;
			pTexelBufferView = pTexelBufferView_;
		}
	}

	[CRepr]
	public struct CopyDescriptorSet 
	{
		public readonly StructureType sType = .CopyDescriptorSet;
		public void* pNext = null;
		public DescriptorSet srcSet = default;
		public uint32 srcBinding = default;
		public uint32 srcArrayElement = default;
		public DescriptorSet dstSet = default;
		public uint32 dstBinding = default;
		public uint32 dstArrayElement = default;
		public uint32 descriptorCount = default;

		public this() {}
		public this(DescriptorSet srcSet_,uint32 srcBinding_,uint32 srcArrayElement_,DescriptorSet dstSet_,uint32 dstBinding_,uint32 dstArrayElement_,uint32 descriptorCount_)
		{
			srcSet = srcSet_;
			srcBinding = srcBinding_;
			srcArrayElement = srcArrayElement_;
			dstSet = dstSet_;
			dstBinding = dstBinding_;
			dstArrayElement = dstArrayElement_;
			descriptorCount = descriptorCount_;
		}
	}

	[CRepr]
	public struct FramebufferCreateInfo 
	{
		public readonly StructureType sType = .FramebufferCreateInfo;
		public void* pNext = null;
		public FramebufferCreateFlags flags = default;
		public RenderPass renderPass = default;
		public uint32 attachmentCount = default;
		public ImageView* pAttachments = default;
		public uint32 width = default;
		public uint32 height = default;
		public uint32 layers = default;

		public this() {}
		public this(FramebufferCreateFlags flags_,RenderPass renderPass_,uint32 attachmentCount_,ImageView* pAttachments_,uint32 width_,uint32 height_,uint32 layers_)
		{
			flags = flags_;
			renderPass = renderPass_;
			attachmentCount = attachmentCount_;
			pAttachments = pAttachments_;
			width = width_;
			height = height_;
			layers = layers_;
		}
	}

	[CRepr]
	public struct AttachmentDescription 
	{
		public AttachmentDescriptionFlags flags = default;
		public Format format = default;
		public SampleCountFlags samples = default;
		public AttachmentLoadOp loadOp = default;
		public AttachmentStoreOp storeOp = default;
		public AttachmentLoadOp stencilLoadOp = default;
		public AttachmentStoreOp stencilStoreOp = default;
		public ImageLayout initialLayout = default;
		public ImageLayout finalLayout = default;

		public this() {}
		public this(AttachmentDescriptionFlags flags_,Format format_,SampleCountFlags samples_,AttachmentLoadOp loadOp_,AttachmentStoreOp storeOp_,AttachmentLoadOp stencilLoadOp_,AttachmentStoreOp stencilStoreOp_,ImageLayout initialLayout_,ImageLayout finalLayout_)
		{
			flags = flags_;
			format = format_;
			samples = samples_;
			loadOp = loadOp_;
			storeOp = storeOp_;
			stencilLoadOp = stencilLoadOp_;
			stencilStoreOp = stencilStoreOp_;
			initialLayout = initialLayout_;
			finalLayout = finalLayout_;
		}
	}

	[CRepr]
	public struct AttachmentReference 
	{
		public uint32 attachment = default;
		public ImageLayout layout = default;

		public this() {}
		public this(uint32 attachment_,ImageLayout layout_)
		{
			attachment = attachment_;
			layout = layout_;
		}
	}

	[CRepr]
	public struct SubpassDescription 
	{
		public SubpassDescriptionFlags flags = default;
		public PipelineBindPoint pipelineBindPoint = default;
		public uint32 inputAttachmentCount = default;
		public AttachmentReference* pInputAttachments = default;
		public uint32 colorAttachmentCount = default;
		public AttachmentReference* pColorAttachments = default;
		public AttachmentReference* pResolveAttachments = default;
		public AttachmentReference* pDepthStencilAttachment = default;
		public uint32 preserveAttachmentCount = default;
		public uint32* pPreserveAttachments = default;

		public this() {}
		public this(SubpassDescriptionFlags flags_,PipelineBindPoint pipelineBindPoint_,uint32 inputAttachmentCount_,AttachmentReference* pInputAttachments_,uint32 colorAttachmentCount_,AttachmentReference* pColorAttachments_,AttachmentReference* pResolveAttachments_,AttachmentReference* pDepthStencilAttachment_,uint32 preserveAttachmentCount_,uint32* pPreserveAttachments_)
		{
			flags = flags_;
			pipelineBindPoint = pipelineBindPoint_;
			inputAttachmentCount = inputAttachmentCount_;
			pInputAttachments = pInputAttachments_;
			colorAttachmentCount = colorAttachmentCount_;
			pColorAttachments = pColorAttachments_;
			pResolveAttachments = pResolveAttachments_;
			pDepthStencilAttachment = pDepthStencilAttachment_;
			preserveAttachmentCount = preserveAttachmentCount_;
			pPreserveAttachments = pPreserveAttachments_;
		}
	}

	[CRepr]
	public struct SubpassDependency 
	{
		public uint32 srcSubpass = default;
		public uint32 dstSubpass = default;
		public PipelineStageFlags srcStageMask = default;
		public PipelineStageFlags dstStageMask = default;
		public AccessFlags srcAccessMask = default;
		public AccessFlags dstAccessMask = default;
		public DependencyFlags dependencyFlags = default;

		public this() {}
		public this(uint32 srcSubpass_,uint32 dstSubpass_,PipelineStageFlags srcStageMask_,PipelineStageFlags dstStageMask_,AccessFlags srcAccessMask_,AccessFlags dstAccessMask_,DependencyFlags dependencyFlags_)
		{
			srcSubpass = srcSubpass_;
			dstSubpass = dstSubpass_;
			srcStageMask = srcStageMask_;
			dstStageMask = dstStageMask_;
			srcAccessMask = srcAccessMask_;
			dstAccessMask = dstAccessMask_;
			dependencyFlags = dependencyFlags_;
		}
	}

	[CRepr]
	public struct RenderPassCreateInfo 
	{
		public readonly StructureType sType = .RenderPassCreateInfo;
		public void* pNext = null;
		public RenderPassCreateFlags flags = default;
		public uint32 attachmentCount = default;
		public AttachmentDescription* pAttachments = default;
		public uint32 subpassCount = default;
		public SubpassDescription* pSubpasses = default;
		public uint32 dependencyCount = default;
		public SubpassDependency* pDependencies = default;

		public this() {}
		public this(RenderPassCreateFlags flags_,uint32 attachmentCount_,AttachmentDescription* pAttachments_,uint32 subpassCount_,SubpassDescription* pSubpasses_,uint32 dependencyCount_,SubpassDependency* pDependencies_)
		{
			flags = flags_;
			attachmentCount = attachmentCount_;
			pAttachments = pAttachments_;
			subpassCount = subpassCount_;
			pSubpasses = pSubpasses_;
			dependencyCount = dependencyCount_;
			pDependencies = pDependencies_;
		}
	}

	[CRepr]
	public struct CommandPoolCreateInfo 
	{
		public readonly StructureType sType = .CommandPoolCreateInfo;
		public void* pNext = null;
		public CommandPoolCreateFlags flags = default;
		public uint32 queueFamilyIndex = default;

		public this() {}
		public this(CommandPoolCreateFlags flags_,uint32 queueFamilyIndex_)
		{
			flags = flags_;
			queueFamilyIndex = queueFamilyIndex_;
		}
	}

	[CRepr]
	public struct CommandBufferAllocateInfo 
	{
		public readonly StructureType sType = .CommandBufferAllocateInfo;
		public void* pNext = null;
		public CommandPool commandPool = default;
		public CommandBufferLevel level = default;
		public uint32 commandBufferCount = default;

		public this() {}
		public this(CommandPool commandPool_,CommandBufferLevel level_,uint32 commandBufferCount_)
		{
			commandPool = commandPool_;
			level = level_;
			commandBufferCount = commandBufferCount_;
		}
	}

	[CRepr]
	public struct CommandBufferInheritanceInfo 
	{
		public readonly StructureType sType = .CommandBufferInheritanceInfo;
		public void* pNext = null;
		public RenderPass renderPass = default;
		public uint32 subpass = default;
		public Framebuffer framebuffer = default;
		public Bool32 occlusionQueryEnable = default;
		public QueryControlFlags queryFlags = default;
		public QueryPipelineStatisticFlags pipelineStatistics = default;

		public this() {}
		public this(RenderPass renderPass_,uint32 subpass_,Framebuffer framebuffer_,Bool32 occlusionQueryEnable_,QueryControlFlags queryFlags_,QueryPipelineStatisticFlags pipelineStatistics_)
		{
			renderPass = renderPass_;
			subpass = subpass_;
			framebuffer = framebuffer_;
			occlusionQueryEnable = occlusionQueryEnable_;
			queryFlags = queryFlags_;
			pipelineStatistics = pipelineStatistics_;
		}
	}

	[CRepr]
	public struct CommandBufferBeginInfo 
	{
		public readonly StructureType sType = .CommandBufferBeginInfo;
		public void* pNext = null;
		public CommandBufferUsageFlags flags = default;
		public CommandBufferInheritanceInfo* pInheritanceInfo = default;

		public this() {}
		public this(CommandBufferUsageFlags flags_,CommandBufferInheritanceInfo* pInheritanceInfo_)
		{
			flags = flags_;
			pInheritanceInfo = pInheritanceInfo_;
		}
	}

	[CRepr]
	public struct BufferCopy 
	{
		public DeviceSize srcOffset = default;
		public DeviceSize dstOffset = default;
		public DeviceSize size = default;

		public this() {}
		public this(DeviceSize srcOffset_,DeviceSize dstOffset_,DeviceSize size_)
		{
			srcOffset = srcOffset_;
			dstOffset = dstOffset_;
			size = size_;
		}
	}

	[CRepr]
	public struct ImageSubresourceLayers 
	{
		public ImageAspectFlags aspectMask = default;
		public uint32 mipLevel = default;
		public uint32 baseArrayLayer = default;
		public uint32 layerCount = default;

		public this() {}
		public this(ImageAspectFlags aspectMask_,uint32 mipLevel_,uint32 baseArrayLayer_,uint32 layerCount_)
		{
			aspectMask = aspectMask_;
			mipLevel = mipLevel_;
			baseArrayLayer = baseArrayLayer_;
			layerCount = layerCount_;
		}
	}

	[CRepr]
	public struct ImageCopy 
	{
		public ImageSubresourceLayers srcSubresource = default;
		public Offset3D srcOffset = default;
		public ImageSubresourceLayers dstSubresource = default;
		public Offset3D dstOffset = default;
		public Extent3D extent = default;

		public this() {}
		public this(ImageSubresourceLayers srcSubresource_,Offset3D srcOffset_,ImageSubresourceLayers dstSubresource_,Offset3D dstOffset_,Extent3D extent_)
		{
			srcSubresource = srcSubresource_;
			srcOffset = srcOffset_;
			dstSubresource = dstSubresource_;
			dstOffset = dstOffset_;
			extent = extent_;
		}
	}

	[CRepr]
	public struct ImageBlit 
	{
		public ImageSubresourceLayers srcSubresource = default;
		public Offset3D[2] srcOffsets = default;
		public ImageSubresourceLayers dstSubresource = default;
		public Offset3D[2] dstOffsets = default;

		public this() {}
		public this(ImageSubresourceLayers srcSubresource_,Offset3D[2] srcOffsets_,ImageSubresourceLayers dstSubresource_,Offset3D[2] dstOffsets_)
		{
			srcSubresource = srcSubresource_;
			srcOffsets = srcOffsets_;
			dstSubresource = dstSubresource_;
			dstOffsets = dstOffsets_;
		}
	}

	[CRepr]
	public struct BufferImageCopy 
	{
		public DeviceSize bufferOffset = default;
		public uint32 bufferRowLength = default;
		public uint32 bufferImageHeight = default;
		public ImageSubresourceLayers imageSubresource = default;
		public Offset3D imageOffset = default;
		public Extent3D imageExtent = default;

		public this() {}
		public this(DeviceSize bufferOffset_,uint32 bufferRowLength_,uint32 bufferImageHeight_,ImageSubresourceLayers imageSubresource_,Offset3D imageOffset_,Extent3D imageExtent_)
		{
			bufferOffset = bufferOffset_;
			bufferRowLength = bufferRowLength_;
			bufferImageHeight = bufferImageHeight_;
			imageSubresource = imageSubresource_;
			imageOffset = imageOffset_;
			imageExtent = imageExtent_;
		}
	}

	[CRepr]
	public struct ClearDepthStencilValue 
	{
		public float depth = default;
		public uint32 stencil = default;

		public this() {
			this = default;
		}

		public this(float depth_,uint32 stencil_)
		{
			depth = depth_;
			stencil = stencil_;
		}
	}

	[CRepr]
	public struct ClearAttachment 
	{
		public ImageAspectFlags aspectMask = default;
		public uint32 colorAttachment = default;
		public ClearValue clearValue = default;

		public this() {}
		public this(ImageAspectFlags aspectMask_,uint32 colorAttachment_,ClearValue clearValue_)
		{
			aspectMask = aspectMask_;
			colorAttachment = colorAttachment_;
			clearValue = clearValue_;
		}
	}

	[CRepr]
	public struct ClearRect 
	{
		public Rect2D rect = default;
		public uint32 baseArrayLayer = default;
		public uint32 layerCount = default;

		public this() {}
		public this(Rect2D rect_,uint32 baseArrayLayer_,uint32 layerCount_)
		{
			rect = rect_;
			baseArrayLayer = baseArrayLayer_;
			layerCount = layerCount_;
		}
	}

	[CRepr]
	public struct ImageResolve 
	{
		public ImageSubresourceLayers srcSubresource = default;
		public Offset3D srcOffset = default;
		public ImageSubresourceLayers dstSubresource = default;
		public Offset3D dstOffset = default;
		public Extent3D extent = default;

		public this() {}
		public this(ImageSubresourceLayers srcSubresource_,Offset3D srcOffset_,ImageSubresourceLayers dstSubresource_,Offset3D dstOffset_,Extent3D extent_)
		{
			srcSubresource = srcSubresource_;
			srcOffset = srcOffset_;
			dstSubresource = dstSubresource_;
			dstOffset = dstOffset_;
			extent = extent_;
		}
	}

	[CRepr]
	public struct MemoryBarrier 
	{
		public readonly StructureType sType = .MemoryBarrier;
		public void* pNext = null;
		public AccessFlags srcAccessMask = default;
		public AccessFlags dstAccessMask = default;

		public this() {}
		public this(AccessFlags srcAccessMask_,AccessFlags dstAccessMask_)
		{
			srcAccessMask = srcAccessMask_;
			dstAccessMask = dstAccessMask_;
		}
	}

	[CRepr]
	public struct BufferMemoryBarrier 
	{
		public readonly StructureType sType = .BufferMemoryBarrier;
		public void* pNext = null;
		public AccessFlags srcAccessMask = default;
		public AccessFlags dstAccessMask = default;
		public uint32 srcQueueFamilyIndex = default;
		public uint32 dstQueueFamilyIndex = default;
		public Buffer buffer = default;
		public DeviceSize offset = default;
		public DeviceSize size = default;

		public this() {}
		public this(AccessFlags srcAccessMask_,AccessFlags dstAccessMask_,uint32 srcQueueFamilyIndex_,uint32 dstQueueFamilyIndex_,Buffer buffer_,DeviceSize offset_,DeviceSize size_)
		{
			srcAccessMask = srcAccessMask_;
			dstAccessMask = dstAccessMask_;
			srcQueueFamilyIndex = srcQueueFamilyIndex_;
			dstQueueFamilyIndex = dstQueueFamilyIndex_;
			buffer = buffer_;
			offset = offset_;
			size = size_;
		}
	}

	[CRepr]
	public struct ImageMemoryBarrier 
	{
		public readonly StructureType sType = .ImageMemoryBarrier;
		public void* pNext = null;
		public AccessFlags srcAccessMask = default;
		public AccessFlags dstAccessMask = default;
		public ImageLayout oldLayout = default;
		public ImageLayout newLayout = default;
		public uint32 srcQueueFamilyIndex = default;
		public uint32 dstQueueFamilyIndex = default;
		public Image image = default;
		public ImageSubresourceRange subresourceRange = default;

		public this() {}
		public this(AccessFlags srcAccessMask_,AccessFlags dstAccessMask_,ImageLayout oldLayout_,ImageLayout newLayout_,uint32 srcQueueFamilyIndex_,uint32 dstQueueFamilyIndex_,Image image_,ImageSubresourceRange subresourceRange_)
		{
			srcAccessMask = srcAccessMask_;
			dstAccessMask = dstAccessMask_;
			oldLayout = oldLayout_;
			newLayout = newLayout_;
			srcQueueFamilyIndex = srcQueueFamilyIndex_;
			dstQueueFamilyIndex = dstQueueFamilyIndex_;
			image = image_;
			subresourceRange = subresourceRange_;
		}
	}

	[CRepr]
	public struct RenderPassBeginInfo 
	{
		public readonly StructureType sType = .RenderPassBeginInfo;
		public void* pNext = null;
		public RenderPass renderPass = default;
		public Framebuffer framebuffer = default;
		public Rect2D renderArea = default;
		public uint32 clearValueCount = default;
		public ClearValue* pClearValues = default;

		public this() {}
		public this(RenderPass renderPass_,Framebuffer framebuffer_,Rect2D renderArea_,uint32 clearValueCount_,ClearValue* pClearValues_)
		{
			renderPass = renderPass_;
			framebuffer = framebuffer_;
			renderArea = renderArea_;
			clearValueCount = clearValueCount_;
			pClearValues = pClearValues_;
		}
	}

	[CRepr]
	public struct DispatchIndirectCommand 
	{
		public uint32 x = default;
		public uint32 y = default;
		public uint32 z = default;

		public this() {}
		public this(uint32 x_,uint32 y_,uint32 z_)
		{
			x = x_;
			y = y_;
			z = z_;
		}
	}

	[CRepr]
	public struct DrawIndexedIndirectCommand 
	{
		public uint32 indexCount = default;
		public uint32 instanceCount = default;
		public uint32 firstIndex = default;
		public int32 vertexOffset = default;
		public uint32 firstInstance = default;

		public this() {}
		public this(uint32 indexCount_,uint32 instanceCount_,uint32 firstIndex_,int32 vertexOffset_,uint32 firstInstance_)
		{
			indexCount = indexCount_;
			instanceCount = instanceCount_;
			firstIndex = firstIndex_;
			vertexOffset = vertexOffset_;
			firstInstance = firstInstance_;
		}
	}

	[CRepr]
	public struct DrawIndirectCommand 
	{
		public uint32 vertexCount = default;
		public uint32 instanceCount = default;
		public uint32 firstVertex = default;
		public uint32 firstInstance = default;

		public this() {}
		public this(uint32 vertexCount_,uint32 instanceCount_,uint32 firstVertex_,uint32 firstInstance_)
		{
			vertexCount = vertexCount_;
			instanceCount = instanceCount_;
			firstVertex = firstVertex_;
			firstInstance = firstInstance_;
		}
	}

	[CRepr]
	public struct BaseOutStructure 
	{
		public StructureType sType = default;
		public BaseOutStructure* pNext = null;

		public this() {}
		public this(StructureType sType_)
		{
			sType = sType_;
		}
	}

	[CRepr]
	public struct BaseInStructure 
	{
		public StructureType sType = default;
		public BaseInStructure* pNext = null;

		public this() {}
		public this(StructureType sType_)
		{
			sType = sType_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSubgroupProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceSubgroupProperties;
		public void* pNext = null;
		public uint32 subgroupSize = default;
		public ShaderStageFlags supportedStages = default;
		public SubgroupFeatureFlags supportedOperations = default;
		public Bool32 quadOperationsInAllStages = default;

		public this() {}
		public this(uint32 subgroupSize_,ShaderStageFlags supportedStages_,SubgroupFeatureFlags supportedOperations_,Bool32 quadOperationsInAllStages_)
		{
			subgroupSize = subgroupSize_;
			supportedStages = supportedStages_;
			supportedOperations = supportedOperations_;
			quadOperationsInAllStages = quadOperationsInAllStages_;
		}
	}

	[CRepr]
	public struct BindBufferMemoryInfo 
	{
		public readonly StructureType sType = .BindBufferMemoryInfo;
		public void* pNext = null;
		public Buffer buffer = default;
		public DeviceMemory memory = default;
		public DeviceSize memoryOffset = default;

		public this() {}
		public this(Buffer buffer_,DeviceMemory memory_,DeviceSize memoryOffset_)
		{
			buffer = buffer_;
			memory = memory_;
			memoryOffset = memoryOffset_;
		}
	}

	[CRepr]
	public struct BindImageMemoryInfo 
	{
		public readonly StructureType sType = .BindImageMemoryInfo;
		public void* pNext = null;
		public Image image = default;
		public DeviceMemory memory = default;
		public DeviceSize memoryOffset = default;

		public this() {}
		public this(Image image_,DeviceMemory memory_,DeviceSize memoryOffset_)
		{
			image = image_;
			memory = memory_;
			memoryOffset = memoryOffset_;
		}
	}

	[CRepr]
	public struct PhysicalDevice16BitStorageFeatures 
	{
		public readonly StructureType sType = .PhysicalDevice16BitStorageFeatures;
		public void* pNext = null;
		public Bool32 storageBuffer16BitAccess = default;
		public Bool32 uniformAndStorageBuffer16BitAccess = default;
		public Bool32 storagePushConstant16 = default;
		public Bool32 storageInputOutput16 = default;

		public this() {}
		public this(Bool32 storageBuffer16BitAccess_,Bool32 uniformAndStorageBuffer16BitAccess_,Bool32 storagePushConstant16_,Bool32 storageInputOutput16_)
		{
			storageBuffer16BitAccess = storageBuffer16BitAccess_;
			uniformAndStorageBuffer16BitAccess = uniformAndStorageBuffer16BitAccess_;
			storagePushConstant16 = storagePushConstant16_;
			storageInputOutput16 = storageInputOutput16_;
		}
	}

	[CRepr]
	public struct MemoryDedicatedRequirements 
	{
		public readonly StructureType sType = .MemoryDedicatedRequirements;
		public void* pNext = null;
		public Bool32 prefersDedicatedAllocation = default;
		public Bool32 requiresDedicatedAllocation = default;

		public this() {}
		public this(Bool32 prefersDedicatedAllocation_,Bool32 requiresDedicatedAllocation_)
		{
			prefersDedicatedAllocation = prefersDedicatedAllocation_;
			requiresDedicatedAllocation = requiresDedicatedAllocation_;
		}
	}

	[CRepr]
	public struct MemoryDedicatedAllocateInfo 
	{
		public readonly StructureType sType = .MemoryDedicatedAllocateInfo;
		public void* pNext = null;
		public Image image = default;
		public Buffer buffer = default;

		public this() {}
		public this(Image image_,Buffer buffer_)
		{
			image = image_;
			buffer = buffer_;
		}
	}

	[CRepr]
	public struct MemoryAllocateFlagsInfo 
	{
		public readonly StructureType sType = .MemoryAllocateFlagsInfo;
		public void* pNext = null;
		public MemoryAllocateFlags flags = default;
		public uint32 deviceMask = default;

		public this() {}
		public this(MemoryAllocateFlags flags_,uint32 deviceMask_)
		{
			flags = flags_;
			deviceMask = deviceMask_;
		}
	}

	[CRepr]
	public struct DeviceGroupRenderPassBeginInfo 
	{
		public readonly StructureType sType = .DeviceGroupRenderPassBeginInfo;
		public void* pNext = null;
		public uint32 deviceMask = default;
		public uint32 deviceRenderAreaCount = default;
		public Rect2D* pDeviceRenderAreas = default;

		public this() {}
		public this(uint32 deviceMask_,uint32 deviceRenderAreaCount_,Rect2D* pDeviceRenderAreas_)
		{
			deviceMask = deviceMask_;
			deviceRenderAreaCount = deviceRenderAreaCount_;
			pDeviceRenderAreas = pDeviceRenderAreas_;
		}
	}

	[CRepr]
	public struct DeviceGroupCommandBufferBeginInfo 
	{
		public readonly StructureType sType = .DeviceGroupCommandBufferBeginInfo;
		public void* pNext = null;
		public uint32 deviceMask = default;

		public this() {}
		public this(uint32 deviceMask_)
		{
			deviceMask = deviceMask_;
		}
	}

	[CRepr]
	public struct DeviceGroupSubmitInfo 
	{
		public readonly StructureType sType = .DeviceGroupSubmitInfo;
		public void* pNext = null;
		public uint32 waitSemaphoreCount = default;
		public uint32* pWaitSemaphoreDeviceIndices = default;
		public uint32 commandBufferCount = default;
		public uint32* pCommandBufferDeviceMasks = default;
		public uint32 signalSemaphoreCount = default;
		public uint32* pSignalSemaphoreDeviceIndices = default;

		public this() {}
		public this(uint32 waitSemaphoreCount_,uint32* pWaitSemaphoreDeviceIndices_,uint32 commandBufferCount_,uint32* pCommandBufferDeviceMasks_,uint32 signalSemaphoreCount_,uint32* pSignalSemaphoreDeviceIndices_)
		{
			waitSemaphoreCount = waitSemaphoreCount_;
			pWaitSemaphoreDeviceIndices = pWaitSemaphoreDeviceIndices_;
			commandBufferCount = commandBufferCount_;
			pCommandBufferDeviceMasks = pCommandBufferDeviceMasks_;
			signalSemaphoreCount = signalSemaphoreCount_;
			pSignalSemaphoreDeviceIndices = pSignalSemaphoreDeviceIndices_;
		}
	}

	[CRepr]
	public struct DeviceGroupBindSparseInfo 
	{
		public readonly StructureType sType = .DeviceGroupBindSparseInfo;
		public void* pNext = null;
		public uint32 resourceDeviceIndex = default;
		public uint32 memoryDeviceIndex = default;

		public this() {}
		public this(uint32 resourceDeviceIndex_,uint32 memoryDeviceIndex_)
		{
			resourceDeviceIndex = resourceDeviceIndex_;
			memoryDeviceIndex = memoryDeviceIndex_;
		}
	}

	[CRepr]
	public struct BindBufferMemoryDeviceGroupInfo 
	{
		public readonly StructureType sType = .BindBufferMemoryDeviceGroupInfo;
		public void* pNext = null;
		public uint32 deviceIndexCount = default;
		public uint32* pDeviceIndices = default;

		public this() {}
		public this(uint32 deviceIndexCount_,uint32* pDeviceIndices_)
		{
			deviceIndexCount = deviceIndexCount_;
			pDeviceIndices = pDeviceIndices_;
		}
	}

	[CRepr]
	public struct BindImageMemoryDeviceGroupInfo 
	{
		public readonly StructureType sType = .BindImageMemoryDeviceGroupInfo;
		public void* pNext = null;
		public uint32 deviceIndexCount = default;
		public uint32* pDeviceIndices = default;
		public uint32 splitInstanceBindRegionCount = default;
		public Rect2D* pSplitInstanceBindRegions = default;

		public this() {}
		public this(uint32 deviceIndexCount_,uint32* pDeviceIndices_,uint32 splitInstanceBindRegionCount_,Rect2D* pSplitInstanceBindRegions_)
		{
			deviceIndexCount = deviceIndexCount_;
			pDeviceIndices = pDeviceIndices_;
			splitInstanceBindRegionCount = splitInstanceBindRegionCount_;
			pSplitInstanceBindRegions = pSplitInstanceBindRegions_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceGroupProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceGroupProperties;
		public void* pNext = null;
		public uint32 physicalDeviceCount = default;
		public PhysicalDevice[VK_MAX_DEVICE_GROUP_SIZE] physicalDevices = default;
		public Bool32 subsetAllocation = default;

		public this() {}
		public this(uint32 physicalDeviceCount_,PhysicalDevice[Vulkan.VK_MAX_DEVICE_GROUP_SIZE] physicalDevices_,Bool32 subsetAllocation_)
		{
			physicalDeviceCount = physicalDeviceCount_;
			physicalDevices = physicalDevices_;
			subsetAllocation = subsetAllocation_;
		}
	}

	[CRepr]
	public struct DeviceGroupDeviceCreateInfo 
	{
		public readonly StructureType sType = .DeviceGroupDeviceCreateInfo;
		public void* pNext = null;
		public uint32 physicalDeviceCount = default;
		public PhysicalDevice* pPhysicalDevices = default;

		public this() {}
		public this(uint32 physicalDeviceCount_,PhysicalDevice* pPhysicalDevices_)
		{
			physicalDeviceCount = physicalDeviceCount_;
			pPhysicalDevices = pPhysicalDevices_;
		}
	}

	[CRepr]
	public struct BufferMemoryRequirementsInfo2 
	{
		public readonly StructureType sType = .BufferMemoryRequirementsInfo2;
		public void* pNext = null;
		public Buffer buffer = default;

		public this() {}
		public this(Buffer buffer_)
		{
			buffer = buffer_;
		}
	}

	[CRepr]
	public struct ImageMemoryRequirementsInfo2 
	{
		public readonly StructureType sType = .ImageMemoryRequirementsInfo2;
		public void* pNext = null;
		public Image image = default;

		public this() {}
		public this(Image image_)
		{
			image = image_;
		}
	}

	[CRepr]
	public struct ImageSparseMemoryRequirementsInfo2 
	{
		public readonly StructureType sType = .ImageSparseMemoryRequirementsInfo2;
		public void* pNext = null;
		public Image image = default;

		public this() {}
		public this(Image image_)
		{
			image = image_;
		}
	}

	[CRepr]
	public struct MemoryRequirements2 
	{
		public readonly StructureType sType = .MemoryRequirements2;
		public void* pNext = null;
		public MemoryRequirements memoryRequirements = default;

		public this() {}
		public this(MemoryRequirements memoryRequirements_)
		{
			memoryRequirements = memoryRequirements_;
		}
	}

	[CRepr]
	public struct SparseImageMemoryRequirements2 
	{
		public readonly StructureType sType = .SparseImageMemoryRequirements2;
		public void* pNext = null;
		public SparseImageMemoryRequirements memoryRequirements = default;

		public this() {}
		public this(SparseImageMemoryRequirements memoryRequirements_)
		{
			memoryRequirements = memoryRequirements_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFeatures2 
	{
		public readonly StructureType sType = .PhysicalDeviceFeatures2;
		public void* pNext = null;
		public PhysicalDeviceFeatures features = default;

		public this() {}
		public this(PhysicalDeviceFeatures features_)
		{
			features = features_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceProperties2 
	{
		public readonly StructureType sType = .PhysicalDeviceProperties2;
		public void* pNext = null;
		public PhysicalDeviceProperties properties = default;

		public this() {}
		public this(PhysicalDeviceProperties properties_)
		{
			properties = properties_;
		}
	}

	[CRepr]
	public struct FormatProperties2 
	{
		public readonly StructureType sType = .FormatProperties2;
		public void* pNext = null;
		public FormatProperties formatProperties = default;

		public this() {}
		public this(FormatProperties formatProperties_)
		{
			formatProperties = formatProperties_;
		}
	}

	[CRepr]
	public struct ImageFormatProperties2 
	{
		public readonly StructureType sType = .ImageFormatProperties2;
		public void* pNext = null;
		public ImageFormatProperties imageFormatProperties = default;

		public this() {}
		public this(ImageFormatProperties imageFormatProperties_)
		{
			imageFormatProperties = imageFormatProperties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceImageFormatInfo2 
	{
		public readonly StructureType sType = .PhysicalDeviceImageFormatInfo2;
		public void* pNext = null;
		public Format format = default;
		public ImageType type = default;
		public ImageTiling tiling = default;
		public ImageUsageFlags usage = default;
		public ImageCreateFlags flags = default;

		public this() {}
		public this(Format format_,ImageType type_,ImageTiling tiling_,ImageUsageFlags usage_,ImageCreateFlags flags_)
		{
			format = format_;
			type = type_;
			tiling = tiling_;
			usage = usage_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct QueueFamilyProperties2 
	{
		public readonly StructureType sType = .QueueFamilyProperties2;
		public void* pNext = null;
		public QueueFamilyProperties queueFamilyProperties = default;

		public this() {}
		public this(QueueFamilyProperties queueFamilyProperties_)
		{
			queueFamilyProperties = queueFamilyProperties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMemoryProperties2 
	{
		public readonly StructureType sType = .PhysicalDeviceMemoryProperties2;
		public void* pNext = null;
		public PhysicalDeviceMemoryProperties memoryProperties = default;

		public this() {}
		public this(PhysicalDeviceMemoryProperties memoryProperties_)
		{
			memoryProperties = memoryProperties_;
		}
	}

	[CRepr]
	public struct SparseImageFormatProperties2 
	{
		public readonly StructureType sType = .SparseImageFormatProperties2;
		public void* pNext = null;
		public SparseImageFormatProperties properties = default;

		public this() {}
		public this(SparseImageFormatProperties properties_)
		{
			properties = properties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSparseImageFormatInfo2 
	{
		public readonly StructureType sType = .PhysicalDeviceSparseImageFormatInfo2;
		public void* pNext = null;
		public Format format = default;
		public ImageType type = default;
		public SampleCountFlags samples = default;
		public ImageUsageFlags usage = default;
		public ImageTiling tiling = default;

		public this() {}
		public this(Format format_,ImageType type_,SampleCountFlags samples_,ImageUsageFlags usage_,ImageTiling tiling_)
		{
			format = format_;
			type = type_;
			samples = samples_;
			usage = usage_;
			tiling = tiling_;
		}
	}

	[CRepr]
	public struct PhysicalDevicePointClippingProperties 
	{
		public readonly StructureType sType = .PhysicalDevicePointClippingProperties;
		public void* pNext = null;
		public PointClippingBehavior pointClippingBehavior = default;

		public this() {}
		public this(PointClippingBehavior pointClippingBehavior_)
		{
			pointClippingBehavior = pointClippingBehavior_;
		}
	}

	[CRepr]
	public struct InputAttachmentAspectReference 
	{
		public uint32 subpass = default;
		public uint32 inputAttachmentIndex = default;
		public ImageAspectFlags aspectMask = default;

		public this() {}
		public this(uint32 subpass_,uint32 inputAttachmentIndex_,ImageAspectFlags aspectMask_)
		{
			subpass = subpass_;
			inputAttachmentIndex = inputAttachmentIndex_;
			aspectMask = aspectMask_;
		}
	}

	[CRepr]
	public struct RenderPassInputAttachmentAspectCreateInfo 
	{
		public readonly StructureType sType = .RenderPassInputAttachmentAspectCreateInfo;
		public void* pNext = null;
		public uint32 aspectReferenceCount = default;
		public InputAttachmentAspectReference* pAspectReferences = default;

		public this() {}
		public this(uint32 aspectReferenceCount_,InputAttachmentAspectReference* pAspectReferences_)
		{
			aspectReferenceCount = aspectReferenceCount_;
			pAspectReferences = pAspectReferences_;
		}
	}

	[CRepr]
	public struct ImageViewUsageCreateInfo 
	{
		public readonly StructureType sType = .ImageViewUsageCreateInfo;
		public void* pNext = null;
		public ImageUsageFlags usage = default;

		public this() {}
		public this(ImageUsageFlags usage_)
		{
			usage = usage_;
		}
	}

	[CRepr]
	public struct PipelineTessellationDomainOriginStateCreateInfo 
	{
		public readonly StructureType sType = .PipelineTessellationDomainOriginStateCreateInfo;
		public void* pNext = null;
		public TessellationDomainOrigin domainOrigin = default;

		public this() {}
		public this(TessellationDomainOrigin domainOrigin_)
		{
			domainOrigin = domainOrigin_;
		}
	}

	[CRepr]
	public struct RenderPassMultiviewCreateInfo 
	{
		public readonly StructureType sType = .RenderPassMultiviewCreateInfo;
		public void* pNext = null;
		public uint32 subpassCount = default;
		public uint32* pViewMasks = default;
		public uint32 dependencyCount = default;
		public int32* pViewOffsets = default;
		public uint32 correlationMaskCount = default;
		public uint32* pCorrelationMasks = default;

		public this() {}
		public this(uint32 subpassCount_,uint32* pViewMasks_,uint32 dependencyCount_,int32* pViewOffsets_,uint32 correlationMaskCount_,uint32* pCorrelationMasks_)
		{
			subpassCount = subpassCount_;
			pViewMasks = pViewMasks_;
			dependencyCount = dependencyCount_;
			pViewOffsets = pViewOffsets_;
			correlationMaskCount = correlationMaskCount_;
			pCorrelationMasks = pCorrelationMasks_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMultiviewFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceMultiviewFeatures;
		public void* pNext = null;
		public Bool32 multiview = default;
		public Bool32 multiviewGeometryShader = default;
		public Bool32 multiviewTessellationShader = default;

		public this() {}
		public this(Bool32 multiview_,Bool32 multiviewGeometryShader_,Bool32 multiviewTessellationShader_)
		{
			multiview = multiview_;
			multiviewGeometryShader = multiviewGeometryShader_;
			multiviewTessellationShader = multiviewTessellationShader_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMultiviewProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceMultiviewProperties;
		public void* pNext = null;
		public uint32 maxMultiviewViewCount = default;
		public uint32 maxMultiviewInstanceIndex = default;

		public this() {}
		public this(uint32 maxMultiviewViewCount_,uint32 maxMultiviewInstanceIndex_)
		{
			maxMultiviewViewCount = maxMultiviewViewCount_;
			maxMultiviewInstanceIndex = maxMultiviewInstanceIndex_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVariablePointersFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceVariablePointersFeatures;
		public void* pNext = null;
		public Bool32 variablePointersStorageBuffer = default;
		public Bool32 variablePointers = default;

		public this() {}
		public this(Bool32 variablePointersStorageBuffer_,Bool32 variablePointers_)
		{
			variablePointersStorageBuffer = variablePointersStorageBuffer_;
			variablePointers = variablePointers_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceProtectedMemoryFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceProtectedMemoryFeatures;
		public void* pNext = null;
		public Bool32 protectedMemory = default;

		public this() {}
		public this(Bool32 protectedMemory_)
		{
			protectedMemory = protectedMemory_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceProtectedMemoryProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceProtectedMemoryProperties;
		public void* pNext = null;
		public Bool32 protectedNoFault = default;

		public this() {}
		public this(Bool32 protectedNoFault_)
		{
			protectedNoFault = protectedNoFault_;
		}
	}

	[CRepr]
	public struct DeviceQueueInfo2 
	{
		public readonly StructureType sType = .DeviceQueueInfo2;
		public void* pNext = null;
		public DeviceQueueCreateFlags flags = default;
		public uint32 queueFamilyIndex = default;
		public uint32 queueIndex = default;

		public this() {}
		public this(DeviceQueueCreateFlags flags_,uint32 queueFamilyIndex_,uint32 queueIndex_)
		{
			flags = flags_;
			queueFamilyIndex = queueFamilyIndex_;
			queueIndex = queueIndex_;
		}
	}

	[CRepr]
	public struct ProtectedSubmitInfo 
	{
		public readonly StructureType sType = .ProtectedSubmitInfo;
		public void* pNext = null;
		public Bool32 protectedSubmit = default;

		public this() {}
		public this(Bool32 protectedSubmit_)
		{
			protectedSubmit = protectedSubmit_;
		}
	}

	[CRepr]
	public struct SamplerYcbcrConversionCreateInfo 
	{
		public readonly StructureType sType = .SamplerYcbcrConversionCreateInfo;
		public void* pNext = null;
		public Format format = default;
		public SamplerYcbcrModelConversion ycbcrModel = default;
		public SamplerYcbcrRange ycbcrRange = default;
		public ComponentMapping components = default;
		public ChromaLocation xChromaOffset = default;
		public ChromaLocation yChromaOffset = default;
		public Filter chromaFilter = default;
		public Bool32 forceExplicitReconstruction = default;

		public this() {}
		public this(Format format_,SamplerYcbcrModelConversion ycbcrModel_,SamplerYcbcrRange ycbcrRange_,ComponentMapping components_,ChromaLocation xChromaOffset_,ChromaLocation yChromaOffset_,Filter chromaFilter_,Bool32 forceExplicitReconstruction_)
		{
			format = format_;
			ycbcrModel = ycbcrModel_;
			ycbcrRange = ycbcrRange_;
			components = components_;
			xChromaOffset = xChromaOffset_;
			yChromaOffset = yChromaOffset_;
			chromaFilter = chromaFilter_;
			forceExplicitReconstruction = forceExplicitReconstruction_;
		}
	}

	[CRepr]
	public struct SamplerYcbcrConversionInfo 
	{
		public readonly StructureType sType = .SamplerYcbcrConversionInfo;
		public void* pNext = null;
		public SamplerYcbcrConversion conversion = default;

		public this() {}
		public this(SamplerYcbcrConversion conversion_)
		{
			conversion = conversion_;
		}
	}

	[CRepr]
	public struct BindImagePlaneMemoryInfo 
	{
		public readonly StructureType sType = .BindImagePlaneMemoryInfo;
		public void* pNext = null;
		public ImageAspectFlags planeAspect = default;

		public this() {}
		public this(ImageAspectFlags planeAspect_)
		{
			planeAspect = planeAspect_;
		}
	}

	[CRepr]
	public struct ImagePlaneMemoryRequirementsInfo 
	{
		public readonly StructureType sType = .ImagePlaneMemoryRequirementsInfo;
		public void* pNext = null;
		public ImageAspectFlags planeAspect = default;

		public this() {}
		public this(ImageAspectFlags planeAspect_)
		{
			planeAspect = planeAspect_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSamplerYcbcrConversionFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceSamplerYcbcrConversionFeatures;
		public void* pNext = null;
		public Bool32 samplerYcbcrConversion = default;

		public this() {}
		public this(Bool32 samplerYcbcrConversion_)
		{
			samplerYcbcrConversion = samplerYcbcrConversion_;
		}
	}

	[CRepr]
	public struct SamplerYcbcrConversionImageFormatProperties 
	{
		public readonly StructureType sType = .SamplerYcbcrConversionImageFormatProperties;
		public void* pNext = null;
		public uint32 combinedImageSamplerDescriptorCount = default;

		public this() {}
		public this(uint32 combinedImageSamplerDescriptorCount_)
		{
			combinedImageSamplerDescriptorCount = combinedImageSamplerDescriptorCount_;
		}
	}

	[CRepr]
	public struct DescriptorUpdateTemplateEntry 
	{
		public uint32 dstBinding = default;
		public uint32 dstArrayElement = default;
		public uint32 descriptorCount = default;
		public DescriptorType descriptorType = default;
		public uint offset = default;
		public uint stride = default;

		public this() {}
		public this(uint32 dstBinding_,uint32 dstArrayElement_,uint32 descriptorCount_,DescriptorType descriptorType_,uint offset_,uint stride_)
		{
			dstBinding = dstBinding_;
			dstArrayElement = dstArrayElement_;
			descriptorCount = descriptorCount_;
			descriptorType = descriptorType_;
			offset = offset_;
			stride = stride_;
		}
	}

	[CRepr]
	public struct DescriptorUpdateTemplateCreateInfo 
	{
		public readonly StructureType sType = .DescriptorUpdateTemplateCreateInfo;
		public void* pNext = null;
		public DescriptorUpdateTemplateCreateFlags flags = default;
		public uint32 descriptorUpdateEntryCount = default;
		public DescriptorUpdateTemplateEntry* pDescriptorUpdateEntries = default;
		public DescriptorUpdateTemplateType templateType = default;
		public DescriptorSetLayout descriptorSetLayout = default;
		public PipelineBindPoint pipelineBindPoint = default;
		public PipelineLayout pipelineLayout = default;
		public uint32 set = default;

		public this() {}
		public this(DescriptorUpdateTemplateCreateFlags flags_,uint32 descriptorUpdateEntryCount_,DescriptorUpdateTemplateEntry* pDescriptorUpdateEntries_,DescriptorUpdateTemplateType templateType_,DescriptorSetLayout descriptorSetLayout_,PipelineBindPoint pipelineBindPoint_,PipelineLayout pipelineLayout_,uint32 set_)
		{
			flags = flags_;
			descriptorUpdateEntryCount = descriptorUpdateEntryCount_;
			pDescriptorUpdateEntries = pDescriptorUpdateEntries_;
			templateType = templateType_;
			descriptorSetLayout = descriptorSetLayout_;
			pipelineBindPoint = pipelineBindPoint_;
			pipelineLayout = pipelineLayout_;
			set = set_;
		}
	}

	[CRepr]
	public struct ExternalMemoryProperties 
	{
		public ExternalMemoryFeatureFlags externalMemoryFeatures = default;
		public ExternalMemoryHandleTypeFlags exportFromImportedHandleTypes = default;
		public ExternalMemoryHandleTypeFlags compatibleHandleTypes = default;

		public this() {}
		public this(ExternalMemoryFeatureFlags externalMemoryFeatures_,ExternalMemoryHandleTypeFlags exportFromImportedHandleTypes_,ExternalMemoryHandleTypeFlags compatibleHandleTypes_)
		{
			externalMemoryFeatures = externalMemoryFeatures_;
			exportFromImportedHandleTypes = exportFromImportedHandleTypes_;
			compatibleHandleTypes = compatibleHandleTypes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExternalImageFormatInfo 
	{
		public readonly StructureType sType = .PhysicalDeviceExternalImageFormatInfo;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleType = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleType_)
		{
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ExternalImageFormatProperties 
	{
		public readonly StructureType sType = .ExternalImageFormatProperties;
		public void* pNext = null;
		public ExternalMemoryProperties externalMemoryProperties = default;

		public this() {}
		public this(ExternalMemoryProperties externalMemoryProperties_)
		{
			externalMemoryProperties = externalMemoryProperties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExternalBufferInfo 
	{
		public readonly StructureType sType = .PhysicalDeviceExternalBufferInfo;
		public void* pNext = null;
		public BufferCreateFlags flags = default;
		public BufferUsageFlags usage = default;
		public ExternalMemoryHandleTypeFlags handleType = default;

		public this() {}
		public this(BufferCreateFlags flags_,BufferUsageFlags usage_,ExternalMemoryHandleTypeFlags handleType_)
		{
			flags = flags_;
			usage = usage_;
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ExternalBufferProperties 
	{
		public readonly StructureType sType = .ExternalBufferProperties;
		public void* pNext = null;
		public ExternalMemoryProperties externalMemoryProperties = default;

		public this() {}
		public this(ExternalMemoryProperties externalMemoryProperties_)
		{
			externalMemoryProperties = externalMemoryProperties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceIDProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceIdProperties;
		public void* pNext = null;
		public uint8[VK_UUID_SIZE] deviceUUID = default;
		public uint8[VK_UUID_SIZE] driverUUID = default;
		public uint8[VK_LUID_SIZE] deviceLUID = default;
		public uint32 deviceNodeMask = default;
		public Bool32 deviceLUIDValid = default;

		public this() {}
		public this(uint8[Vulkan.VK_UUID_SIZE] deviceUUID_,uint8[Vulkan.VK_UUID_SIZE] driverUUID_,uint8[Vulkan.VK_LUID_SIZE] deviceLUID_,uint32 deviceNodeMask_,Bool32 deviceLUIDValid_)
		{
			deviceUUID = deviceUUID_;
			driverUUID = driverUUID_;
			deviceLUID = deviceLUID_;
			deviceNodeMask = deviceNodeMask_;
			deviceLUIDValid = deviceLUIDValid_;
		}
	}

	[CRepr]
	public struct ExternalMemoryImageCreateInfo 
	{
		public readonly StructureType sType = .ExternalMemoryImageCreateInfo;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleTypes = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct ExternalMemoryBufferCreateInfo 
	{
		public readonly StructureType sType = .ExternalMemoryBufferCreateInfo;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleTypes = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct ExportMemoryAllocateInfo 
	{
		public readonly StructureType sType = .ExportMemoryAllocateInfo;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleTypes = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExternalFenceInfo 
	{
		public readonly StructureType sType = .PhysicalDeviceExternalFenceInfo;
		public void* pNext = null;
		public ExternalFenceHandleTypeFlags handleType = default;

		public this() {}
		public this(ExternalFenceHandleTypeFlags handleType_)
		{
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ExternalFenceProperties 
	{
		public readonly StructureType sType = .ExternalFenceProperties;
		public void* pNext = null;
		public ExternalFenceHandleTypeFlags exportFromImportedHandleTypes = default;
		public ExternalFenceHandleTypeFlags compatibleHandleTypes = default;
		public ExternalFenceFeatureFlags externalFenceFeatures = default;

		public this() {}
		public this(ExternalFenceHandleTypeFlags exportFromImportedHandleTypes_,ExternalFenceHandleTypeFlags compatibleHandleTypes_,ExternalFenceFeatureFlags externalFenceFeatures_)
		{
			exportFromImportedHandleTypes = exportFromImportedHandleTypes_;
			compatibleHandleTypes = compatibleHandleTypes_;
			externalFenceFeatures = externalFenceFeatures_;
		}
	}

	[CRepr]
	public struct ExportFenceCreateInfo 
	{
		public readonly StructureType sType = .ExportFenceCreateInfo;
		public void* pNext = null;
		public ExternalFenceHandleTypeFlags handleTypes = default;

		public this() {}
		public this(ExternalFenceHandleTypeFlags handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct ExportSemaphoreCreateInfo 
	{
		public readonly StructureType sType = .ExportSemaphoreCreateInfo;
		public void* pNext = null;
		public ExternalSemaphoreHandleTypeFlags handleTypes = default;

		public this() {}
		public this(ExternalSemaphoreHandleTypeFlags handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExternalSemaphoreInfo 
	{
		public readonly StructureType sType = .PhysicalDeviceExternalSemaphoreInfo;
		public void* pNext = null;
		public ExternalSemaphoreHandleTypeFlags handleType = default;

		public this() {}
		public this(ExternalSemaphoreHandleTypeFlags handleType_)
		{
			handleType = handleType_;
		}
	}

	[CRepr]
	public struct ExternalSemaphoreProperties 
	{
		public readonly StructureType sType = .ExternalSemaphoreProperties;
		public void* pNext = null;
		public ExternalSemaphoreHandleTypeFlags exportFromImportedHandleTypes = default;
		public ExternalSemaphoreHandleTypeFlags compatibleHandleTypes = default;
		public ExternalSemaphoreFeatureFlags externalSemaphoreFeatures = default;

		public this() {}
		public this(ExternalSemaphoreHandleTypeFlags exportFromImportedHandleTypes_,ExternalSemaphoreHandleTypeFlags compatibleHandleTypes_,ExternalSemaphoreFeatureFlags externalSemaphoreFeatures_)
		{
			exportFromImportedHandleTypes = exportFromImportedHandleTypes_;
			compatibleHandleTypes = compatibleHandleTypes_;
			externalSemaphoreFeatures = externalSemaphoreFeatures_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMaintenance3Properties 
	{
		public readonly StructureType sType = .PhysicalDeviceMaintenance3Properties;
		public void* pNext = null;
		public uint32 maxPerSetDescriptors = default;
		public DeviceSize maxMemoryAllocationSize = default;

		public this() {}
		public this(uint32 maxPerSetDescriptors_,DeviceSize maxMemoryAllocationSize_)
		{
			maxPerSetDescriptors = maxPerSetDescriptors_;
			maxMemoryAllocationSize = maxMemoryAllocationSize_;
		}
	}

	[CRepr]
	public struct DescriptorSetLayoutSupport 
	{
		public readonly StructureType sType = .DescriptorSetLayoutSupport;
		public void* pNext = null;
		public Bool32 supported = default;

		public this() {}
		public this(Bool32 supported_)
		{
			supported = supported_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderDrawParametersFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderDrawParametersFeatures;
		public void* pNext = null;
		public Bool32 shaderDrawParameters = default;

		public this() {}
		public this(Bool32 shaderDrawParameters_)
		{
			shaderDrawParameters = shaderDrawParameters_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVulkan11Features 
	{
		public readonly StructureType sType = .PhysicalDeviceVulkan11Features;
		public void* pNext = null;
		public Bool32 storageBuffer16BitAccess = default;
		public Bool32 uniformAndStorageBuffer16BitAccess = default;
		public Bool32 storagePushConstant16 = default;
		public Bool32 storageInputOutput16 = default;
		public Bool32 multiview = default;
		public Bool32 multiviewGeometryShader = default;
		public Bool32 multiviewTessellationShader = default;
		public Bool32 variablePointersStorageBuffer = default;
		public Bool32 variablePointers = default;
		public Bool32 protectedMemory = default;
		public Bool32 samplerYcbcrConversion = default;
		public Bool32 shaderDrawParameters = default;

		public this() {}
		public this(Bool32 storageBuffer16BitAccess_,Bool32 uniformAndStorageBuffer16BitAccess_,Bool32 storagePushConstant16_,Bool32 storageInputOutput16_,Bool32 multiview_,Bool32 multiviewGeometryShader_,Bool32 multiviewTessellationShader_,Bool32 variablePointersStorageBuffer_,Bool32 variablePointers_,Bool32 protectedMemory_,Bool32 samplerYcbcrConversion_,Bool32 shaderDrawParameters_)
		{
			storageBuffer16BitAccess = storageBuffer16BitAccess_;
			uniformAndStorageBuffer16BitAccess = uniformAndStorageBuffer16BitAccess_;
			storagePushConstant16 = storagePushConstant16_;
			storageInputOutput16 = storageInputOutput16_;
			multiview = multiview_;
			multiviewGeometryShader = multiviewGeometryShader_;
			multiviewTessellationShader = multiviewTessellationShader_;
			variablePointersStorageBuffer = variablePointersStorageBuffer_;
			variablePointers = variablePointers_;
			protectedMemory = protectedMemory_;
			samplerYcbcrConversion = samplerYcbcrConversion_;
			shaderDrawParameters = shaderDrawParameters_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVulkan11Properties 
	{
		public readonly StructureType sType = .PhysicalDeviceVulkan11Properties;
		public void* pNext = null;
		public uint8[VK_UUID_SIZE] deviceUUID = default;
		public uint8[VK_UUID_SIZE] driverUUID = default;
		public uint8[VK_LUID_SIZE] deviceLUID = default;
		public uint32 deviceNodeMask = default;
		public Bool32 deviceLUIDValid = default;
		public uint32 subgroupSize = default;
		public ShaderStageFlags subgroupSupportedStages = default;
		public SubgroupFeatureFlags subgroupSupportedOperations = default;
		public Bool32 subgroupQuadOperationsInAllStages = default;
		public PointClippingBehavior pointClippingBehavior = default;
		public uint32 maxMultiviewViewCount = default;
		public uint32 maxMultiviewInstanceIndex = default;
		public Bool32 protectedNoFault = default;
		public uint32 maxPerSetDescriptors = default;
		public DeviceSize maxMemoryAllocationSize = default;

		public this() {}
		public this(uint8[Vulkan.VK_UUID_SIZE] deviceUUID_,uint8[Vulkan.VK_UUID_SIZE] driverUUID_,uint8[Vulkan.VK_LUID_SIZE] deviceLUID_,uint32 deviceNodeMask_,Bool32 deviceLUIDValid_,uint32 subgroupSize_,ShaderStageFlags subgroupSupportedStages_,SubgroupFeatureFlags subgroupSupportedOperations_,Bool32 subgroupQuadOperationsInAllStages_,PointClippingBehavior pointClippingBehavior_,uint32 maxMultiviewViewCount_,uint32 maxMultiviewInstanceIndex_,Bool32 protectedNoFault_,uint32 maxPerSetDescriptors_,DeviceSize maxMemoryAllocationSize_)
		{
			deviceUUID = deviceUUID_;
			driverUUID = driverUUID_;
			deviceLUID = deviceLUID_;
			deviceNodeMask = deviceNodeMask_;
			deviceLUIDValid = deviceLUIDValid_;
			subgroupSize = subgroupSize_;
			subgroupSupportedStages = subgroupSupportedStages_;
			subgroupSupportedOperations = subgroupSupportedOperations_;
			subgroupQuadOperationsInAllStages = subgroupQuadOperationsInAllStages_;
			pointClippingBehavior = pointClippingBehavior_;
			maxMultiviewViewCount = maxMultiviewViewCount_;
			maxMultiviewInstanceIndex = maxMultiviewInstanceIndex_;
			protectedNoFault = protectedNoFault_;
			maxPerSetDescriptors = maxPerSetDescriptors_;
			maxMemoryAllocationSize = maxMemoryAllocationSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVulkan12Features 
	{
		public readonly StructureType sType = .PhysicalDeviceVulkan12Features;
		public void* pNext = null;
		public Bool32 samplerMirrorClampToEdge = default;
		public Bool32 drawIndirectCount = default;
		public Bool32 storageBuffer8BitAccess = default;
		public Bool32 uniformAndStorageBuffer8BitAccess = default;
		public Bool32 storagePushConstant8 = default;
		public Bool32 shaderBufferInt64Atomics = default;
		public Bool32 shaderSharedInt64Atomics = default;
		public Bool32 shaderFloat16 = default;
		public Bool32 shaderInt8 = default;
		public Bool32 descriptorIndexing = default;
		public Bool32 shaderInputAttachmentArrayDynamicIndexing = default;
		public Bool32 shaderUniformTexelBufferArrayDynamicIndexing = default;
		public Bool32 shaderStorageTexelBufferArrayDynamicIndexing = default;
		public Bool32 shaderUniformBufferArrayNonUniformIndexing = default;
		public Bool32 shaderSampledImageArrayNonUniformIndexing = default;
		public Bool32 shaderStorageBufferArrayNonUniformIndexing = default;
		public Bool32 shaderStorageImageArrayNonUniformIndexing = default;
		public Bool32 shaderInputAttachmentArrayNonUniformIndexing = default;
		public Bool32 shaderUniformTexelBufferArrayNonUniformIndexing = default;
		public Bool32 shaderStorageTexelBufferArrayNonUniformIndexing = default;
		public Bool32 descriptorBindingUniformBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingSampledImageUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageImageUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingUniformTexelBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageTexelBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingUpdateUnusedWhilePending = default;
		public Bool32 descriptorBindingPartiallyBound = default;
		public Bool32 descriptorBindingVariableDescriptorCount = default;
		public Bool32 runtimeDescriptorArray = default;
		public Bool32 samplerFilterMinmax = default;
		public Bool32 scalarBlockLayout = default;
		public Bool32 imagelessFramebuffer = default;
		public Bool32 uniformBufferStandardLayout = default;
		public Bool32 shaderSubgroupExtendedTypes = default;
		public Bool32 separateDepthStencilLayouts = default;
		public Bool32 hostQueryReset = default;
		public Bool32 timelineSemaphore = default;
		public Bool32 bufferDeviceAddress = default;
		public Bool32 bufferDeviceAddressCaptureReplay = default;
		public Bool32 bufferDeviceAddressMultiDevice = default;
		public Bool32 vulkanMemoryModel = default;
		public Bool32 vulkanMemoryModelDeviceScope = default;
		public Bool32 vulkanMemoryModelAvailabilityVisibilityChains = default;
		public Bool32 shaderOutputViewportIndex = default;
		public Bool32 shaderOutputLayer = default;
		public Bool32 subgroupBroadcastDynamicId = default;

		public this() {}
		public this(Bool32 samplerMirrorClampToEdge_,Bool32 drawIndirectCount_,Bool32 storageBuffer8BitAccess_,Bool32 uniformAndStorageBuffer8BitAccess_,Bool32 storagePushConstant8_,Bool32 shaderBufferInt64Atomics_,Bool32 shaderSharedInt64Atomics_,Bool32 shaderFloat16_,Bool32 shaderInt8_,Bool32 descriptorIndexing_,Bool32 shaderInputAttachmentArrayDynamicIndexing_,Bool32 shaderUniformTexelBufferArrayDynamicIndexing_,Bool32 shaderStorageTexelBufferArrayDynamicIndexing_,Bool32 shaderUniformBufferArrayNonUniformIndexing_,Bool32 shaderSampledImageArrayNonUniformIndexing_,Bool32 shaderStorageBufferArrayNonUniformIndexing_,Bool32 shaderStorageImageArrayNonUniformIndexing_,Bool32 shaderInputAttachmentArrayNonUniformIndexing_,Bool32 shaderUniformTexelBufferArrayNonUniformIndexing_,Bool32 shaderStorageTexelBufferArrayNonUniformIndexing_,Bool32 descriptorBindingUniformBufferUpdateAfterBind_,Bool32 descriptorBindingSampledImageUpdateAfterBind_,Bool32 descriptorBindingStorageImageUpdateAfterBind_,Bool32 descriptorBindingStorageBufferUpdateAfterBind_,Bool32 descriptorBindingUniformTexelBufferUpdateAfterBind_,Bool32 descriptorBindingStorageTexelBufferUpdateAfterBind_,Bool32 descriptorBindingUpdateUnusedWhilePending_,Bool32 descriptorBindingPartiallyBound_,Bool32 descriptorBindingVariableDescriptorCount_,Bool32 runtimeDescriptorArray_,Bool32 samplerFilterMinmax_,Bool32 scalarBlockLayout_,Bool32 imagelessFramebuffer_,Bool32 uniformBufferStandardLayout_,Bool32 shaderSubgroupExtendedTypes_,Bool32 separateDepthStencilLayouts_,Bool32 hostQueryReset_,Bool32 timelineSemaphore_,Bool32 bufferDeviceAddress_,Bool32 bufferDeviceAddressCaptureReplay_,Bool32 bufferDeviceAddressMultiDevice_,Bool32 vulkanMemoryModel_,Bool32 vulkanMemoryModelDeviceScope_,Bool32 vulkanMemoryModelAvailabilityVisibilityChains_,Bool32 shaderOutputViewportIndex_,Bool32 shaderOutputLayer_,Bool32 subgroupBroadcastDynamicId_)
		{
			samplerMirrorClampToEdge = samplerMirrorClampToEdge_;
			drawIndirectCount = drawIndirectCount_;
			storageBuffer8BitAccess = storageBuffer8BitAccess_;
			uniformAndStorageBuffer8BitAccess = uniformAndStorageBuffer8BitAccess_;
			storagePushConstant8 = storagePushConstant8_;
			shaderBufferInt64Atomics = shaderBufferInt64Atomics_;
			shaderSharedInt64Atomics = shaderSharedInt64Atomics_;
			shaderFloat16 = shaderFloat16_;
			shaderInt8 = shaderInt8_;
			descriptorIndexing = descriptorIndexing_;
			shaderInputAttachmentArrayDynamicIndexing = shaderInputAttachmentArrayDynamicIndexing_;
			shaderUniformTexelBufferArrayDynamicIndexing = shaderUniformTexelBufferArrayDynamicIndexing_;
			shaderStorageTexelBufferArrayDynamicIndexing = shaderStorageTexelBufferArrayDynamicIndexing_;
			shaderUniformBufferArrayNonUniformIndexing = shaderUniformBufferArrayNonUniformIndexing_;
			shaderSampledImageArrayNonUniformIndexing = shaderSampledImageArrayNonUniformIndexing_;
			shaderStorageBufferArrayNonUniformIndexing = shaderStorageBufferArrayNonUniformIndexing_;
			shaderStorageImageArrayNonUniformIndexing = shaderStorageImageArrayNonUniformIndexing_;
			shaderInputAttachmentArrayNonUniformIndexing = shaderInputAttachmentArrayNonUniformIndexing_;
			shaderUniformTexelBufferArrayNonUniformIndexing = shaderUniformTexelBufferArrayNonUniformIndexing_;
			shaderStorageTexelBufferArrayNonUniformIndexing = shaderStorageTexelBufferArrayNonUniformIndexing_;
			descriptorBindingUniformBufferUpdateAfterBind = descriptorBindingUniformBufferUpdateAfterBind_;
			descriptorBindingSampledImageUpdateAfterBind = descriptorBindingSampledImageUpdateAfterBind_;
			descriptorBindingStorageImageUpdateAfterBind = descriptorBindingStorageImageUpdateAfterBind_;
			descriptorBindingStorageBufferUpdateAfterBind = descriptorBindingStorageBufferUpdateAfterBind_;
			descriptorBindingUniformTexelBufferUpdateAfterBind = descriptorBindingUniformTexelBufferUpdateAfterBind_;
			descriptorBindingStorageTexelBufferUpdateAfterBind = descriptorBindingStorageTexelBufferUpdateAfterBind_;
			descriptorBindingUpdateUnusedWhilePending = descriptorBindingUpdateUnusedWhilePending_;
			descriptorBindingPartiallyBound = descriptorBindingPartiallyBound_;
			descriptorBindingVariableDescriptorCount = descriptorBindingVariableDescriptorCount_;
			runtimeDescriptorArray = runtimeDescriptorArray_;
			samplerFilterMinmax = samplerFilterMinmax_;
			scalarBlockLayout = scalarBlockLayout_;
			imagelessFramebuffer = imagelessFramebuffer_;
			uniformBufferStandardLayout = uniformBufferStandardLayout_;
			shaderSubgroupExtendedTypes = shaderSubgroupExtendedTypes_;
			separateDepthStencilLayouts = separateDepthStencilLayouts_;
			hostQueryReset = hostQueryReset_;
			timelineSemaphore = timelineSemaphore_;
			bufferDeviceAddress = bufferDeviceAddress_;
			bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay_;
			bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice_;
			vulkanMemoryModel = vulkanMemoryModel_;
			vulkanMemoryModelDeviceScope = vulkanMemoryModelDeviceScope_;
			vulkanMemoryModelAvailabilityVisibilityChains = vulkanMemoryModelAvailabilityVisibilityChains_;
			shaderOutputViewportIndex = shaderOutputViewportIndex_;
			shaderOutputLayer = shaderOutputLayer_;
			subgroupBroadcastDynamicId = subgroupBroadcastDynamicId_;
		}
	}

	[CRepr]
	public struct ConformanceVersion 
	{
		public uint8 major = default;
		public uint8 minor = default;
		public uint8 subminor = default;
		public uint8 patch = default;

		public this() {}
		public this(uint8 major_,uint8 minor_,uint8 subminor_,uint8 patch_)
		{
			major = major_;
			minor = minor_;
			subminor = subminor_;
			patch = patch_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVulkan12Properties 
	{
		public readonly StructureType sType = .PhysicalDeviceVulkan12Properties;
		public void* pNext = null;
		public DriverId driverID = default;
		public char8[VK_MAX_DRIVER_NAME_SIZE] driverName = default;
		public char8[VK_MAX_DRIVER_INFO_SIZE] driverInfo = default;
		public ConformanceVersion conformanceVersion = default;
		public ShaderFloatControlsIndependence denormBehaviorIndependence = default;
		public ShaderFloatControlsIndependence roundingModeIndependence = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat16 = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat32 = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat64 = default;
		public Bool32 shaderDenormPreserveFloat16 = default;
		public Bool32 shaderDenormPreserveFloat32 = default;
		public Bool32 shaderDenormPreserveFloat64 = default;
		public Bool32 shaderDenormFlushToZeroFloat16 = default;
		public Bool32 shaderDenormFlushToZeroFloat32 = default;
		public Bool32 shaderDenormFlushToZeroFloat64 = default;
		public Bool32 shaderRoundingModeRTEFloat16 = default;
		public Bool32 shaderRoundingModeRTEFloat32 = default;
		public Bool32 shaderRoundingModeRTEFloat64 = default;
		public Bool32 shaderRoundingModeRTZFloat16 = default;
		public Bool32 shaderRoundingModeRTZFloat32 = default;
		public Bool32 shaderRoundingModeRTZFloat64 = default;
		public uint32 maxUpdateAfterBindDescriptorsInAllPools = default;
		public Bool32 shaderUniformBufferArrayNonUniformIndexingNative = default;
		public Bool32 shaderSampledImageArrayNonUniformIndexingNative = default;
		public Bool32 shaderStorageBufferArrayNonUniformIndexingNative = default;
		public Bool32 shaderStorageImageArrayNonUniformIndexingNative = default;
		public Bool32 shaderInputAttachmentArrayNonUniformIndexingNative = default;
		public Bool32 robustBufferAccessUpdateAfterBind = default;
		public Bool32 quadDivergentImplicitLod = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindSamplers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindUniformBuffers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindStorageBuffers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindSampledImages = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindStorageImages = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindInputAttachments = default;
		public uint32 maxPerStageUpdateAfterBindResources = default;
		public uint32 maxDescriptorSetUpdateAfterBindSamplers = default;
		public uint32 maxDescriptorSetUpdateAfterBindUniformBuffers = default;
		public uint32 maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageBuffers = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = default;
		public uint32 maxDescriptorSetUpdateAfterBindSampledImages = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageImages = default;
		public uint32 maxDescriptorSetUpdateAfterBindInputAttachments = default;
		public ResolveModeFlags supportedDepthResolveModes = default;
		public ResolveModeFlags supportedStencilResolveModes = default;
		public Bool32 independentResolveNone = default;
		public Bool32 independentResolve = default;
		public Bool32 filterMinmaxSingleComponentFormats = default;
		public Bool32 filterMinmaxImageComponentMapping = default;
		public uint64 maxTimelineSemaphoreValueDifference = default;
		public SampleCountFlags framebufferIntegerColorSampleCounts = default;

		public this() {}
		public this(DriverId driverID_,char8[Vulkan.VK_MAX_DRIVER_NAME_SIZE] driverName_,char8[Vulkan.VK_MAX_DRIVER_INFO_SIZE] driverInfo_,ConformanceVersion conformanceVersion_,ShaderFloatControlsIndependence denormBehaviorIndependence_,ShaderFloatControlsIndependence roundingModeIndependence_,Bool32 shaderSignedZeroInfNanPreserveFloat16_,Bool32 shaderSignedZeroInfNanPreserveFloat32_,Bool32 shaderSignedZeroInfNanPreserveFloat64_,Bool32 shaderDenormPreserveFloat16_,Bool32 shaderDenormPreserveFloat32_,Bool32 shaderDenormPreserveFloat64_,Bool32 shaderDenormFlushToZeroFloat16_,Bool32 shaderDenormFlushToZeroFloat32_,Bool32 shaderDenormFlushToZeroFloat64_,Bool32 shaderRoundingModeRTEFloat16_,Bool32 shaderRoundingModeRTEFloat32_,Bool32 shaderRoundingModeRTEFloat64_,Bool32 shaderRoundingModeRTZFloat16_,Bool32 shaderRoundingModeRTZFloat32_,Bool32 shaderRoundingModeRTZFloat64_,uint32 maxUpdateAfterBindDescriptorsInAllPools_,Bool32 shaderUniformBufferArrayNonUniformIndexingNative_,Bool32 shaderSampledImageArrayNonUniformIndexingNative_,Bool32 shaderStorageBufferArrayNonUniformIndexingNative_,Bool32 shaderStorageImageArrayNonUniformIndexingNative_,Bool32 shaderInputAttachmentArrayNonUniformIndexingNative_,Bool32 robustBufferAccessUpdateAfterBind_,Bool32 quadDivergentImplicitLod_,uint32 maxPerStageDescriptorUpdateAfterBindSamplers_,uint32 maxPerStageDescriptorUpdateAfterBindUniformBuffers_,uint32 maxPerStageDescriptorUpdateAfterBindStorageBuffers_,uint32 maxPerStageDescriptorUpdateAfterBindSampledImages_,uint32 maxPerStageDescriptorUpdateAfterBindStorageImages_,uint32 maxPerStageDescriptorUpdateAfterBindInputAttachments_,uint32 maxPerStageUpdateAfterBindResources_,uint32 maxDescriptorSetUpdateAfterBindSamplers_,uint32 maxDescriptorSetUpdateAfterBindUniformBuffers_,uint32 maxDescriptorSetUpdateAfterBindUniformBuffersDynamic_,uint32 maxDescriptorSetUpdateAfterBindStorageBuffers_,uint32 maxDescriptorSetUpdateAfterBindStorageBuffersDynamic_,uint32 maxDescriptorSetUpdateAfterBindSampledImages_,uint32 maxDescriptorSetUpdateAfterBindStorageImages_,uint32 maxDescriptorSetUpdateAfterBindInputAttachments_,ResolveModeFlags supportedDepthResolveModes_,ResolveModeFlags supportedStencilResolveModes_,Bool32 independentResolveNone_,Bool32 independentResolve_,Bool32 filterMinmaxSingleComponentFormats_,Bool32 filterMinmaxImageComponentMapping_,uint64 maxTimelineSemaphoreValueDifference_,SampleCountFlags framebufferIntegerColorSampleCounts_)
		{
			driverID = driverID_;
			driverName = driverName_;
			driverInfo = driverInfo_;
			conformanceVersion = conformanceVersion_;
			denormBehaviorIndependence = denormBehaviorIndependence_;
			roundingModeIndependence = roundingModeIndependence_;
			shaderSignedZeroInfNanPreserveFloat16 = shaderSignedZeroInfNanPreserveFloat16_;
			shaderSignedZeroInfNanPreserveFloat32 = shaderSignedZeroInfNanPreserveFloat32_;
			shaderSignedZeroInfNanPreserveFloat64 = shaderSignedZeroInfNanPreserveFloat64_;
			shaderDenormPreserveFloat16 = shaderDenormPreserveFloat16_;
			shaderDenormPreserveFloat32 = shaderDenormPreserveFloat32_;
			shaderDenormPreserveFloat64 = shaderDenormPreserveFloat64_;
			shaderDenormFlushToZeroFloat16 = shaderDenormFlushToZeroFloat16_;
			shaderDenormFlushToZeroFloat32 = shaderDenormFlushToZeroFloat32_;
			shaderDenormFlushToZeroFloat64 = shaderDenormFlushToZeroFloat64_;
			shaderRoundingModeRTEFloat16 = shaderRoundingModeRTEFloat16_;
			shaderRoundingModeRTEFloat32 = shaderRoundingModeRTEFloat32_;
			shaderRoundingModeRTEFloat64 = shaderRoundingModeRTEFloat64_;
			shaderRoundingModeRTZFloat16 = shaderRoundingModeRTZFloat16_;
			shaderRoundingModeRTZFloat32 = shaderRoundingModeRTZFloat32_;
			shaderRoundingModeRTZFloat64 = shaderRoundingModeRTZFloat64_;
			maxUpdateAfterBindDescriptorsInAllPools = maxUpdateAfterBindDescriptorsInAllPools_;
			shaderUniformBufferArrayNonUniformIndexingNative = shaderUniformBufferArrayNonUniformIndexingNative_;
			shaderSampledImageArrayNonUniformIndexingNative = shaderSampledImageArrayNonUniformIndexingNative_;
			shaderStorageBufferArrayNonUniformIndexingNative = shaderStorageBufferArrayNonUniformIndexingNative_;
			shaderStorageImageArrayNonUniformIndexingNative = shaderStorageImageArrayNonUniformIndexingNative_;
			shaderInputAttachmentArrayNonUniformIndexingNative = shaderInputAttachmentArrayNonUniformIndexingNative_;
			robustBufferAccessUpdateAfterBind = robustBufferAccessUpdateAfterBind_;
			quadDivergentImplicitLod = quadDivergentImplicitLod_;
			maxPerStageDescriptorUpdateAfterBindSamplers = maxPerStageDescriptorUpdateAfterBindSamplers_;
			maxPerStageDescriptorUpdateAfterBindUniformBuffers = maxPerStageDescriptorUpdateAfterBindUniformBuffers_;
			maxPerStageDescriptorUpdateAfterBindStorageBuffers = maxPerStageDescriptorUpdateAfterBindStorageBuffers_;
			maxPerStageDescriptorUpdateAfterBindSampledImages = maxPerStageDescriptorUpdateAfterBindSampledImages_;
			maxPerStageDescriptorUpdateAfterBindStorageImages = maxPerStageDescriptorUpdateAfterBindStorageImages_;
			maxPerStageDescriptorUpdateAfterBindInputAttachments = maxPerStageDescriptorUpdateAfterBindInputAttachments_;
			maxPerStageUpdateAfterBindResources = maxPerStageUpdateAfterBindResources_;
			maxDescriptorSetUpdateAfterBindSamplers = maxDescriptorSetUpdateAfterBindSamplers_;
			maxDescriptorSetUpdateAfterBindUniformBuffers = maxDescriptorSetUpdateAfterBindUniformBuffers_;
			maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = maxDescriptorSetUpdateAfterBindUniformBuffersDynamic_;
			maxDescriptorSetUpdateAfterBindStorageBuffers = maxDescriptorSetUpdateAfterBindStorageBuffers_;
			maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = maxDescriptorSetUpdateAfterBindStorageBuffersDynamic_;
			maxDescriptorSetUpdateAfterBindSampledImages = maxDescriptorSetUpdateAfterBindSampledImages_;
			maxDescriptorSetUpdateAfterBindStorageImages = maxDescriptorSetUpdateAfterBindStorageImages_;
			maxDescriptorSetUpdateAfterBindInputAttachments = maxDescriptorSetUpdateAfterBindInputAttachments_;
			supportedDepthResolveModes = supportedDepthResolveModes_;
			supportedStencilResolveModes = supportedStencilResolveModes_;
			independentResolveNone = independentResolveNone_;
			independentResolve = independentResolve_;
			filterMinmaxSingleComponentFormats = filterMinmaxSingleComponentFormats_;
			filterMinmaxImageComponentMapping = filterMinmaxImageComponentMapping_;
			maxTimelineSemaphoreValueDifference = maxTimelineSemaphoreValueDifference_;
			framebufferIntegerColorSampleCounts = framebufferIntegerColorSampleCounts_;
		}
	}

	[CRepr]
	public struct ImageFormatListCreateInfo 
	{
		public readonly StructureType sType = .ImageFormatListCreateInfo;
		public void* pNext = null;
		public uint32 viewFormatCount = default;
		public Format* pViewFormats = default;

		public this() {}
		public this(uint32 viewFormatCount_,Format* pViewFormats_)
		{
			viewFormatCount = viewFormatCount_;
			pViewFormats = pViewFormats_;
		}
	}

	[CRepr]
	public struct AttachmentDescription2 
	{
		public readonly StructureType sType = .AttachmentDescription2;
		public void* pNext = null;
		public AttachmentDescriptionFlags flags = default;
		public Format format = default;
		public SampleCountFlags samples = default;
		public AttachmentLoadOp loadOp = default;
		public AttachmentStoreOp storeOp = default;
		public AttachmentLoadOp stencilLoadOp = default;
		public AttachmentStoreOp stencilStoreOp = default;
		public ImageLayout initialLayout = default;
		public ImageLayout finalLayout = default;

		public this() {}
		public this(AttachmentDescriptionFlags flags_,Format format_,SampleCountFlags samples_,AttachmentLoadOp loadOp_,AttachmentStoreOp storeOp_,AttachmentLoadOp stencilLoadOp_,AttachmentStoreOp stencilStoreOp_,ImageLayout initialLayout_,ImageLayout finalLayout_)
		{
			flags = flags_;
			format = format_;
			samples = samples_;
			loadOp = loadOp_;
			storeOp = storeOp_;
			stencilLoadOp = stencilLoadOp_;
			stencilStoreOp = stencilStoreOp_;
			initialLayout = initialLayout_;
			finalLayout = finalLayout_;
		}
	}

	[CRepr]
	public struct AttachmentReference2 
	{
		public readonly StructureType sType = .AttachmentReference2;
		public void* pNext = null;
		public uint32 attachment = default;
		public ImageLayout layout = default;
		public ImageAspectFlags aspectMask = default;

		public this() {}
		public this(uint32 attachment_,ImageLayout layout_,ImageAspectFlags aspectMask_)
		{
			attachment = attachment_;
			layout = layout_;
			aspectMask = aspectMask_;
		}
	}

	[CRepr]
	public struct SubpassDescription2 
	{
		public readonly StructureType sType = .SubpassDescription2;
		public void* pNext = null;
		public SubpassDescriptionFlags flags = default;
		public PipelineBindPoint pipelineBindPoint = default;
		public uint32 viewMask = default;
		public uint32 inputAttachmentCount = default;
		public AttachmentReference2* pInputAttachments = default;
		public uint32 colorAttachmentCount = default;
		public AttachmentReference2* pColorAttachments = default;
		public AttachmentReference2* pResolveAttachments = default;
		public AttachmentReference2* pDepthStencilAttachment = default;
		public uint32 preserveAttachmentCount = default;
		public uint32* pPreserveAttachments = default;

		public this() {}
		public this(SubpassDescriptionFlags flags_,PipelineBindPoint pipelineBindPoint_,uint32 viewMask_,uint32 inputAttachmentCount_,AttachmentReference2* pInputAttachments_,uint32 colorAttachmentCount_,AttachmentReference2* pColorAttachments_,AttachmentReference2* pResolveAttachments_,AttachmentReference2* pDepthStencilAttachment_,uint32 preserveAttachmentCount_,uint32* pPreserveAttachments_)
		{
			flags = flags_;
			pipelineBindPoint = pipelineBindPoint_;
			viewMask = viewMask_;
			inputAttachmentCount = inputAttachmentCount_;
			pInputAttachments = pInputAttachments_;
			colorAttachmentCount = colorAttachmentCount_;
			pColorAttachments = pColorAttachments_;
			pResolveAttachments = pResolveAttachments_;
			pDepthStencilAttachment = pDepthStencilAttachment_;
			preserveAttachmentCount = preserveAttachmentCount_;
			pPreserveAttachments = pPreserveAttachments_;
		}
	}

	[CRepr]
	public struct SubpassDependency2 
	{
		public readonly StructureType sType = .SubpassDependency2;
		public void* pNext = null;
		public uint32 srcSubpass = default;
		public uint32 dstSubpass = default;
		public PipelineStageFlags srcStageMask = default;
		public PipelineStageFlags dstStageMask = default;
		public AccessFlags srcAccessMask = default;
		public AccessFlags dstAccessMask = default;
		public DependencyFlags dependencyFlags = default;
		public int32 viewOffset = default;

		public this() {}
		public this(uint32 srcSubpass_,uint32 dstSubpass_,PipelineStageFlags srcStageMask_,PipelineStageFlags dstStageMask_,AccessFlags srcAccessMask_,AccessFlags dstAccessMask_,DependencyFlags dependencyFlags_,int32 viewOffset_)
		{
			srcSubpass = srcSubpass_;
			dstSubpass = dstSubpass_;
			srcStageMask = srcStageMask_;
			dstStageMask = dstStageMask_;
			srcAccessMask = srcAccessMask_;
			dstAccessMask = dstAccessMask_;
			dependencyFlags = dependencyFlags_;
			viewOffset = viewOffset_;
		}
	}

	[CRepr]
	public struct RenderPassCreateInfo2 
	{
		public readonly StructureType sType = .RenderPassCreateInfo2;
		public void* pNext = null;
		public RenderPassCreateFlags flags = default;
		public uint32 attachmentCount = default;
		public AttachmentDescription2* pAttachments = default;
		public uint32 subpassCount = default;
		public SubpassDescription2* pSubpasses = default;
		public uint32 dependencyCount = default;
		public SubpassDependency2* pDependencies = default;
		public uint32 correlatedViewMaskCount = default;
		public uint32* pCorrelatedViewMasks = default;

		public this() {}
		public this(RenderPassCreateFlags flags_,uint32 attachmentCount_,AttachmentDescription2* pAttachments_,uint32 subpassCount_,SubpassDescription2* pSubpasses_,uint32 dependencyCount_,SubpassDependency2* pDependencies_,uint32 correlatedViewMaskCount_,uint32* pCorrelatedViewMasks_)
		{
			flags = flags_;
			attachmentCount = attachmentCount_;
			pAttachments = pAttachments_;
			subpassCount = subpassCount_;
			pSubpasses = pSubpasses_;
			dependencyCount = dependencyCount_;
			pDependencies = pDependencies_;
			correlatedViewMaskCount = correlatedViewMaskCount_;
			pCorrelatedViewMasks = pCorrelatedViewMasks_;
		}
	}

	[CRepr]
	public struct SubpassBeginInfo 
	{
		public readonly StructureType sType = .SubpassBeginInfo;
		public void* pNext = null;
		public SubpassContents contents = default;

		public this() {}
		public this(SubpassContents contents_)
		{
			contents = contents_;
		}
	}

	[CRepr]
	public struct SubpassEndInfo 
	{
		public readonly StructureType sType = .SubpassEndInfo;
		public void* pNext = null;

		public this() {}
	}

	[CRepr]
	public struct PhysicalDevice8BitStorageFeatures 
	{
		public readonly StructureType sType = .PhysicalDevice8BitStorageFeatures;
		public void* pNext = null;
		public Bool32 storageBuffer8BitAccess = default;
		public Bool32 uniformAndStorageBuffer8BitAccess = default;
		public Bool32 storagePushConstant8 = default;

		public this() {}
		public this(Bool32 storageBuffer8BitAccess_,Bool32 uniformAndStorageBuffer8BitAccess_,Bool32 storagePushConstant8_)
		{
			storageBuffer8BitAccess = storageBuffer8BitAccess_;
			uniformAndStorageBuffer8BitAccess = uniformAndStorageBuffer8BitAccess_;
			storagePushConstant8 = storagePushConstant8_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDriverProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceDriverProperties;
		public void* pNext = null;
		public DriverId driverID = default;
		public char8[VK_MAX_DRIVER_NAME_SIZE] driverName = default;
		public char8[VK_MAX_DRIVER_INFO_SIZE] driverInfo = default;
		public ConformanceVersion conformanceVersion = default;

		public this() {}
		public this(DriverId driverID_,char8[Vulkan.VK_MAX_DRIVER_NAME_SIZE] driverName_,char8[Vulkan.VK_MAX_DRIVER_INFO_SIZE] driverInfo_,ConformanceVersion conformanceVersion_)
		{
			driverID = driverID_;
			driverName = driverName_;
			driverInfo = driverInfo_;
			conformanceVersion = conformanceVersion_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderAtomicInt64Features 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderAtomicInt64Features;
		public void* pNext = null;
		public Bool32 shaderBufferInt64Atomics = default;
		public Bool32 shaderSharedInt64Atomics = default;

		public this() {}
		public this(Bool32 shaderBufferInt64Atomics_,Bool32 shaderSharedInt64Atomics_)
		{
			shaderBufferInt64Atomics = shaderBufferInt64Atomics_;
			shaderSharedInt64Atomics = shaderSharedInt64Atomics_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderFloat16Int8Features 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderFloat16Int8Features;
		public void* pNext = null;
		public Bool32 shaderFloat16 = default;
		public Bool32 shaderInt8 = default;

		public this() {}
		public this(Bool32 shaderFloat16_,Bool32 shaderInt8_)
		{
			shaderFloat16 = shaderFloat16_;
			shaderInt8 = shaderInt8_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFloatControlsProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceFloatControlsProperties;
		public void* pNext = null;
		public ShaderFloatControlsIndependence denormBehaviorIndependence = default;
		public ShaderFloatControlsIndependence roundingModeIndependence = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat16 = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat32 = default;
		public Bool32 shaderSignedZeroInfNanPreserveFloat64 = default;
		public Bool32 shaderDenormPreserveFloat16 = default;
		public Bool32 shaderDenormPreserveFloat32 = default;
		public Bool32 shaderDenormPreserveFloat64 = default;
		public Bool32 shaderDenormFlushToZeroFloat16 = default;
		public Bool32 shaderDenormFlushToZeroFloat32 = default;
		public Bool32 shaderDenormFlushToZeroFloat64 = default;
		public Bool32 shaderRoundingModeRTEFloat16 = default;
		public Bool32 shaderRoundingModeRTEFloat32 = default;
		public Bool32 shaderRoundingModeRTEFloat64 = default;
		public Bool32 shaderRoundingModeRTZFloat16 = default;
		public Bool32 shaderRoundingModeRTZFloat32 = default;
		public Bool32 shaderRoundingModeRTZFloat64 = default;

		public this() {}
		public this(ShaderFloatControlsIndependence denormBehaviorIndependence_,ShaderFloatControlsIndependence roundingModeIndependence_,Bool32 shaderSignedZeroInfNanPreserveFloat16_,Bool32 shaderSignedZeroInfNanPreserveFloat32_,Bool32 shaderSignedZeroInfNanPreserveFloat64_,Bool32 shaderDenormPreserveFloat16_,Bool32 shaderDenormPreserveFloat32_,Bool32 shaderDenormPreserveFloat64_,Bool32 shaderDenormFlushToZeroFloat16_,Bool32 shaderDenormFlushToZeroFloat32_,Bool32 shaderDenormFlushToZeroFloat64_,Bool32 shaderRoundingModeRTEFloat16_,Bool32 shaderRoundingModeRTEFloat32_,Bool32 shaderRoundingModeRTEFloat64_,Bool32 shaderRoundingModeRTZFloat16_,Bool32 shaderRoundingModeRTZFloat32_,Bool32 shaderRoundingModeRTZFloat64_)
		{
			denormBehaviorIndependence = denormBehaviorIndependence_;
			roundingModeIndependence = roundingModeIndependence_;
			shaderSignedZeroInfNanPreserveFloat16 = shaderSignedZeroInfNanPreserveFloat16_;
			shaderSignedZeroInfNanPreserveFloat32 = shaderSignedZeroInfNanPreserveFloat32_;
			shaderSignedZeroInfNanPreserveFloat64 = shaderSignedZeroInfNanPreserveFloat64_;
			shaderDenormPreserveFloat16 = shaderDenormPreserveFloat16_;
			shaderDenormPreserveFloat32 = shaderDenormPreserveFloat32_;
			shaderDenormPreserveFloat64 = shaderDenormPreserveFloat64_;
			shaderDenormFlushToZeroFloat16 = shaderDenormFlushToZeroFloat16_;
			shaderDenormFlushToZeroFloat32 = shaderDenormFlushToZeroFloat32_;
			shaderDenormFlushToZeroFloat64 = shaderDenormFlushToZeroFloat64_;
			shaderRoundingModeRTEFloat16 = shaderRoundingModeRTEFloat16_;
			shaderRoundingModeRTEFloat32 = shaderRoundingModeRTEFloat32_;
			shaderRoundingModeRTEFloat64 = shaderRoundingModeRTEFloat64_;
			shaderRoundingModeRTZFloat16 = shaderRoundingModeRTZFloat16_;
			shaderRoundingModeRTZFloat32 = shaderRoundingModeRTZFloat32_;
			shaderRoundingModeRTZFloat64 = shaderRoundingModeRTZFloat64_;
		}
	}

	[CRepr]
	public struct DescriptorSetLayoutBindingFlagsCreateInfo 
	{
		public readonly StructureType sType = .DescriptorSetLayoutBindingFlagsCreateInfo;
		public void* pNext = null;
		public uint32 bindingCount = default;
		public DescriptorBindingFlags* pBindingFlags = default;

		public this() {}
		public this(uint32 bindingCount_,DescriptorBindingFlags* pBindingFlags_)
		{
			bindingCount = bindingCount_;
			pBindingFlags = pBindingFlags_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDescriptorIndexingFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceDescriptorIndexingFeatures;
		public void* pNext = null;
		public Bool32 shaderInputAttachmentArrayDynamicIndexing = default;
		public Bool32 shaderUniformTexelBufferArrayDynamicIndexing = default;
		public Bool32 shaderStorageTexelBufferArrayDynamicIndexing = default;
		public Bool32 shaderUniformBufferArrayNonUniformIndexing = default;
		public Bool32 shaderSampledImageArrayNonUniformIndexing = default;
		public Bool32 shaderStorageBufferArrayNonUniformIndexing = default;
		public Bool32 shaderStorageImageArrayNonUniformIndexing = default;
		public Bool32 shaderInputAttachmentArrayNonUniformIndexing = default;
		public Bool32 shaderUniformTexelBufferArrayNonUniformIndexing = default;
		public Bool32 shaderStorageTexelBufferArrayNonUniformIndexing = default;
		public Bool32 descriptorBindingUniformBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingSampledImageUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageImageUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingUniformTexelBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingStorageTexelBufferUpdateAfterBind = default;
		public Bool32 descriptorBindingUpdateUnusedWhilePending = default;
		public Bool32 descriptorBindingPartiallyBound = default;
		public Bool32 descriptorBindingVariableDescriptorCount = default;
		public Bool32 runtimeDescriptorArray = default;

		public this() {}
		public this(Bool32 shaderInputAttachmentArrayDynamicIndexing_,Bool32 shaderUniformTexelBufferArrayDynamicIndexing_,Bool32 shaderStorageTexelBufferArrayDynamicIndexing_,Bool32 shaderUniformBufferArrayNonUniformIndexing_,Bool32 shaderSampledImageArrayNonUniformIndexing_,Bool32 shaderStorageBufferArrayNonUniformIndexing_,Bool32 shaderStorageImageArrayNonUniformIndexing_,Bool32 shaderInputAttachmentArrayNonUniformIndexing_,Bool32 shaderUniformTexelBufferArrayNonUniformIndexing_,Bool32 shaderStorageTexelBufferArrayNonUniformIndexing_,Bool32 descriptorBindingUniformBufferUpdateAfterBind_,Bool32 descriptorBindingSampledImageUpdateAfterBind_,Bool32 descriptorBindingStorageImageUpdateAfterBind_,Bool32 descriptorBindingStorageBufferUpdateAfterBind_,Bool32 descriptorBindingUniformTexelBufferUpdateAfterBind_,Bool32 descriptorBindingStorageTexelBufferUpdateAfterBind_,Bool32 descriptorBindingUpdateUnusedWhilePending_,Bool32 descriptorBindingPartiallyBound_,Bool32 descriptorBindingVariableDescriptorCount_,Bool32 runtimeDescriptorArray_)
		{
			shaderInputAttachmentArrayDynamicIndexing = shaderInputAttachmentArrayDynamicIndexing_;
			shaderUniformTexelBufferArrayDynamicIndexing = shaderUniformTexelBufferArrayDynamicIndexing_;
			shaderStorageTexelBufferArrayDynamicIndexing = shaderStorageTexelBufferArrayDynamicIndexing_;
			shaderUniformBufferArrayNonUniformIndexing = shaderUniformBufferArrayNonUniformIndexing_;
			shaderSampledImageArrayNonUniformIndexing = shaderSampledImageArrayNonUniformIndexing_;
			shaderStorageBufferArrayNonUniformIndexing = shaderStorageBufferArrayNonUniformIndexing_;
			shaderStorageImageArrayNonUniformIndexing = shaderStorageImageArrayNonUniformIndexing_;
			shaderInputAttachmentArrayNonUniformIndexing = shaderInputAttachmentArrayNonUniformIndexing_;
			shaderUniformTexelBufferArrayNonUniformIndexing = shaderUniformTexelBufferArrayNonUniformIndexing_;
			shaderStorageTexelBufferArrayNonUniformIndexing = shaderStorageTexelBufferArrayNonUniformIndexing_;
			descriptorBindingUniformBufferUpdateAfterBind = descriptorBindingUniformBufferUpdateAfterBind_;
			descriptorBindingSampledImageUpdateAfterBind = descriptorBindingSampledImageUpdateAfterBind_;
			descriptorBindingStorageImageUpdateAfterBind = descriptorBindingStorageImageUpdateAfterBind_;
			descriptorBindingStorageBufferUpdateAfterBind = descriptorBindingStorageBufferUpdateAfterBind_;
			descriptorBindingUniformTexelBufferUpdateAfterBind = descriptorBindingUniformTexelBufferUpdateAfterBind_;
			descriptorBindingStorageTexelBufferUpdateAfterBind = descriptorBindingStorageTexelBufferUpdateAfterBind_;
			descriptorBindingUpdateUnusedWhilePending = descriptorBindingUpdateUnusedWhilePending_;
			descriptorBindingPartiallyBound = descriptorBindingPartiallyBound_;
			descriptorBindingVariableDescriptorCount = descriptorBindingVariableDescriptorCount_;
			runtimeDescriptorArray = runtimeDescriptorArray_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDescriptorIndexingProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceDescriptorIndexingProperties;
		public void* pNext = null;
		public uint32 maxUpdateAfterBindDescriptorsInAllPools = default;
		public Bool32 shaderUniformBufferArrayNonUniformIndexingNative = default;
		public Bool32 shaderSampledImageArrayNonUniformIndexingNative = default;
		public Bool32 shaderStorageBufferArrayNonUniformIndexingNative = default;
		public Bool32 shaderStorageImageArrayNonUniformIndexingNative = default;
		public Bool32 shaderInputAttachmentArrayNonUniformIndexingNative = default;
		public Bool32 robustBufferAccessUpdateAfterBind = default;
		public Bool32 quadDivergentImplicitLod = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindSamplers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindUniformBuffers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindStorageBuffers = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindSampledImages = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindStorageImages = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindInputAttachments = default;
		public uint32 maxPerStageUpdateAfterBindResources = default;
		public uint32 maxDescriptorSetUpdateAfterBindSamplers = default;
		public uint32 maxDescriptorSetUpdateAfterBindUniformBuffers = default;
		public uint32 maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageBuffers = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = default;
		public uint32 maxDescriptorSetUpdateAfterBindSampledImages = default;
		public uint32 maxDescriptorSetUpdateAfterBindStorageImages = default;
		public uint32 maxDescriptorSetUpdateAfterBindInputAttachments = default;

		public this() {}
		public this(uint32 maxUpdateAfterBindDescriptorsInAllPools_,Bool32 shaderUniformBufferArrayNonUniformIndexingNative_,Bool32 shaderSampledImageArrayNonUniformIndexingNative_,Bool32 shaderStorageBufferArrayNonUniformIndexingNative_,Bool32 shaderStorageImageArrayNonUniformIndexingNative_,Bool32 shaderInputAttachmentArrayNonUniformIndexingNative_,Bool32 robustBufferAccessUpdateAfterBind_,Bool32 quadDivergentImplicitLod_,uint32 maxPerStageDescriptorUpdateAfterBindSamplers_,uint32 maxPerStageDescriptorUpdateAfterBindUniformBuffers_,uint32 maxPerStageDescriptorUpdateAfterBindStorageBuffers_,uint32 maxPerStageDescriptorUpdateAfterBindSampledImages_,uint32 maxPerStageDescriptorUpdateAfterBindStorageImages_,uint32 maxPerStageDescriptorUpdateAfterBindInputAttachments_,uint32 maxPerStageUpdateAfterBindResources_,uint32 maxDescriptorSetUpdateAfterBindSamplers_,uint32 maxDescriptorSetUpdateAfterBindUniformBuffers_,uint32 maxDescriptorSetUpdateAfterBindUniformBuffersDynamic_,uint32 maxDescriptorSetUpdateAfterBindStorageBuffers_,uint32 maxDescriptorSetUpdateAfterBindStorageBuffersDynamic_,uint32 maxDescriptorSetUpdateAfterBindSampledImages_,uint32 maxDescriptorSetUpdateAfterBindStorageImages_,uint32 maxDescriptorSetUpdateAfterBindInputAttachments_)
		{
			maxUpdateAfterBindDescriptorsInAllPools = maxUpdateAfterBindDescriptorsInAllPools_;
			shaderUniformBufferArrayNonUniformIndexingNative = shaderUniformBufferArrayNonUniformIndexingNative_;
			shaderSampledImageArrayNonUniformIndexingNative = shaderSampledImageArrayNonUniformIndexingNative_;
			shaderStorageBufferArrayNonUniformIndexingNative = shaderStorageBufferArrayNonUniformIndexingNative_;
			shaderStorageImageArrayNonUniformIndexingNative = shaderStorageImageArrayNonUniformIndexingNative_;
			shaderInputAttachmentArrayNonUniformIndexingNative = shaderInputAttachmentArrayNonUniformIndexingNative_;
			robustBufferAccessUpdateAfterBind = robustBufferAccessUpdateAfterBind_;
			quadDivergentImplicitLod = quadDivergentImplicitLod_;
			maxPerStageDescriptorUpdateAfterBindSamplers = maxPerStageDescriptorUpdateAfterBindSamplers_;
			maxPerStageDescriptorUpdateAfterBindUniformBuffers = maxPerStageDescriptorUpdateAfterBindUniformBuffers_;
			maxPerStageDescriptorUpdateAfterBindStorageBuffers = maxPerStageDescriptorUpdateAfterBindStorageBuffers_;
			maxPerStageDescriptorUpdateAfterBindSampledImages = maxPerStageDescriptorUpdateAfterBindSampledImages_;
			maxPerStageDescriptorUpdateAfterBindStorageImages = maxPerStageDescriptorUpdateAfterBindStorageImages_;
			maxPerStageDescriptorUpdateAfterBindInputAttachments = maxPerStageDescriptorUpdateAfterBindInputAttachments_;
			maxPerStageUpdateAfterBindResources = maxPerStageUpdateAfterBindResources_;
			maxDescriptorSetUpdateAfterBindSamplers = maxDescriptorSetUpdateAfterBindSamplers_;
			maxDescriptorSetUpdateAfterBindUniformBuffers = maxDescriptorSetUpdateAfterBindUniformBuffers_;
			maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = maxDescriptorSetUpdateAfterBindUniformBuffersDynamic_;
			maxDescriptorSetUpdateAfterBindStorageBuffers = maxDescriptorSetUpdateAfterBindStorageBuffers_;
			maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = maxDescriptorSetUpdateAfterBindStorageBuffersDynamic_;
			maxDescriptorSetUpdateAfterBindSampledImages = maxDescriptorSetUpdateAfterBindSampledImages_;
			maxDescriptorSetUpdateAfterBindStorageImages = maxDescriptorSetUpdateAfterBindStorageImages_;
			maxDescriptorSetUpdateAfterBindInputAttachments = maxDescriptorSetUpdateAfterBindInputAttachments_;
		}
	}

	[CRepr]
	public struct DescriptorSetVariableDescriptorCountAllocateInfo 
	{
		public readonly StructureType sType = .DescriptorSetVariableDescriptorCountAllocateInfo;
		public void* pNext = null;
		public uint32 descriptorSetCount = default;
		public uint32* pDescriptorCounts = default;

		public this() {}
		public this(uint32 descriptorSetCount_,uint32* pDescriptorCounts_)
		{
			descriptorSetCount = descriptorSetCount_;
			pDescriptorCounts = pDescriptorCounts_;
		}
	}

	[CRepr]
	public struct DescriptorSetVariableDescriptorCountLayoutSupport 
	{
		public readonly StructureType sType = .DescriptorSetVariableDescriptorCountLayoutSupport;
		public void* pNext = null;
		public uint32 maxVariableDescriptorCount = default;

		public this() {}
		public this(uint32 maxVariableDescriptorCount_)
		{
			maxVariableDescriptorCount = maxVariableDescriptorCount_;
		}
	}

	[CRepr]
	public struct SubpassDescriptionDepthStencilResolve 
	{
		public readonly StructureType sType = .SubpassDescriptionDepthStencilResolve;
		public void* pNext = null;
		public ResolveModeFlags depthResolveMode = default;
		public ResolveModeFlags stencilResolveMode = default;
		public AttachmentReference2* pDepthStencilResolveAttachment = default;

		public this() {}
		public this(ResolveModeFlags depthResolveMode_,ResolveModeFlags stencilResolveMode_,AttachmentReference2* pDepthStencilResolveAttachment_)
		{
			depthResolveMode = depthResolveMode_;
			stencilResolveMode = stencilResolveMode_;
			pDepthStencilResolveAttachment = pDepthStencilResolveAttachment_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDepthStencilResolveProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceDepthStencilResolveProperties;
		public void* pNext = null;
		public ResolveModeFlags supportedDepthResolveModes = default;
		public ResolveModeFlags supportedStencilResolveModes = default;
		public Bool32 independentResolveNone = default;
		public Bool32 independentResolve = default;

		public this() {}
		public this(ResolveModeFlags supportedDepthResolveModes_,ResolveModeFlags supportedStencilResolveModes_,Bool32 independentResolveNone_,Bool32 independentResolve_)
		{
			supportedDepthResolveModes = supportedDepthResolveModes_;
			supportedStencilResolveModes = supportedStencilResolveModes_;
			independentResolveNone = independentResolveNone_;
			independentResolve = independentResolve_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceScalarBlockLayoutFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceScalarBlockLayoutFeatures;
		public void* pNext = null;
		public Bool32 scalarBlockLayout = default;

		public this() {}
		public this(Bool32 scalarBlockLayout_)
		{
			scalarBlockLayout = scalarBlockLayout_;
		}
	}

	[CRepr]
	public struct ImageStencilUsageCreateInfo 
	{
		public readonly StructureType sType = .ImageStencilUsageCreateInfo;
		public void* pNext = null;
		public ImageUsageFlags stencilUsage = default;

		public this() {}
		public this(ImageUsageFlags stencilUsage_)
		{
			stencilUsage = stencilUsage_;
		}
	}

	[CRepr]
	public struct SamplerReductionModeCreateInfo 
	{
		public readonly StructureType sType = .SamplerReductionModeCreateInfo;
		public void* pNext = null;
		public SamplerReductionMode reductionMode = default;

		public this() {}
		public this(SamplerReductionMode reductionMode_)
		{
			reductionMode = reductionMode_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSamplerFilterMinmaxProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceSamplerFilterMinmaxProperties;
		public void* pNext = null;
		public Bool32 filterMinmaxSingleComponentFormats = default;
		public Bool32 filterMinmaxImageComponentMapping = default;

		public this() {}
		public this(Bool32 filterMinmaxSingleComponentFormats_,Bool32 filterMinmaxImageComponentMapping_)
		{
			filterMinmaxSingleComponentFormats = filterMinmaxSingleComponentFormats_;
			filterMinmaxImageComponentMapping = filterMinmaxImageComponentMapping_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVulkanMemoryModelFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceVulkanMemoryModelFeatures;
		public void* pNext = null;
		public Bool32 vulkanMemoryModel = default;
		public Bool32 vulkanMemoryModelDeviceScope = default;
		public Bool32 vulkanMemoryModelAvailabilityVisibilityChains = default;

		public this() {}
		public this(Bool32 vulkanMemoryModel_,Bool32 vulkanMemoryModelDeviceScope_,Bool32 vulkanMemoryModelAvailabilityVisibilityChains_)
		{
			vulkanMemoryModel = vulkanMemoryModel_;
			vulkanMemoryModelDeviceScope = vulkanMemoryModelDeviceScope_;
			vulkanMemoryModelAvailabilityVisibilityChains = vulkanMemoryModelAvailabilityVisibilityChains_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceImagelessFramebufferFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceImagelessFramebufferFeatures;
		public void* pNext = null;
		public Bool32 imagelessFramebuffer = default;

		public this() {}
		public this(Bool32 imagelessFramebuffer_)
		{
			imagelessFramebuffer = imagelessFramebuffer_;
		}
	}

	[CRepr]
	public struct FramebufferAttachmentImageInfo 
	{
		public readonly StructureType sType = .FramebufferAttachmentImageInfo;
		public void* pNext = null;
		public ImageCreateFlags flags = default;
		public ImageUsageFlags usage = default;
		public uint32 width = default;
		public uint32 height = default;
		public uint32 layerCount = default;
		public uint32 viewFormatCount = default;
		public Format* pViewFormats = default;

		public this() {}
		public this(ImageCreateFlags flags_,ImageUsageFlags usage_,uint32 width_,uint32 height_,uint32 layerCount_,uint32 viewFormatCount_,Format* pViewFormats_)
		{
			flags = flags_;
			usage = usage_;
			width = width_;
			height = height_;
			layerCount = layerCount_;
			viewFormatCount = viewFormatCount_;
			pViewFormats = pViewFormats_;
		}
	}

	[CRepr]
	public struct FramebufferAttachmentsCreateInfo 
	{
		public readonly StructureType sType = .FramebufferAttachmentsCreateInfo;
		public void* pNext = null;
		public uint32 attachmentImageInfoCount = default;
		public FramebufferAttachmentImageInfo* pAttachmentImageInfos = default;

		public this() {}
		public this(uint32 attachmentImageInfoCount_,FramebufferAttachmentImageInfo* pAttachmentImageInfos_)
		{
			attachmentImageInfoCount = attachmentImageInfoCount_;
			pAttachmentImageInfos = pAttachmentImageInfos_;
		}
	}

	[CRepr]
	public struct RenderPassAttachmentBeginInfo 
	{
		public readonly StructureType sType = .RenderPassAttachmentBeginInfo;
		public void* pNext = null;
		public uint32 attachmentCount = default;
		public ImageView* pAttachments = default;

		public this() {}
		public this(uint32 attachmentCount_,ImageView* pAttachments_)
		{
			attachmentCount = attachmentCount_;
			pAttachments = pAttachments_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceUniformBufferStandardLayoutFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceUniformBufferStandardLayoutFeatures;
		public void* pNext = null;
		public Bool32 uniformBufferStandardLayout = default;

		public this() {}
		public this(Bool32 uniformBufferStandardLayout_)
		{
			uniformBufferStandardLayout = uniformBufferStandardLayout_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderSubgroupExtendedTypesFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderSubgroupExtendedTypesFeatures;
		public void* pNext = null;
		public Bool32 shaderSubgroupExtendedTypes = default;

		public this() {}
		public this(Bool32 shaderSubgroupExtendedTypes_)
		{
			shaderSubgroupExtendedTypes = shaderSubgroupExtendedTypes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSeparateDepthStencilLayoutsFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceSeparateDepthStencilLayoutsFeatures;
		public void* pNext = null;
		public Bool32 separateDepthStencilLayouts = default;

		public this() {}
		public this(Bool32 separateDepthStencilLayouts_)
		{
			separateDepthStencilLayouts = separateDepthStencilLayouts_;
		}
	}

	[CRepr]
	public struct AttachmentReferenceStencilLayout 
	{
		public readonly StructureType sType = .AttachmentReferenceStencilLayout;
		public void* pNext = null;
		public ImageLayout stencilLayout = default;

		public this() {}
		public this(ImageLayout stencilLayout_)
		{
			stencilLayout = stencilLayout_;
		}
	}

	[CRepr]
	public struct AttachmentDescriptionStencilLayout 
	{
		public readonly StructureType sType = .AttachmentDescriptionStencilLayout;
		public void* pNext = null;
		public ImageLayout stencilInitialLayout = default;
		public ImageLayout stencilFinalLayout = default;

		public this() {}
		public this(ImageLayout stencilInitialLayout_,ImageLayout stencilFinalLayout_)
		{
			stencilInitialLayout = stencilInitialLayout_;
			stencilFinalLayout = stencilFinalLayout_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceHostQueryResetFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceHostQueryResetFeatures;
		public void* pNext = null;
		public Bool32 hostQueryReset = default;

		public this() {}
		public this(Bool32 hostQueryReset_)
		{
			hostQueryReset = hostQueryReset_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTimelineSemaphoreFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceTimelineSemaphoreFeatures;
		public void* pNext = null;
		public Bool32 timelineSemaphore = default;

		public this() {}
		public this(Bool32 timelineSemaphore_)
		{
			timelineSemaphore = timelineSemaphore_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTimelineSemaphoreProperties 
	{
		public readonly StructureType sType = .PhysicalDeviceTimelineSemaphoreProperties;
		public void* pNext = null;
		public uint64 maxTimelineSemaphoreValueDifference = default;

		public this() {}
		public this(uint64 maxTimelineSemaphoreValueDifference_)
		{
			maxTimelineSemaphoreValueDifference = maxTimelineSemaphoreValueDifference_;
		}
	}

	[CRepr]
	public struct SemaphoreTypeCreateInfo 
	{
		public readonly StructureType sType = .SemaphoreTypeCreateInfo;
		public void* pNext = null;
		public SemaphoreType semaphoreType = default;
		public uint64 initialValue = default;

		public this() {}
		public this(SemaphoreType semaphoreType_,uint64 initialValue_)
		{
			semaphoreType = semaphoreType_;
			initialValue = initialValue_;
		}
	}

	[CRepr]
	public struct TimelineSemaphoreSubmitInfo 
	{
		public readonly StructureType sType = .TimelineSemaphoreSubmitInfo;
		public void* pNext = null;
		public uint32 waitSemaphoreValueCount = default;
		public uint64* pWaitSemaphoreValues = default;
		public uint32 signalSemaphoreValueCount = default;
		public uint64* pSignalSemaphoreValues = default;

		public this() {}
		public this(uint32 waitSemaphoreValueCount_,uint64* pWaitSemaphoreValues_,uint32 signalSemaphoreValueCount_,uint64* pSignalSemaphoreValues_)
		{
			waitSemaphoreValueCount = waitSemaphoreValueCount_;
			pWaitSemaphoreValues = pWaitSemaphoreValues_;
			signalSemaphoreValueCount = signalSemaphoreValueCount_;
			pSignalSemaphoreValues = pSignalSemaphoreValues_;
		}
	}

	[CRepr]
	public struct SemaphoreWaitInfo 
	{
		public readonly StructureType sType = .SemaphoreWaitInfo;
		public void* pNext = null;
		public SemaphoreWaitFlags flags = default;
		public uint32 semaphoreCount = default;
		public Semaphore* pSemaphores = default;
		public uint64* pValues = default;

		public this() {}
		public this(SemaphoreWaitFlags flags_,uint32 semaphoreCount_,Semaphore* pSemaphores_,uint64* pValues_)
		{
			flags = flags_;
			semaphoreCount = semaphoreCount_;
			pSemaphores = pSemaphores_;
			pValues = pValues_;
		}
	}

	[CRepr]
	public struct SemaphoreSignalInfo 
	{
		public readonly StructureType sType = .SemaphoreSignalInfo;
		public void* pNext = null;
		public Semaphore semaphore = default;
		public uint64 value = default;

		public this() {}
		public this(Semaphore semaphore_,uint64 value_)
		{
			semaphore = semaphore_;
			value = value_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceBufferDeviceAddressFeatures 
	{
		public readonly StructureType sType = .PhysicalDeviceBufferDeviceAddressFeatures;
		public void* pNext = null;
		public Bool32 bufferDeviceAddress = default;
		public Bool32 bufferDeviceAddressCaptureReplay = default;
		public Bool32 bufferDeviceAddressMultiDevice = default;

		public this() {}
		public this(Bool32 bufferDeviceAddress_,Bool32 bufferDeviceAddressCaptureReplay_,Bool32 bufferDeviceAddressMultiDevice_)
		{
			bufferDeviceAddress = bufferDeviceAddress_;
			bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay_;
			bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice_;
		}
	}

	[CRepr]
	public struct BufferDeviceAddressInfo 
	{
		public readonly StructureType sType = .BufferDeviceAddressInfo;
		public void* pNext = null;
		public Buffer buffer = default;

		public this() {}
		public this(Buffer buffer_)
		{
			buffer = buffer_;
		}
	}

	[CRepr]
	public struct BufferOpaqueCaptureAddressCreateInfo 
	{
		public readonly StructureType sType = .BufferOpaqueCaptureAddressCreateInfo;
		public void* pNext = null;
		public uint64 opaqueCaptureAddress = default;

		public this() {}
		public this(uint64 opaqueCaptureAddress_)
		{
			opaqueCaptureAddress = opaqueCaptureAddress_;
		}
	}

	[CRepr]
	public struct MemoryOpaqueCaptureAddressAllocateInfo 
	{
		public readonly StructureType sType = .MemoryOpaqueCaptureAddressAllocateInfo;
		public void* pNext = null;
		public uint64 opaqueCaptureAddress = default;

		public this() {}
		public this(uint64 opaqueCaptureAddress_)
		{
			opaqueCaptureAddress = opaqueCaptureAddress_;
		}
	}

	[CRepr]
	public struct DeviceMemoryOpaqueCaptureAddressInfo 
	{
		public readonly StructureType sType = .DeviceMemoryOpaqueCaptureAddressInfo;
		public void* pNext = null;
		public DeviceMemory memory = default;

		public this() {}
		public this(DeviceMemory memory_)
		{
			memory = memory_;
		}
	}

	[CRepr]
	public struct SurfaceCapabilitiesKHR 
	{
		public uint32 minImageCount = default;
		public uint32 maxImageCount = default;
		public Extent2D currentExtent = default;
		public Extent2D minImageExtent = default;
		public Extent2D maxImageExtent = default;
		public uint32 maxImageArrayLayers = default;
		public SurfaceTransformFlagsKHR supportedTransforms = default;
		public SurfaceTransformFlagsKHR currentTransform = default;
		public CompositeAlphaFlagsKHR supportedCompositeAlpha = default;
		public ImageUsageFlags supportedUsageFlags = default;

		public this() {}
		public this(uint32 minImageCount_,uint32 maxImageCount_,Extent2D currentExtent_,Extent2D minImageExtent_,Extent2D maxImageExtent_,uint32 maxImageArrayLayers_,SurfaceTransformFlagsKHR supportedTransforms_,SurfaceTransformFlagsKHR currentTransform_,CompositeAlphaFlagsKHR supportedCompositeAlpha_,ImageUsageFlags supportedUsageFlags_)
		{
			minImageCount = minImageCount_;
			maxImageCount = maxImageCount_;
			currentExtent = currentExtent_;
			minImageExtent = minImageExtent_;
			maxImageExtent = maxImageExtent_;
			maxImageArrayLayers = maxImageArrayLayers_;
			supportedTransforms = supportedTransforms_;
			currentTransform = currentTransform_;
			supportedCompositeAlpha = supportedCompositeAlpha_;
			supportedUsageFlags = supportedUsageFlags_;
		}
	}

	[CRepr]
	public struct SurfaceFormatKHR 
	{
		public Format format = default;
		public ColorSpaceKHR colorSpace = default;

		public this() {}
		public this(Format format_,ColorSpaceKHR colorSpace_)
		{
			format = format_;
			colorSpace = colorSpace_;
		}
	}

	[CRepr]
	public struct SwapchainCreateInfoKHR 
	{
		public readonly StructureType sType = .SwapchainCreateInfoKHR;
		public void* pNext = null;
		public SwapchainCreateFlagsKHR flags = default;
		public SurfaceKHR surface = default;
		public uint32 minImageCount = default;
		public Format imageFormat = default;
		public ColorSpaceKHR imageColorSpace = default;
		public Extent2D imageExtent = default;
		public uint32 imageArrayLayers = default;
		public ImageUsageFlags imageUsage = default;
		public SharingMode imageSharingMode = default;
		public uint32 queueFamilyIndexCount = default;
		public uint32* pQueueFamilyIndices = default;
		public SurfaceTransformFlagsKHR preTransform = default;
		public CompositeAlphaFlagsKHR compositeAlpha = default;
		public PresentModeKHR presentMode = default;
		public Bool32 clipped = default;
		public SwapchainKHR oldSwapchain = default;

		public this() {}
		public this(SwapchainCreateFlagsKHR flags_,SurfaceKHR surface_,uint32 minImageCount_,Format imageFormat_,ColorSpaceKHR imageColorSpace_,Extent2D imageExtent_,uint32 imageArrayLayers_,ImageUsageFlags imageUsage_,SharingMode imageSharingMode_,uint32 queueFamilyIndexCount_,uint32* pQueueFamilyIndices_,SurfaceTransformFlagsKHR preTransform_,CompositeAlphaFlagsKHR compositeAlpha_,PresentModeKHR presentMode_,Bool32 clipped_,SwapchainKHR oldSwapchain_)
		{
			flags = flags_;
			surface = surface_;
			minImageCount = minImageCount_;
			imageFormat = imageFormat_;
			imageColorSpace = imageColorSpace_;
			imageExtent = imageExtent_;
			imageArrayLayers = imageArrayLayers_;
			imageUsage = imageUsage_;
			imageSharingMode = imageSharingMode_;
			queueFamilyIndexCount = queueFamilyIndexCount_;
			pQueueFamilyIndices = pQueueFamilyIndices_;
			preTransform = preTransform_;
			compositeAlpha = compositeAlpha_;
			presentMode = presentMode_;
			clipped = clipped_;
			oldSwapchain = oldSwapchain_;
		}
	}

	[CRepr]
	public struct PresentInfoKHR 
	{
		public readonly StructureType sType = .PresentInfoKHR;
		public void* pNext = null;
		public uint32 waitSemaphoreCount = default;
		public Semaphore* pWaitSemaphores = default;
		public uint32 swapchainCount = default;
		public SwapchainKHR* pSwapchains = default;
		public uint32* pImageIndices = default;
		public Result* pResults = default;

		public this() {}
		public this(uint32 waitSemaphoreCount_,Semaphore* pWaitSemaphores_,uint32 swapchainCount_,SwapchainKHR* pSwapchains_,uint32* pImageIndices_,Result* pResults_)
		{
			waitSemaphoreCount = waitSemaphoreCount_;
			pWaitSemaphores = pWaitSemaphores_;
			swapchainCount = swapchainCount_;
			pSwapchains = pSwapchains_;
			pImageIndices = pImageIndices_;
			pResults = pResults_;
		}
	}

	[CRepr]
	public struct ImageSwapchainCreateInfoKHR 
	{
		public readonly StructureType sType = .ImageSwapchainCreateInfoKHR;
		public void* pNext = null;
		public SwapchainKHR swapchain = default;

		public this() {}
		public this(SwapchainKHR swapchain_)
		{
			swapchain = swapchain_;
		}
	}

	[CRepr]
	public struct BindImageMemorySwapchainInfoKHR 
	{
		public readonly StructureType sType = .BindImageMemorySwapchainInfoKHR;
		public void* pNext = null;
		public SwapchainKHR swapchain = default;
		public uint32 imageIndex = default;

		public this() {}
		public this(SwapchainKHR swapchain_,uint32 imageIndex_)
		{
			swapchain = swapchain_;
			imageIndex = imageIndex_;
		}
	}

	[CRepr]
	public struct AcquireNextImageInfoKHR 
	{
		public readonly StructureType sType = .AcquireNextImageInfoKHR;
		public void* pNext = null;
		public SwapchainKHR swapchain = default;
		public uint64 timeout = default;
		public Semaphore semaphore = default;
		public Fence fence = default;
		public uint32 deviceMask = default;

		public this() {}
		public this(SwapchainKHR swapchain_,uint64 timeout_,Semaphore semaphore_,Fence fence_,uint32 deviceMask_)
		{
			swapchain = swapchain_;
			timeout = timeout_;
			semaphore = semaphore_;
			fence = fence_;
			deviceMask = deviceMask_;
		}
	}

	[CRepr]
	public struct DeviceGroupPresentCapabilitiesKHR 
	{
		public readonly StructureType sType = .DeviceGroupPresentCapabilitiesKHR;
		public void* pNext = null;
		public uint32[VK_MAX_DEVICE_GROUP_SIZE] presentMask = default;
		public DeviceGroupPresentModeFlagsKHR modes = default;

		public this() {}
		public this(uint32[Vulkan.VK_MAX_DEVICE_GROUP_SIZE] presentMask_,DeviceGroupPresentModeFlagsKHR modes_)
		{
			presentMask = presentMask_;
			modes = modes_;
		}
	}

	[CRepr]
	public struct DeviceGroupPresentInfoKHR 
	{
		public readonly StructureType sType = .DeviceGroupPresentInfoKHR;
		public void* pNext = null;
		public uint32 swapchainCount = default;
		public uint32* pDeviceMasks = default;
		public DeviceGroupPresentModeFlagsKHR mode = default;

		public this() {}
		public this(uint32 swapchainCount_,uint32* pDeviceMasks_,DeviceGroupPresentModeFlagsKHR mode_)
		{
			swapchainCount = swapchainCount_;
			pDeviceMasks = pDeviceMasks_;
			mode = mode_;
		}
	}

	[CRepr]
	public struct DeviceGroupSwapchainCreateInfoKHR 
	{
		public readonly StructureType sType = .DeviceGroupSwapchainCreateInfoKHR;
		public void* pNext = null;
		public DeviceGroupPresentModeFlagsKHR modes = default;

		public this() {}
		public this(DeviceGroupPresentModeFlagsKHR modes_)
		{
			modes = modes_;
		}
	}

	[CRepr]
	public struct DisplayPropertiesKHR 
	{
		public DisplayKHR display = default;
		public char8* displayName = default;
		public Extent2D physicalDimensions = default;
		public Extent2D physicalResolution = default;
		public SurfaceTransformFlagsKHR supportedTransforms = default;
		public Bool32 planeReorderPossible = default;
		public Bool32 persistentContent = default;

		public this() {}
		public this(DisplayKHR display_,char8* displayName_,Extent2D physicalDimensions_,Extent2D physicalResolution_,SurfaceTransformFlagsKHR supportedTransforms_,Bool32 planeReorderPossible_,Bool32 persistentContent_)
		{
			display = display_;
			displayName = displayName_;
			physicalDimensions = physicalDimensions_;
			physicalResolution = physicalResolution_;
			supportedTransforms = supportedTransforms_;
			planeReorderPossible = planeReorderPossible_;
			persistentContent = persistentContent_;
		}
	}

	[CRepr]
	public struct DisplayModeParametersKHR 
	{
		public Extent2D visibleRegion = default;
		public uint32 refreshRate = default;

		public this() {}
		public this(Extent2D visibleRegion_,uint32 refreshRate_)
		{
			visibleRegion = visibleRegion_;
			refreshRate = refreshRate_;
		}
	}

	[CRepr]
	public struct DisplayModePropertiesKHR 
	{
		public DisplayModeKHR displayMode = default;
		public DisplayModeParametersKHR parameters = default;

		public this() {}
		public this(DisplayModeKHR displayMode_,DisplayModeParametersKHR parameters_)
		{
			displayMode = displayMode_;
			parameters = parameters_;
		}
	}

	[CRepr]
	public struct DisplayModeCreateInfoKHR 
	{
		public readonly StructureType sType = .DisplayModeCreateInfoKHR;
		public void* pNext = null;
		public DisplayModeCreateFlagsKHR flags = default;
		public DisplayModeParametersKHR parameters = default;

		public this() {}
		public this(DisplayModeCreateFlagsKHR flags_,DisplayModeParametersKHR parameters_)
		{
			flags = flags_;
			parameters = parameters_;
		}
	}

	[CRepr]
	public struct DisplayPlaneCapabilitiesKHR 
	{
		public DisplayPlaneAlphaFlagsKHR supportedAlpha = default;
		public Offset2D minSrcPosition = default;
		public Offset2D maxSrcPosition = default;
		public Extent2D minSrcExtent = default;
		public Extent2D maxSrcExtent = default;
		public Offset2D minDstPosition = default;
		public Offset2D maxDstPosition = default;
		public Extent2D minDstExtent = default;
		public Extent2D maxDstExtent = default;

		public this() {}
		public this(DisplayPlaneAlphaFlagsKHR supportedAlpha_,Offset2D minSrcPosition_,Offset2D maxSrcPosition_,Extent2D minSrcExtent_,Extent2D maxSrcExtent_,Offset2D minDstPosition_,Offset2D maxDstPosition_,Extent2D minDstExtent_,Extent2D maxDstExtent_)
		{
			supportedAlpha = supportedAlpha_;
			minSrcPosition = minSrcPosition_;
			maxSrcPosition = maxSrcPosition_;
			minSrcExtent = minSrcExtent_;
			maxSrcExtent = maxSrcExtent_;
			minDstPosition = minDstPosition_;
			maxDstPosition = maxDstPosition_;
			minDstExtent = minDstExtent_;
			maxDstExtent = maxDstExtent_;
		}
	}

	[CRepr]
	public struct DisplayPlanePropertiesKHR 
	{
		public DisplayKHR currentDisplay = default;
		public uint32 currentStackIndex = default;

		public this() {}
		public this(DisplayKHR currentDisplay_,uint32 currentStackIndex_)
		{
			currentDisplay = currentDisplay_;
			currentStackIndex = currentStackIndex_;
		}
	}

	[CRepr]
	public struct DisplaySurfaceCreateInfoKHR 
	{
		public readonly StructureType sType = .DisplaySurfaceCreateInfoKHR;
		public void* pNext = null;
		public DisplaySurfaceCreateFlagsKHR flags = default;
		public DisplayModeKHR displayMode = default;
		public uint32 planeIndex = default;
		public uint32 planeStackIndex = default;
		public SurfaceTransformFlagsKHR transform = default;
		public float globalAlpha = default;
		public DisplayPlaneAlphaFlagsKHR alphaMode = default;
		public Extent2D imageExtent = default;

		public this() {}
		public this(DisplaySurfaceCreateFlagsKHR flags_,DisplayModeKHR displayMode_,uint32 planeIndex_,uint32 planeStackIndex_,SurfaceTransformFlagsKHR transform_,float globalAlpha_,DisplayPlaneAlphaFlagsKHR alphaMode_,Extent2D imageExtent_)
		{
			flags = flags_;
			displayMode = displayMode_;
			planeIndex = planeIndex_;
			planeStackIndex = planeStackIndex_;
			transform = transform_;
			globalAlpha = globalAlpha_;
			alphaMode = alphaMode_;
			imageExtent = imageExtent_;
		}
	}

	[CRepr]
	public struct DisplayPresentInfoKHR 
	{
		public readonly StructureType sType = .DisplayPresentInfoKHR;
		public void* pNext = null;
		public Rect2D srcRect = default;
		public Rect2D dstRect = default;
		public Bool32 persistent = default;

		public this() {}
		public this(Rect2D srcRect_,Rect2D dstRect_,Bool32 persistent_)
		{
			srcRect = srcRect_;
			dstRect = dstRect_;
			persistent = persistent_;
		}
	}

	[CRepr]
	public struct ImportMemoryFdInfoKHR 
	{
		public readonly StructureType sType = .ImportMemoryFdInfoKHR;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleType = default;
		public int fd = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleType_,int fd_)
		{
			handleType = handleType_;
			fd = fd_;
		}
	}

	[CRepr]
	public struct MemoryFdPropertiesKHR 
	{
		public readonly StructureType sType = .MemoryFdPropertiesKHR;
		public void* pNext = null;
		public uint32 memoryTypeBits = default;

		public this() {}
		public this(uint32 memoryTypeBits_)
		{
			memoryTypeBits = memoryTypeBits_;
		}
	}

	[CRepr]
	public struct MemoryGetFdInfoKHR 
	{
		public readonly StructureType sType = .MemoryGetFdInfoKHR;
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
	public struct ImportSemaphoreFdInfoKHR 
	{
		public readonly StructureType sType = .ImportSemaphoreFdInfoKHR;
		public void* pNext = null;
		public Semaphore semaphore = default;
		public SemaphoreImportFlags flags = default;
		public ExternalSemaphoreHandleTypeFlags handleType = default;
		public int fd = default;

		public this() {}
		public this(Semaphore semaphore_,SemaphoreImportFlags flags_,ExternalSemaphoreHandleTypeFlags handleType_,int fd_)
		{
			semaphore = semaphore_;
			flags = flags_;
			handleType = handleType_;
			fd = fd_;
		}
	}

	[CRepr]
	public struct SemaphoreGetFdInfoKHR 
	{
		public readonly StructureType sType = .SemaphoreGetFdInfoKHR;
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
	public struct PhysicalDevicePushDescriptorPropertiesKHR 
	{
		public readonly StructureType sType = .PhysicalDevicePushDescriptorPropertiesKHR;
		public void* pNext = null;
		public uint32 maxPushDescriptors = default;

		public this() {}
		public this(uint32 maxPushDescriptors_)
		{
			maxPushDescriptors = maxPushDescriptors_;
		}
	}

	[CRepr]
	public struct RectLayerKHR 
	{
		public Offset2D offset = default;
		public Extent2D extent = default;
		public uint32 layer = default;

		public this() {}
		public this(Offset2D offset_,Extent2D extent_,uint32 layer_)
		{
			offset = offset_;
			extent = extent_;
			layer = layer_;
		}
	}

	[CRepr]
	public struct PresentRegionKHR 
	{
		public uint32 rectangleCount = default;
		public RectLayerKHR* pRectangles = default;

		public this() {}
		public this(uint32 rectangleCount_,RectLayerKHR* pRectangles_)
		{
			rectangleCount = rectangleCount_;
			pRectangles = pRectangles_;
		}
	}

	[CRepr]
	public struct PresentRegionsKHR 
	{
		public readonly StructureType sType = .PresentRegionsKHR;
		public void* pNext = null;
		public uint32 swapchainCount = default;
		public PresentRegionKHR* pRegions = default;

		public this() {}
		public this(uint32 swapchainCount_,PresentRegionKHR* pRegions_)
		{
			swapchainCount = swapchainCount_;
			pRegions = pRegions_;
		}
	}

	[CRepr]
	public struct SharedPresentSurfaceCapabilitiesKHR 
	{
		public readonly StructureType sType = .SharedPresentSurfaceCapabilitiesKHR;
		public void* pNext = null;
		public ImageUsageFlags sharedPresentSupportedUsageFlags = default;

		public this() {}
		public this(ImageUsageFlags sharedPresentSupportedUsageFlags_)
		{
			sharedPresentSupportedUsageFlags = sharedPresentSupportedUsageFlags_;
		}
	}

	[CRepr]
	public struct ImportFenceFdInfoKHR 
	{
		public readonly StructureType sType = .ImportFenceFdInfoKHR;
		public void* pNext = null;
		public Fence fence = default;
		public FenceImportFlags flags = default;
		public ExternalFenceHandleTypeFlags handleType = default;
		public int fd = default;

		public this() {}
		public this(Fence fence_,FenceImportFlags flags_,ExternalFenceHandleTypeFlags handleType_,int fd_)
		{
			fence = fence_;
			flags = flags_;
			handleType = handleType_;
			fd = fd_;
		}
	}

	[CRepr]
	public struct FenceGetFdInfoKHR 
	{
		public readonly StructureType sType = .FenceGetFdInfoKHR;
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
	public struct PhysicalDevicePerformanceQueryFeaturesKHR 
	{
		public readonly StructureType sType = .PhysicalDevicePerformanceQueryFeaturesKHR;
		public void* pNext = null;
		public Bool32 performanceCounterQueryPools = default;
		public Bool32 performanceCounterMultipleQueryPools = default;

		public this() {}
		public this(Bool32 performanceCounterQueryPools_,Bool32 performanceCounterMultipleQueryPools_)
		{
			performanceCounterQueryPools = performanceCounterQueryPools_;
			performanceCounterMultipleQueryPools = performanceCounterMultipleQueryPools_;
		}
	}

	[CRepr]
	public struct PhysicalDevicePerformanceQueryPropertiesKHR 
	{
		public readonly StructureType sType = .PhysicalDevicePerformanceQueryPropertiesKHR;
		public void* pNext = null;
		public Bool32 allowCommandBufferQueryCopies = default;

		public this() {}
		public this(Bool32 allowCommandBufferQueryCopies_)
		{
			allowCommandBufferQueryCopies = allowCommandBufferQueryCopies_;
		}
	}

	[CRepr]
	public struct PerformanceCounterKHR 
	{
		public readonly StructureType sType = .PerformanceCounterKHR;
		public void* pNext = null;
		public PerformanceCounterUnitKHR unit = default;
		public PerformanceCounterScopeKHR _scope = default;
		public PerformanceCounterStorageKHR storage = default;
		public uint8[VK_UUID_SIZE] uuid = default;

		public this() {}
		public this(PerformanceCounterUnitKHR unit_,PerformanceCounterScopeKHR _scope_,PerformanceCounterStorageKHR storage_,uint8[Vulkan.VK_UUID_SIZE] uuid_)
		{
			unit = unit_;
			_scope = _scope_;
			storage = storage_;
			uuid = uuid_;
		}
	}

	[CRepr]
	public struct PerformanceCounterDescriptionKHR 
	{
		public readonly StructureType sType = .PerformanceCounterDescriptionKHR;
		public void* pNext = null;
		public PerformanceCounterDescriptionFlagsKHR flags = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] name = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] category = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;

		public this() {}
		public this(PerformanceCounterDescriptionFlagsKHR flags_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] name_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] category_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_)
		{
			flags = flags_;
			name = name_;
			category = category_;
			description = description_;
		}
	}

	[CRepr]
	public struct QueryPoolPerformanceCreateInfoKHR 
	{
		public readonly StructureType sType = .QueryPoolPerformanceCreateInfoKHR;
		public void* pNext = null;
		public uint32 queueFamilyIndex = default;
		public uint32 counterIndexCount = default;
		public uint32* pCounterIndices = default;

		public this() {}
		public this(uint32 queueFamilyIndex_,uint32 counterIndexCount_,uint32* pCounterIndices_)
		{
			queueFamilyIndex = queueFamilyIndex_;
			counterIndexCount = counterIndexCount_;
			pCounterIndices = pCounterIndices_;
		}
	}

	[CRepr]
	public struct AcquireProfilingLockInfoKHR 
	{
		public readonly StructureType sType = .AcquireProfilingLockInfoKHR;
		public void* pNext = null;
		public AcquireProfilingLockFlagsKHR flags = default;
		public uint64 timeout = default;

		public this() {}
		public this(AcquireProfilingLockFlagsKHR flags_,uint64 timeout_)
		{
			flags = flags_;
			timeout = timeout_;
		}
	}

	[CRepr]
	public struct PerformanceQuerySubmitInfoKHR 
	{
		public readonly StructureType sType = .PerformanceQuerySubmitInfoKHR;
		public void* pNext = null;
		public uint32 counterPassIndex = default;

		public this() {}
		public this(uint32 counterPassIndex_)
		{
			counterPassIndex = counterPassIndex_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSurfaceInfo2KHR 
	{
		public readonly StructureType sType = .PhysicalDeviceSurfaceInfo2KHR;
		public void* pNext = null;
		public SurfaceKHR surface = default;

		public this() {}
		public this(SurfaceKHR surface_)
		{
			surface = surface_;
		}
	}

	[CRepr]
	public struct SurfaceCapabilities2KHR 
	{
		public readonly StructureType sType = .SurfaceCapabilities2KHR;
		public void* pNext = null;
		public SurfaceCapabilitiesKHR surfaceCapabilities = default;

		public this() {}
		public this(SurfaceCapabilitiesKHR surfaceCapabilities_)
		{
			surfaceCapabilities = surfaceCapabilities_;
		}
	}

	[CRepr]
	public struct SurfaceFormat2KHR 
	{
		public readonly StructureType sType = .SurfaceFormat2KHR;
		public void* pNext = null;
		public SurfaceFormatKHR surfaceFormat = default;

		public this() {}
		public this(SurfaceFormatKHR surfaceFormat_)
		{
			surfaceFormat = surfaceFormat_;
		}
	}

	[CRepr]
	public struct DisplayProperties2KHR 
	{
		public readonly StructureType sType = .DisplayProperties2KHR;
		public void* pNext = null;
		public DisplayPropertiesKHR displayProperties = default;

		public this() {}
		public this(DisplayPropertiesKHR displayProperties_)
		{
			displayProperties = displayProperties_;
		}
	}

	[CRepr]
	public struct DisplayPlaneProperties2KHR 
	{
		public readonly StructureType sType = .DisplayPlaneProperties2KHR;
		public void* pNext = null;
		public DisplayPlanePropertiesKHR displayPlaneProperties = default;

		public this() {}
		public this(DisplayPlanePropertiesKHR displayPlaneProperties_)
		{
			displayPlaneProperties = displayPlaneProperties_;
		}
	}

	[CRepr]
	public struct DisplayModeProperties2KHR 
	{
		public readonly StructureType sType = .DisplayModeProperties2KHR;
		public void* pNext = null;
		public DisplayModePropertiesKHR displayModeProperties = default;

		public this() {}
		public this(DisplayModePropertiesKHR displayModeProperties_)
		{
			displayModeProperties = displayModeProperties_;
		}
	}

	[CRepr]
	public struct DisplayPlaneInfo2KHR 
	{
		public readonly StructureType sType = .DisplayPlaneInfo2KHR;
		public void* pNext = null;
		public DisplayModeKHR mode = default;
		public uint32 planeIndex = default;

		public this() {}
		public this(DisplayModeKHR mode_,uint32 planeIndex_)
		{
			mode = mode_;
			planeIndex = planeIndex_;
		}
	}

	[CRepr]
	public struct DisplayPlaneCapabilities2KHR 
	{
		public readonly StructureType sType = .DisplayPlaneCapabilities2KHR;
		public void* pNext = null;
		public DisplayPlaneCapabilitiesKHR capabilities = default;

		public this() {}
		public this(DisplayPlaneCapabilitiesKHR capabilities_)
		{
			capabilities = capabilities_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderClockFeaturesKHR 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderClockFeaturesKHR;
		public void* pNext = null;
		public Bool32 shaderSubgroupClock = default;
		public Bool32 shaderDeviceClock = default;

		public this() {}
		public this(Bool32 shaderSubgroupClock_,Bool32 shaderDeviceClock_)
		{
			shaderSubgroupClock = shaderSubgroupClock_;
			shaderDeviceClock = shaderDeviceClock_;
		}
	}

	[CRepr]
	public struct SurfaceProtectedCapabilitiesKHR 
	{
		public readonly StructureType sType = .SurfaceProtectedCapabilitiesKHR;
		public void* pNext = null;
		public Bool32 supportsProtected = default;

		public this() {}
		public this(Bool32 supportsProtected_)
		{
			supportsProtected = supportsProtected_;
		}
	}

	[CRepr]
	public struct PhysicalDevicePipelineExecutablePropertiesFeaturesKHR 
	{
		public readonly StructureType sType = .PhysicalDevicePipelineExecutablePropertiesFeaturesKHR;
		public void* pNext = null;
		public Bool32 pipelineExecutableInfo = default;

		public this() {}
		public this(Bool32 pipelineExecutableInfo_)
		{
			pipelineExecutableInfo = pipelineExecutableInfo_;
		}
	}

	[CRepr]
	public struct PipelineInfoKHR 
	{
		public readonly StructureType sType = .PipelineInfoKHR;
		public void* pNext = null;
		public Pipeline pipeline = default;

		public this() {}
		public this(Pipeline pipeline_)
		{
			pipeline = pipeline_;
		}
	}

	[CRepr]
	public struct PipelineExecutablePropertiesKHR 
	{
		public readonly StructureType sType = .PipelineExecutablePropertiesKHR;
		public void* pNext = null;
		public ShaderStageFlags stages = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] name = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;
		public uint32 subgroupSize = default;

		public this() {}
		public this(ShaderStageFlags stages_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] name_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_,uint32 subgroupSize_)
		{
			stages = stages_;
			name = name_;
			description = description_;
			subgroupSize = subgroupSize_;
		}
	}

	[CRepr]
	public struct PipelineExecutableInfoKHR 
	{
		public readonly StructureType sType = .PipelineExecutableInfoKHR;
		public void* pNext = null;
		public Pipeline pipeline = default;
		public uint32 executableIndex = default;

		public this() {}
		public this(Pipeline pipeline_,uint32 executableIndex_)
		{
			pipeline = pipeline_;
			executableIndex = executableIndex_;
		}
	}

	[CRepr]
	public struct PipelineExecutableStatisticKHR 
	{
		public readonly StructureType sType = .PipelineExecutableStatisticKHR;
		public void* pNext = null;
		public char8[VK_MAX_DESCRIPTION_SIZE] name = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;
		public PipelineExecutableStatisticFormatKHR format = default;
		public PipelineExecutableStatisticValueKHR value = default;

		public this() {}
		public this(char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] name_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_,PipelineExecutableStatisticFormatKHR format_,PipelineExecutableStatisticValueKHR value_)
		{
			name = name_;
			description = description_;
			format = format_;
			value = value_;
		}
	}

	[CRepr]
	public struct PipelineExecutableInternalRepresentationKHR 
	{
		public readonly StructureType sType = .PipelineExecutableInternalRepresentationKHR;
		public void* pNext = null;
		public char8[VK_MAX_DESCRIPTION_SIZE] name = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;
		public Bool32 isText = default;
		public uint dataSize = default;
		public void* pData = default;

		public this() {}
		public this(char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] name_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_,Bool32 isText_,uint dataSize_,void* pData_)
		{
			name = name_;
			description = description_;
			isText = isText_;
			dataSize = dataSize_;
			pData = pData_;
		}
	}

	[CRepr]
	public struct DebugReportCallbackCreateInfoEXT 
	{
		public readonly StructureType sType = .DebugReportCallbackCreateInfoEXT;
		public void* pNext = null;
		public DebugReportFlagsEXT flags = default;
		public PFN_vkDebugReportCallbackEXT pfnCallback = default;
		public void* pUserData = default;

		public this() {}
		public this(DebugReportFlagsEXT flags_,PFN_vkDebugReportCallbackEXT pfnCallback_,void* pUserData_)
		{
			flags = flags_;
			pfnCallback = pfnCallback_;
			pUserData = pUserData_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationStateRasterizationOrderAMD 
	{
		public readonly StructureType sType = .PipelineRasterizationStateRasterizationOrderAMD;
		public void* pNext = null;
		public RasterizationOrderAMD rasterizationOrder = default;

		public this() {}
		public this(RasterizationOrderAMD rasterizationOrder_)
		{
			rasterizationOrder = rasterizationOrder_;
		}
	}

	[CRepr]
	public struct DebugMarkerObjectNameInfoEXT 
	{
		public readonly StructureType sType = .DebugMarkerObjectNameInfoEXT;
		public void* pNext = null;
		public DebugReportObjectTypeEXT objectType = default;
		public uint64 object = default;
		public char8* pObjectName = default;

		public this() {}
		public this(DebugReportObjectTypeEXT objectType_,uint64 object_,char8* pObjectName_)
		{
			objectType = objectType_;
			object = object_;
			pObjectName = pObjectName_;
		}
	}

	[CRepr]
	public struct DebugMarkerObjectTagInfoEXT 
	{
		public readonly StructureType sType = .DebugMarkerObjectTagInfoEXT;
		public void* pNext = null;
		public DebugReportObjectTypeEXT objectType = default;
		public uint64 object = default;
		public uint64 tagName = default;
		public uint tagSize = default;
		public void* pTag = default;

		public this() {}
		public this(DebugReportObjectTypeEXT objectType_,uint64 object_,uint64 tagName_,uint tagSize_,void* pTag_)
		{
			objectType = objectType_;
			object = object_;
			tagName = tagName_;
			tagSize = tagSize_;
			pTag = pTag_;
		}
	}

	[CRepr]
	public struct DebugMarkerMarkerInfoEXT 
	{
		public readonly StructureType sType = .DebugMarkerMarkerInfoEXT;
		public void* pNext = null;
		public char8* pMarkerName = default;
		public float[4] color = default;

		public this() {}
		public this(char8* pMarkerName_,float[4] color_)
		{
			pMarkerName = pMarkerName_;
			color = color_;
		}
	}

	[CRepr]
	public struct DedicatedAllocationImageCreateInfoNV 
	{
		public readonly StructureType sType = .DedicatedAllocationImageCreateInfoNV;
		public void* pNext = null;
		public Bool32 dedicatedAllocation = default;

		public this() {}
		public this(Bool32 dedicatedAllocation_)
		{
			dedicatedAllocation = dedicatedAllocation_;
		}
	}

	[CRepr]
	public struct DedicatedAllocationBufferCreateInfoNV 
	{
		public readonly StructureType sType = .DedicatedAllocationBufferCreateInfoNV;
		public void* pNext = null;
		public Bool32 dedicatedAllocation = default;

		public this() {}
		public this(Bool32 dedicatedAllocation_)
		{
			dedicatedAllocation = dedicatedAllocation_;
		}
	}

	[CRepr]
	public struct DedicatedAllocationMemoryAllocateInfoNV 
	{
		public readonly StructureType sType = .DedicatedAllocationMemoryAllocateInfoNV;
		public void* pNext = null;
		public Image image = default;
		public Buffer buffer = default;

		public this() {}
		public this(Image image_,Buffer buffer_)
		{
			image = image_;
			buffer = buffer_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTransformFeedbackFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceTransformFeedbackFeaturesEXT;
		public void* pNext = null;
		public Bool32 transformFeedback = default;
		public Bool32 geometryStreams = default;

		public this() {}
		public this(Bool32 transformFeedback_,Bool32 geometryStreams_)
		{
			transformFeedback = transformFeedback_;
			geometryStreams = geometryStreams_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTransformFeedbackPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceTransformFeedbackPropertiesEXT;
		public void* pNext = null;
		public uint32 maxTransformFeedbackStreams = default;
		public uint32 maxTransformFeedbackBuffers = default;
		public DeviceSize maxTransformFeedbackBufferSize = default;
		public uint32 maxTransformFeedbackStreamDataSize = default;
		public uint32 maxTransformFeedbackBufferDataSize = default;
		public uint32 maxTransformFeedbackBufferDataStride = default;
		public Bool32 transformFeedbackQueries = default;
		public Bool32 transformFeedbackStreamsLinesTriangles = default;
		public Bool32 transformFeedbackRasterizationStreamSelect = default;
		public Bool32 transformFeedbackDraw = default;

		public this() {}
		public this(uint32 maxTransformFeedbackStreams_,uint32 maxTransformFeedbackBuffers_,DeviceSize maxTransformFeedbackBufferSize_,uint32 maxTransformFeedbackStreamDataSize_,uint32 maxTransformFeedbackBufferDataSize_,uint32 maxTransformFeedbackBufferDataStride_,Bool32 transformFeedbackQueries_,Bool32 transformFeedbackStreamsLinesTriangles_,Bool32 transformFeedbackRasterizationStreamSelect_,Bool32 transformFeedbackDraw_)
		{
			maxTransformFeedbackStreams = maxTransformFeedbackStreams_;
			maxTransformFeedbackBuffers = maxTransformFeedbackBuffers_;
			maxTransformFeedbackBufferSize = maxTransformFeedbackBufferSize_;
			maxTransformFeedbackStreamDataSize = maxTransformFeedbackStreamDataSize_;
			maxTransformFeedbackBufferDataSize = maxTransformFeedbackBufferDataSize_;
			maxTransformFeedbackBufferDataStride = maxTransformFeedbackBufferDataStride_;
			transformFeedbackQueries = transformFeedbackQueries_;
			transformFeedbackStreamsLinesTriangles = transformFeedbackStreamsLinesTriangles_;
			transformFeedbackRasterizationStreamSelect = transformFeedbackRasterizationStreamSelect_;
			transformFeedbackDraw = transformFeedbackDraw_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationStateStreamCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineRasterizationStateStreamCreateInfoEXT;
		public void* pNext = null;
		public PipelineRasterizationStateStreamCreateFlagsEXT flags = default;
		public uint32 rasterizationStream = default;

		public this() {}
		public this(PipelineRasterizationStateStreamCreateFlagsEXT flags_,uint32 rasterizationStream_)
		{
			flags = flags_;
			rasterizationStream = rasterizationStream_;
		}
	}

	[CRepr]
	public struct ImageViewHandleInfoNVX 
	{
		public readonly StructureType sType = .ImageViewHandleInfoNVX;
		public void* pNext = null;
		public ImageView imageView = default;
		public DescriptorType descriptorType = default;
		public Sampler sampler = default;

		public this() {}
		public this(ImageView imageView_,DescriptorType descriptorType_,Sampler sampler_)
		{
			imageView = imageView_;
			descriptorType = descriptorType_;
			sampler = sampler_;
		}
	}

	[CRepr]
	public struct TextureLODGatherFormatPropertiesAMD 
	{
		public readonly StructureType sType = .TextureLodGatherFormatPropertiesAMD;
		public void* pNext = null;
		public Bool32 supportsTextureGatherLODBiasAMD = default;

		public this() {}
		public this(Bool32 supportsTextureGatherLODBiasAMD_)
		{
			supportsTextureGatherLODBiasAMD = supportsTextureGatherLODBiasAMD_;
		}
	}

	[CRepr]
	public struct ShaderResourceUsageAMD 
	{
		public uint32 numUsedVgprs = default;
		public uint32 numUsedSgprs = default;
		public uint32 ldsSizePerLocalWorkGroup = default;
		public uint ldsUsageSizeInBytes = default;
		public uint scratchMemUsageInBytes = default;

		public this() {}
		public this(uint32 numUsedVgprs_,uint32 numUsedSgprs_,uint32 ldsSizePerLocalWorkGroup_,uint ldsUsageSizeInBytes_,uint scratchMemUsageInBytes_)
		{
			numUsedVgprs = numUsedVgprs_;
			numUsedSgprs = numUsedSgprs_;
			ldsSizePerLocalWorkGroup = ldsSizePerLocalWorkGroup_;
			ldsUsageSizeInBytes = ldsUsageSizeInBytes_;
			scratchMemUsageInBytes = scratchMemUsageInBytes_;
		}
	}

	[CRepr]
	public struct ShaderStatisticsInfoAMD 
	{
		public ShaderStageFlags shaderStageMask = default;
		public ShaderResourceUsageAMD resourceUsage = default;
		public uint32 numPhysicalVgprs = default;
		public uint32 numPhysicalSgprs = default;
		public uint32 numAvailableVgprs = default;
		public uint32 numAvailableSgprs = default;
		public uint32[3] computeWorkGroupSize = default;

		public this() {}
		public this(ShaderStageFlags shaderStageMask_,ShaderResourceUsageAMD resourceUsage_,uint32 numPhysicalVgprs_,uint32 numPhysicalSgprs_,uint32 numAvailableVgprs_,uint32 numAvailableSgprs_,uint32[3] computeWorkGroupSize_)
		{
			shaderStageMask = shaderStageMask_;
			resourceUsage = resourceUsage_;
			numPhysicalVgprs = numPhysicalVgprs_;
			numPhysicalSgprs = numPhysicalSgprs_;
			numAvailableVgprs = numAvailableVgprs_;
			numAvailableSgprs = numAvailableSgprs_;
			computeWorkGroupSize = computeWorkGroupSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceCornerSampledImageFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceCornerSampledImageFeaturesNV;
		public void* pNext = null;
		public Bool32 cornerSampledImage = default;

		public this() {}
		public this(Bool32 cornerSampledImage_)
		{
			cornerSampledImage = cornerSampledImage_;
		}
	}

	[CRepr]
	public struct ExternalImageFormatPropertiesNV 
	{
		public ImageFormatProperties imageFormatProperties = default;
		public ExternalMemoryFeatureFlagsNV externalMemoryFeatures = default;
		public ExternalMemoryHandleTypeFlagsNV exportFromImportedHandleTypes = default;
		public ExternalMemoryHandleTypeFlagsNV compatibleHandleTypes = default;

		public this() {}
		public this(ImageFormatProperties imageFormatProperties_,ExternalMemoryFeatureFlagsNV externalMemoryFeatures_,ExternalMemoryHandleTypeFlagsNV exportFromImportedHandleTypes_,ExternalMemoryHandleTypeFlagsNV compatibleHandleTypes_)
		{
			imageFormatProperties = imageFormatProperties_;
			externalMemoryFeatures = externalMemoryFeatures_;
			exportFromImportedHandleTypes = exportFromImportedHandleTypes_;
			compatibleHandleTypes = compatibleHandleTypes_;
		}
	}

	[CRepr]
	public struct ExternalMemoryImageCreateInfoNV 
	{
		public readonly StructureType sType = .ExternalMemoryImageCreateInfoNV;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlagsNV handleTypes = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlagsNV handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct ExportMemoryAllocateInfoNV 
	{
		public readonly StructureType sType = .ExportMemoryAllocateInfoNV;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlagsNV handleTypes = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlagsNV handleTypes_)
		{
			handleTypes = handleTypes_;
		}
	}

	[CRepr]
	public struct ValidationFlagsEXT 
	{
		public readonly StructureType sType = .ValidationFlagsEXT;
		public void* pNext = null;
		public uint32 disabledValidationCheckCount = default;
		public ValidationCheckEXT* pDisabledValidationChecks = default;

		public this() {}
		public this(uint32 disabledValidationCheckCount_,ValidationCheckEXT* pDisabledValidationChecks_)
		{
			disabledValidationCheckCount = disabledValidationCheckCount_;
			pDisabledValidationChecks = pDisabledValidationChecks_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceTextureCompressionAstcHdrFeaturesEXT;
		public void* pNext = null;
		public Bool32 textureCompressionASTC_HDR = default;

		public this() {}
		public this(Bool32 textureCompressionASTC_HDR_)
		{
			textureCompressionASTC_HDR = textureCompressionASTC_HDR_;
		}
	}

	[CRepr]
	public struct ImageViewASTCDecodeModeEXT 
	{
		public readonly StructureType sType = .ImageViewAstcDecodeModeEXT;
		public void* pNext = null;
		public Format decodeMode = default;

		public this() {}
		public this(Format decodeMode_)
		{
			decodeMode = decodeMode_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceASTCDecodeFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceAstcDecodeFeaturesEXT;
		public void* pNext = null;
		public Bool32 decodeModeSharedExponent = default;

		public this() {}
		public this(Bool32 decodeModeSharedExponent_)
		{
			decodeModeSharedExponent = decodeModeSharedExponent_;
		}
	}

	[CRepr]
	public struct ConditionalRenderingBeginInfoEXT 
	{
		public readonly StructureType sType = .ConditionalRenderingBeginInfoEXT;
		public void* pNext = null;
		public Buffer buffer = default;
		public DeviceSize offset = default;
		public ConditionalRenderingFlagsEXT flags = default;

		public this() {}
		public this(Buffer buffer_,DeviceSize offset_,ConditionalRenderingFlagsEXT flags_)
		{
			buffer = buffer_;
			offset = offset_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceConditionalRenderingFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceConditionalRenderingFeaturesEXT;
		public void* pNext = null;
		public Bool32 conditionalRendering = default;
		public Bool32 inheritedConditionalRendering = default;

		public this() {}
		public this(Bool32 conditionalRendering_,Bool32 inheritedConditionalRendering_)
		{
			conditionalRendering = conditionalRendering_;
			inheritedConditionalRendering = inheritedConditionalRendering_;
		}
	}

	[CRepr]
	public struct CommandBufferInheritanceConditionalRenderingInfoEXT 
	{
		public readonly StructureType sType = .CommandBufferInheritanceConditionalRenderingInfoEXT;
		public void* pNext = null;
		public Bool32 conditionalRenderingEnable = default;

		public this() {}
		public this(Bool32 conditionalRenderingEnable_)
		{
			conditionalRenderingEnable = conditionalRenderingEnable_;
		}
	}

	[CRepr]
	public struct ViewportWScalingNV 
	{
		public float xcoeff = default;
		public float ycoeff = default;

		public this() {}
		public this(float xcoeff_,float ycoeff_)
		{
			xcoeff = xcoeff_;
			ycoeff = ycoeff_;
		}
	}

	[CRepr]
	public struct PipelineViewportWScalingStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineViewportWScalingStateCreateInfoNV;
		public void* pNext = null;
		public Bool32 viewportWScalingEnable = default;
		public uint32 viewportCount = default;
		public ViewportWScalingNV* pViewportWScalings = default;

		public this() {}
		public this(Bool32 viewportWScalingEnable_,uint32 viewportCount_,ViewportWScalingNV* pViewportWScalings_)
		{
			viewportWScalingEnable = viewportWScalingEnable_;
			viewportCount = viewportCount_;
			pViewportWScalings = pViewportWScalings_;
		}
	}

	[CRepr]
	public struct SurfaceCapabilities2EXT 
	{
		public readonly StructureType sType = .SurfaceCapabilities2EXT;
		public void* pNext = null;
		public uint32 minImageCount = default;
		public uint32 maxImageCount = default;
		public Extent2D currentExtent = default;
		public Extent2D minImageExtent = default;
		public Extent2D maxImageExtent = default;
		public uint32 maxImageArrayLayers = default;
		public SurfaceTransformFlagsKHR supportedTransforms = default;
		public SurfaceTransformFlagsKHR currentTransform = default;
		public CompositeAlphaFlagsKHR supportedCompositeAlpha = default;
		public ImageUsageFlags supportedUsageFlags = default;
		public SurfaceCounterFlagsEXT supportedSurfaceCounters = default;

		public this() {}
		public this(uint32 minImageCount_,uint32 maxImageCount_,Extent2D currentExtent_,Extent2D minImageExtent_,Extent2D maxImageExtent_,uint32 maxImageArrayLayers_,SurfaceTransformFlagsKHR supportedTransforms_,SurfaceTransformFlagsKHR currentTransform_,CompositeAlphaFlagsKHR supportedCompositeAlpha_,ImageUsageFlags supportedUsageFlags_,SurfaceCounterFlagsEXT supportedSurfaceCounters_)
		{
			minImageCount = minImageCount_;
			maxImageCount = maxImageCount_;
			currentExtent = currentExtent_;
			minImageExtent = minImageExtent_;
			maxImageExtent = maxImageExtent_;
			maxImageArrayLayers = maxImageArrayLayers_;
			supportedTransforms = supportedTransforms_;
			currentTransform = currentTransform_;
			supportedCompositeAlpha = supportedCompositeAlpha_;
			supportedUsageFlags = supportedUsageFlags_;
			supportedSurfaceCounters = supportedSurfaceCounters_;
		}
	}

	[CRepr]
	public struct DisplayPowerInfoEXT 
	{
		public readonly StructureType sType = .DisplayPowerInfoEXT;
		public void* pNext = null;
		public DisplayPowerStateEXT powerState = default;

		public this() {}
		public this(DisplayPowerStateEXT powerState_)
		{
			powerState = powerState_;
		}
	}

	[CRepr]
	public struct DeviceEventInfoEXT 
	{
		public readonly StructureType sType = .DeviceEventInfoEXT;
		public void* pNext = null;
		public DeviceEventTypeEXT deviceEvent = default;

		public this() {}
		public this(DeviceEventTypeEXT deviceEvent_)
		{
			deviceEvent = deviceEvent_;
		}
	}

	[CRepr]
	public struct DisplayEventInfoEXT 
	{
		public readonly StructureType sType = .DisplayEventInfoEXT;
		public void* pNext = null;
		public DisplayEventTypeEXT displayEvent = default;

		public this() {}
		public this(DisplayEventTypeEXT displayEvent_)
		{
			displayEvent = displayEvent_;
		}
	}

	[CRepr]
	public struct SwapchainCounterCreateInfoEXT 
	{
		public readonly StructureType sType = .SwapchainCounterCreateInfoEXT;
		public void* pNext = null;
		public SurfaceCounterFlagsEXT surfaceCounters = default;

		public this() {}
		public this(SurfaceCounterFlagsEXT surfaceCounters_)
		{
			surfaceCounters = surfaceCounters_;
		}
	}

	[CRepr]
	public struct RefreshCycleDurationGOOGLE 
	{
		public uint64 refreshDuration = default;

		public this() {}
		public this(uint64 refreshDuration_)
		{
			refreshDuration = refreshDuration_;
		}
	}

	[CRepr]
	public struct PastPresentationTimingGOOGLE 
	{
		public uint32 presentID = default;
		public uint64 desiredPresentTime = default;
		public uint64 actualPresentTime = default;
		public uint64 earliestPresentTime = default;
		public uint64 presentMargin = default;

		public this() {}
		public this(uint32 presentID_,uint64 desiredPresentTime_,uint64 actualPresentTime_,uint64 earliestPresentTime_,uint64 presentMargin_)
		{
			presentID = presentID_;
			desiredPresentTime = desiredPresentTime_;
			actualPresentTime = actualPresentTime_;
			earliestPresentTime = earliestPresentTime_;
			presentMargin = presentMargin_;
		}
	}

	[CRepr]
	public struct PresentTimeGOOGLE 
	{
		public uint32 presentID = default;
		public uint64 desiredPresentTime = default;

		public this() {}
		public this(uint32 presentID_,uint64 desiredPresentTime_)
		{
			presentID = presentID_;
			desiredPresentTime = desiredPresentTime_;
		}
	}

	[CRepr]
	public struct PresentTimesInfoGOOGLE 
	{
		public readonly StructureType sType = .PresentTimesInfoGOOGLE;
		public void* pNext = null;
		public uint32 swapchainCount = default;
		public PresentTimeGOOGLE* pTimes = default;

		public this() {}
		public this(uint32 swapchainCount_,PresentTimeGOOGLE* pTimes_)
		{
			swapchainCount = swapchainCount_;
			pTimes = pTimes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX 
	{
		public readonly StructureType sType = .PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX;
		public void* pNext = null;
		public Bool32 perViewPositionAllComponents = default;

		public this() {}
		public this(Bool32 perViewPositionAllComponents_)
		{
			perViewPositionAllComponents = perViewPositionAllComponents_;
		}
	}

	[CRepr]
	public struct ViewportSwizzleNV 
	{
		public ViewportCoordinateSwizzleNV x = default;
		public ViewportCoordinateSwizzleNV y = default;
		public ViewportCoordinateSwizzleNV z = default;
		public ViewportCoordinateSwizzleNV w = default;

		public this() {}
		public this(ViewportCoordinateSwizzleNV x_,ViewportCoordinateSwizzleNV y_,ViewportCoordinateSwizzleNV z_,ViewportCoordinateSwizzleNV w_)
		{
			x = x_;
			y = y_;
			z = z_;
			w = w_;
		}
	}

	[CRepr]
	public struct PipelineViewportSwizzleStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineViewportSwizzleStateCreateInfoNV;
		public void* pNext = null;
		public PipelineViewportSwizzleStateCreateFlagsNV flags = default;
		public uint32 viewportCount = default;
		public ViewportSwizzleNV* pViewportSwizzles = default;

		public this() {}
		public this(PipelineViewportSwizzleStateCreateFlagsNV flags_,uint32 viewportCount_,ViewportSwizzleNV* pViewportSwizzles_)
		{
			flags = flags_;
			viewportCount = viewportCount_;
			pViewportSwizzles = pViewportSwizzles_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDiscardRectanglePropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceDiscardRectanglePropertiesEXT;
		public void* pNext = null;
		public uint32 maxDiscardRectangles = default;

		public this() {}
		public this(uint32 maxDiscardRectangles_)
		{
			maxDiscardRectangles = maxDiscardRectangles_;
		}
	}

	[CRepr]
	public struct PipelineDiscardRectangleStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineDiscardRectangleStateCreateInfoEXT;
		public void* pNext = null;
		public PipelineDiscardRectangleStateCreateFlagsEXT flags = default;
		public DiscardRectangleModeEXT discardRectangleMode = default;
		public uint32 discardRectangleCount = default;
		public Rect2D* pDiscardRectangles = default;

		public this() {}
		public this(PipelineDiscardRectangleStateCreateFlagsEXT flags_,DiscardRectangleModeEXT discardRectangleMode_,uint32 discardRectangleCount_,Rect2D* pDiscardRectangles_)
		{
			flags = flags_;
			discardRectangleMode = discardRectangleMode_;
			discardRectangleCount = discardRectangleCount_;
			pDiscardRectangles = pDiscardRectangles_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceConservativeRasterizationPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceConservativeRasterizationPropertiesEXT;
		public void* pNext = null;
		public float primitiveOverestimationSize = default;
		public float maxExtraPrimitiveOverestimationSize = default;
		public float extraPrimitiveOverestimationSizeGranularity = default;
		public Bool32 primitiveUnderestimation = default;
		public Bool32 conservativePointAndLineRasterization = default;
		public Bool32 degenerateTrianglesRasterized = default;
		public Bool32 degenerateLinesRasterized = default;
		public Bool32 fullyCoveredFragmentShaderInputVariable = default;
		public Bool32 conservativeRasterizationPostDepthCoverage = default;

		public this() {}
		public this(float primitiveOverestimationSize_,float maxExtraPrimitiveOverestimationSize_,float extraPrimitiveOverestimationSizeGranularity_,Bool32 primitiveUnderestimation_,Bool32 conservativePointAndLineRasterization_,Bool32 degenerateTrianglesRasterized_,Bool32 degenerateLinesRasterized_,Bool32 fullyCoveredFragmentShaderInputVariable_,Bool32 conservativeRasterizationPostDepthCoverage_)
		{
			primitiveOverestimationSize = primitiveOverestimationSize_;
			maxExtraPrimitiveOverestimationSize = maxExtraPrimitiveOverestimationSize_;
			extraPrimitiveOverestimationSizeGranularity = extraPrimitiveOverestimationSizeGranularity_;
			primitiveUnderestimation = primitiveUnderestimation_;
			conservativePointAndLineRasterization = conservativePointAndLineRasterization_;
			degenerateTrianglesRasterized = degenerateTrianglesRasterized_;
			degenerateLinesRasterized = degenerateLinesRasterized_;
			fullyCoveredFragmentShaderInputVariable = fullyCoveredFragmentShaderInputVariable_;
			conservativeRasterizationPostDepthCoverage = conservativeRasterizationPostDepthCoverage_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationConservativeStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineRasterizationConservativeStateCreateInfoEXT;
		public void* pNext = null;
		public PipelineRasterizationConservativeStateCreateFlagsEXT flags = default;
		public ConservativeRasterizationModeEXT conservativeRasterizationMode = default;
		public float extraPrimitiveOverestimationSize = default;

		public this() {}
		public this(PipelineRasterizationConservativeStateCreateFlagsEXT flags_,ConservativeRasterizationModeEXT conservativeRasterizationMode_,float extraPrimitiveOverestimationSize_)
		{
			flags = flags_;
			conservativeRasterizationMode = conservativeRasterizationMode_;
			extraPrimitiveOverestimationSize = extraPrimitiveOverestimationSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDepthClipEnableFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceDepthClipEnableFeaturesEXT;
		public void* pNext = null;
		public Bool32 depthClipEnable = default;

		public this() {}
		public this(Bool32 depthClipEnable_)
		{
			depthClipEnable = depthClipEnable_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationDepthClipStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineRasterizationDepthClipStateCreateInfoEXT;
		public void* pNext = null;
		public PipelineRasterizationDepthClipStateCreateFlagsEXT flags = default;
		public Bool32 depthClipEnable = default;

		public this() {}
		public this(PipelineRasterizationDepthClipStateCreateFlagsEXT flags_,Bool32 depthClipEnable_)
		{
			flags = flags_;
			depthClipEnable = depthClipEnable_;
		}
	}

	[CRepr]
	public struct XYColorEXT 
	{
		public float x = default;
		public float y = default;

		public this() {}
		public this(float x_,float y_)
		{
			x = x_;
			y = y_;
		}
	}

	[CRepr]
	public struct HdrMetadataEXT 
	{
		public readonly StructureType sType = .HdrMetadataEXT;
		public void* pNext = null;
		public XYColorEXT displayPrimaryRed = default;
		public XYColorEXT displayPrimaryGreen = default;
		public XYColorEXT displayPrimaryBlue = default;
		public XYColorEXT whitePoint = default;
		public float maxLuminance = default;
		public float minLuminance = default;
		public float maxContentLightLevel = default;
		public float maxFrameAverageLightLevel = default;

		public this() {}
		public this(XYColorEXT displayPrimaryRed_,XYColorEXT displayPrimaryGreen_,XYColorEXT displayPrimaryBlue_,XYColorEXT whitePoint_,float maxLuminance_,float minLuminance_,float maxContentLightLevel_,float maxFrameAverageLightLevel_)
		{
			displayPrimaryRed = displayPrimaryRed_;
			displayPrimaryGreen = displayPrimaryGreen_;
			displayPrimaryBlue = displayPrimaryBlue_;
			whitePoint = whitePoint_;
			maxLuminance = maxLuminance_;
			minLuminance = minLuminance_;
			maxContentLightLevel = maxContentLightLevel_;
			maxFrameAverageLightLevel = maxFrameAverageLightLevel_;
		}
	}

	[CRepr]
	public struct DebugUtilsObjectNameInfoEXT 
	{
		public readonly StructureType sType = .DebugUtilsObjectNameInfoEXT;
		public void* pNext = null;
		public ObjectType objectType = default;
		public uint64 objectHandle = default;
		public char8* pObjectName = default;

		public this() {}
		public this(ObjectType objectType_,uint64 objectHandle_,char8* pObjectName_)
		{
			objectType = objectType_;
			objectHandle = objectHandle_;
			pObjectName = pObjectName_;
		}
	}

	[CRepr]
	public struct DebugUtilsObjectTagInfoEXT 
	{
		public readonly StructureType sType = .DebugUtilsObjectTagInfoEXT;
		public void* pNext = null;
		public ObjectType objectType = default;
		public uint64 objectHandle = default;
		public uint64 tagName = default;
		public uint tagSize = default;
		public void* pTag = default;

		public this() {}
		public this(ObjectType objectType_,uint64 objectHandle_,uint64 tagName_,uint tagSize_,void* pTag_)
		{
			objectType = objectType_;
			objectHandle = objectHandle_;
			tagName = tagName_;
			tagSize = tagSize_;
			pTag = pTag_;
		}
	}

	[CRepr]
	public struct DebugUtilsLabelEXT 
	{
		public readonly StructureType sType = .DebugUtilsLabelEXT;
		public void* pNext = null;
		public char8* pLabelName = default;
		public float[4] color = default;

		public this() {}
		public this(char8* pLabelName_,float[4] color_)
		{
			pLabelName = pLabelName_;
			color = color_;
		}
	}

	[CRepr]
	public struct DebugUtilsMessengerCallbackDataEXT 
	{
		public readonly StructureType sType = .DebugUtilsMessengerCallbackDataEXT;
		public void* pNext = null;
		public DebugUtilsMessengerCallbackDataFlagsEXT flags = default;
		public char8* pMessageIdName = default;
		public int32 messageIdNumber = default;
		public char8* pMessage = default;
		public uint32 queueLabelCount = default;
		public DebugUtilsLabelEXT* pQueueLabels = default;
		public uint32 cmdBufLabelCount = default;
		public DebugUtilsLabelEXT* pCmdBufLabels = default;
		public uint32 objectCount = default;
		public DebugUtilsObjectNameInfoEXT* pObjects = default;

		public this() {}
		public this(DebugUtilsMessengerCallbackDataFlagsEXT flags_,char8* pMessageIdName_,int32 messageIdNumber_,char8* pMessage_,uint32 queueLabelCount_,DebugUtilsLabelEXT* pQueueLabels_,uint32 cmdBufLabelCount_,DebugUtilsLabelEXT* pCmdBufLabels_,uint32 objectCount_,DebugUtilsObjectNameInfoEXT* pObjects_)
		{
			flags = flags_;
			pMessageIdName = pMessageIdName_;
			messageIdNumber = messageIdNumber_;
			pMessage = pMessage_;
			queueLabelCount = queueLabelCount_;
			pQueueLabels = pQueueLabels_;
			cmdBufLabelCount = cmdBufLabelCount_;
			pCmdBufLabels = pCmdBufLabels_;
			objectCount = objectCount_;
			pObjects = pObjects_;
		}
	}

	[CRepr]
	public struct DebugUtilsMessengerCreateInfoEXT 
	{
		public readonly StructureType sType = .DebugUtilsMessengerCreateInfoEXT;
		public void* pNext = null;
		public DebugUtilsMessengerCreateFlagsEXT flags = default;
		public DebugUtilsMessageSeverityFlagsEXT messageSeverity = default;
		public DebugUtilsMessageTypeFlagsEXT messageType = default;
		public PFN_vkDebugUtilsMessengerCallbackEXT pfnUserCallback = default;
		public void* pUserData = default;

		public this() {}
		public this(DebugUtilsMessengerCreateFlagsEXT flags_,DebugUtilsMessageSeverityFlagsEXT messageSeverity_,DebugUtilsMessageTypeFlagsEXT messageType_,PFN_vkDebugUtilsMessengerCallbackEXT pfnUserCallback_,void* pUserData_)
		{
			flags = flags_;
			messageSeverity = messageSeverity_;
			messageType = messageType_;
			pfnUserCallback = pfnUserCallback_;
			pUserData = pUserData_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceInlineUniformBlockFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceInlineUniformBlockFeaturesEXT;
		public void* pNext = null;
		public Bool32 inlineUniformBlock = default;
		public Bool32 descriptorBindingInlineUniformBlockUpdateAfterBind = default;

		public this() {}
		public this(Bool32 inlineUniformBlock_,Bool32 descriptorBindingInlineUniformBlockUpdateAfterBind_)
		{
			inlineUniformBlock = inlineUniformBlock_;
			descriptorBindingInlineUniformBlockUpdateAfterBind = descriptorBindingInlineUniformBlockUpdateAfterBind_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceInlineUniformBlockPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceInlineUniformBlockPropertiesEXT;
		public void* pNext = null;
		public uint32 maxInlineUniformBlockSize = default;
		public uint32 maxPerStageDescriptorInlineUniformBlocks = default;
		public uint32 maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks = default;
		public uint32 maxDescriptorSetInlineUniformBlocks = default;
		public uint32 maxDescriptorSetUpdateAfterBindInlineUniformBlocks = default;

		public this() {}
		public this(uint32 maxInlineUniformBlockSize_,uint32 maxPerStageDescriptorInlineUniformBlocks_,uint32 maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks_,uint32 maxDescriptorSetInlineUniformBlocks_,uint32 maxDescriptorSetUpdateAfterBindInlineUniformBlocks_)
		{
			maxInlineUniformBlockSize = maxInlineUniformBlockSize_;
			maxPerStageDescriptorInlineUniformBlocks = maxPerStageDescriptorInlineUniformBlocks_;
			maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks = maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks_;
			maxDescriptorSetInlineUniformBlocks = maxDescriptorSetInlineUniformBlocks_;
			maxDescriptorSetUpdateAfterBindInlineUniformBlocks = maxDescriptorSetUpdateAfterBindInlineUniformBlocks_;
		}
	}

	[CRepr]
	public struct WriteDescriptorSetInlineUniformBlockEXT 
	{
		public readonly StructureType sType = .WriteDescriptorSetInlineUniformBlockEXT;
		public void* pNext = null;
		public uint32 dataSize = default;
		public void* pData = default;

		public this() {}
		public this(uint32 dataSize_,void* pData_)
		{
			dataSize = dataSize_;
			pData = pData_;
		}
	}

	[CRepr]
	public struct DescriptorPoolInlineUniformBlockCreateInfoEXT 
	{
		public readonly StructureType sType = .DescriptorPoolInlineUniformBlockCreateInfoEXT;
		public void* pNext = null;
		public uint32 maxInlineUniformBlockBindings = default;

		public this() {}
		public this(uint32 maxInlineUniformBlockBindings_)
		{
			maxInlineUniformBlockBindings = maxInlineUniformBlockBindings_;
		}
	}

	[CRepr]
	public struct SampleLocationEXT 
	{
		public float x = default;
		public float y = default;

		public this() {}
		public this(float x_,float y_)
		{
			x = x_;
			y = y_;
		}
	}

	[CRepr]
	public struct SampleLocationsInfoEXT 
	{
		public readonly StructureType sType = .SampleLocationsInfoEXT;
		public void* pNext = null;
		public SampleCountFlags sampleLocationsPerPixel = default;
		public Extent2D sampleLocationGridSize = default;
		public uint32 sampleLocationsCount = default;
		public SampleLocationEXT* pSampleLocations = default;

		public this() {}
		public this(SampleCountFlags sampleLocationsPerPixel_,Extent2D sampleLocationGridSize_,uint32 sampleLocationsCount_,SampleLocationEXT* pSampleLocations_)
		{
			sampleLocationsPerPixel = sampleLocationsPerPixel_;
			sampleLocationGridSize = sampleLocationGridSize_;
			sampleLocationsCount = sampleLocationsCount_;
			pSampleLocations = pSampleLocations_;
		}
	}

	[CRepr]
	public struct AttachmentSampleLocationsEXT 
	{
		public uint32 attachmentIndex = default;
		public SampleLocationsInfoEXT sampleLocationsInfo = default;

		public this() {}
		public this(uint32 attachmentIndex_,SampleLocationsInfoEXT sampleLocationsInfo_)
		{
			attachmentIndex = attachmentIndex_;
			sampleLocationsInfo = sampleLocationsInfo_;
		}
	}

	[CRepr]
	public struct SubpassSampleLocationsEXT 
	{
		public uint32 subpassIndex = default;
		public SampleLocationsInfoEXT sampleLocationsInfo = default;

		public this() {}
		public this(uint32 subpassIndex_,SampleLocationsInfoEXT sampleLocationsInfo_)
		{
			subpassIndex = subpassIndex_;
			sampleLocationsInfo = sampleLocationsInfo_;
		}
	}

	[CRepr]
	public struct RenderPassSampleLocationsBeginInfoEXT 
	{
		public readonly StructureType sType = .RenderPassSampleLocationsBeginInfoEXT;
		public void* pNext = null;
		public uint32 attachmentInitialSampleLocationsCount = default;
		public AttachmentSampleLocationsEXT* pAttachmentInitialSampleLocations = default;
		public uint32 postSubpassSampleLocationsCount = default;
		public SubpassSampleLocationsEXT* pPostSubpassSampleLocations = default;

		public this() {}
		public this(uint32 attachmentInitialSampleLocationsCount_,AttachmentSampleLocationsEXT* pAttachmentInitialSampleLocations_,uint32 postSubpassSampleLocationsCount_,SubpassSampleLocationsEXT* pPostSubpassSampleLocations_)
		{
			attachmentInitialSampleLocationsCount = attachmentInitialSampleLocationsCount_;
			pAttachmentInitialSampleLocations = pAttachmentInitialSampleLocations_;
			postSubpassSampleLocationsCount = postSubpassSampleLocationsCount_;
			pPostSubpassSampleLocations = pPostSubpassSampleLocations_;
		}
	}

	[CRepr]
	public struct PipelineSampleLocationsStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineSampleLocationsStateCreateInfoEXT;
		public void* pNext = null;
		public Bool32 sampleLocationsEnable = default;
		public SampleLocationsInfoEXT sampleLocationsInfo = default;

		public this() {}
		public this(Bool32 sampleLocationsEnable_,SampleLocationsInfoEXT sampleLocationsInfo_)
		{
			sampleLocationsEnable = sampleLocationsEnable_;
			sampleLocationsInfo = sampleLocationsInfo_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSampleLocationsPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceSampleLocationsPropertiesEXT;
		public void* pNext = null;
		public SampleCountFlags sampleLocationSampleCounts = default;
		public Extent2D maxSampleLocationGridSize = default;
		public float[2] sampleLocationCoordinateRange = default;
		public uint32 sampleLocationSubPixelBits = default;
		public Bool32 variableSampleLocations = default;

		public this() {}
		public this(SampleCountFlags sampleLocationSampleCounts_,Extent2D maxSampleLocationGridSize_,float[2] sampleLocationCoordinateRange_,uint32 sampleLocationSubPixelBits_,Bool32 variableSampleLocations_)
		{
			sampleLocationSampleCounts = sampleLocationSampleCounts_;
			maxSampleLocationGridSize = maxSampleLocationGridSize_;
			sampleLocationCoordinateRange = sampleLocationCoordinateRange_;
			sampleLocationSubPixelBits = sampleLocationSubPixelBits_;
			variableSampleLocations = variableSampleLocations_;
		}
	}

	[CRepr]
	public struct MultisamplePropertiesEXT 
	{
		public readonly StructureType sType = .MultisamplePropertiesEXT;
		public void* pNext = null;
		public Extent2D maxSampleLocationGridSize = default;

		public this() {}
		public this(Extent2D maxSampleLocationGridSize_)
		{
			maxSampleLocationGridSize = maxSampleLocationGridSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceBlendOperationAdvancedFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceBlendOperationAdvancedFeaturesEXT;
		public void* pNext = null;
		public Bool32 advancedBlendCoherentOperations = default;

		public this() {}
		public this(Bool32 advancedBlendCoherentOperations_)
		{
			advancedBlendCoherentOperations = advancedBlendCoherentOperations_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceBlendOperationAdvancedPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceBlendOperationAdvancedPropertiesEXT;
		public void* pNext = null;
		public uint32 advancedBlendMaxColorAttachments = default;
		public Bool32 advancedBlendIndependentBlend = default;
		public Bool32 advancedBlendNonPremultipliedSrcColor = default;
		public Bool32 advancedBlendNonPremultipliedDstColor = default;
		public Bool32 advancedBlendCorrelatedOverlap = default;
		public Bool32 advancedBlendAllOperations = default;

		public this() {}
		public this(uint32 advancedBlendMaxColorAttachments_,Bool32 advancedBlendIndependentBlend_,Bool32 advancedBlendNonPremultipliedSrcColor_,Bool32 advancedBlendNonPremultipliedDstColor_,Bool32 advancedBlendCorrelatedOverlap_,Bool32 advancedBlendAllOperations_)
		{
			advancedBlendMaxColorAttachments = advancedBlendMaxColorAttachments_;
			advancedBlendIndependentBlend = advancedBlendIndependentBlend_;
			advancedBlendNonPremultipliedSrcColor = advancedBlendNonPremultipliedSrcColor_;
			advancedBlendNonPremultipliedDstColor = advancedBlendNonPremultipliedDstColor_;
			advancedBlendCorrelatedOverlap = advancedBlendCorrelatedOverlap_;
			advancedBlendAllOperations = advancedBlendAllOperations_;
		}
	}

	[CRepr]
	public struct PipelineColorBlendAdvancedStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineColorBlendAdvancedStateCreateInfoEXT;
		public void* pNext = null;
		public Bool32 srcPremultiplied = default;
		public Bool32 dstPremultiplied = default;
		public BlendOverlapEXT blendOverlap = default;

		public this() {}
		public this(Bool32 srcPremultiplied_,Bool32 dstPremultiplied_,BlendOverlapEXT blendOverlap_)
		{
			srcPremultiplied = srcPremultiplied_;
			dstPremultiplied = dstPremultiplied_;
			blendOverlap = blendOverlap_;
		}
	}

	[CRepr]
	public struct PipelineCoverageToColorStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineCoverageToColorStateCreateInfoNV;
		public void* pNext = null;
		public PipelineCoverageToColorStateCreateFlagsNV flags = default;
		public Bool32 coverageToColorEnable = default;
		public uint32 coverageToColorLocation = default;

		public this() {}
		public this(PipelineCoverageToColorStateCreateFlagsNV flags_,Bool32 coverageToColorEnable_,uint32 coverageToColorLocation_)
		{
			flags = flags_;
			coverageToColorEnable = coverageToColorEnable_;
			coverageToColorLocation = coverageToColorLocation_;
		}
	}

	[CRepr]
	public struct PipelineCoverageModulationStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineCoverageModulationStateCreateInfoNV;
		public void* pNext = null;
		public PipelineCoverageModulationStateCreateFlagsNV flags = default;
		public CoverageModulationModeNV coverageModulationMode = default;
		public Bool32 coverageModulationTableEnable = default;
		public uint32 coverageModulationTableCount = default;
		public float* pCoverageModulationTable = default;

		public this() {}
		public this(PipelineCoverageModulationStateCreateFlagsNV flags_,CoverageModulationModeNV coverageModulationMode_,Bool32 coverageModulationTableEnable_,uint32 coverageModulationTableCount_,float* pCoverageModulationTable_)
		{
			flags = flags_;
			coverageModulationMode = coverageModulationMode_;
			coverageModulationTableEnable = coverageModulationTableEnable_;
			coverageModulationTableCount = coverageModulationTableCount_;
			pCoverageModulationTable = pCoverageModulationTable_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderSMBuiltinsPropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderSmBuiltinsPropertiesNV;
		public void* pNext = null;
		public uint32 shaderSMCount = default;
		public uint32 shaderWarpsPerSM = default;

		public this() {}
		public this(uint32 shaderSMCount_,uint32 shaderWarpsPerSM_)
		{
			shaderSMCount = shaderSMCount_;
			shaderWarpsPerSM = shaderWarpsPerSM_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderSMBuiltinsFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderSmBuiltinsFeaturesNV;
		public void* pNext = null;
		public Bool32 shaderSMBuiltins = default;

		public this() {}
		public this(Bool32 shaderSMBuiltins_)
		{
			shaderSMBuiltins = shaderSMBuiltins_;
		}
	}

	[CRepr]
	public struct DrmFormatModifierPropertiesEXT 
	{
		public uint64 drmFormatModifier = default;
		public uint32 drmFormatModifierPlaneCount = default;
		public FormatFeatureFlags drmFormatModifierTilingFeatures = default;

		public this() {}
		public this(uint64 drmFormatModifier_,uint32 drmFormatModifierPlaneCount_,FormatFeatureFlags drmFormatModifierTilingFeatures_)
		{
			drmFormatModifier = drmFormatModifier_;
			drmFormatModifierPlaneCount = drmFormatModifierPlaneCount_;
			drmFormatModifierTilingFeatures = drmFormatModifierTilingFeatures_;
		}
	}

	[CRepr]
	public struct DrmFormatModifierPropertiesListEXT 
	{
		public readonly StructureType sType = .DrmFormatModifierPropertiesListEXT;
		public void* pNext = null;
		public uint32 drmFormatModifierCount = default;
		public DrmFormatModifierPropertiesEXT* pDrmFormatModifierProperties = default;

		public this() {}
		public this(uint32 drmFormatModifierCount_,DrmFormatModifierPropertiesEXT* pDrmFormatModifierProperties_)
		{
			drmFormatModifierCount = drmFormatModifierCount_;
			pDrmFormatModifierProperties = pDrmFormatModifierProperties_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceImageDrmFormatModifierInfoEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceImageDrmFormatModifierInfoEXT;
		public void* pNext = null;
		public uint64 drmFormatModifier = default;
		public SharingMode sharingMode = default;
		public uint32 queueFamilyIndexCount = default;
		public uint32* pQueueFamilyIndices = default;

		public this() {}
		public this(uint64 drmFormatModifier_,SharingMode sharingMode_,uint32 queueFamilyIndexCount_,uint32* pQueueFamilyIndices_)
		{
			drmFormatModifier = drmFormatModifier_;
			sharingMode = sharingMode_;
			queueFamilyIndexCount = queueFamilyIndexCount_;
			pQueueFamilyIndices = pQueueFamilyIndices_;
		}
	}

	[CRepr]
	public struct ImageDrmFormatModifierListCreateInfoEXT 
	{
		public readonly StructureType sType = .ImageDrmFormatModifierListCreateInfoEXT;
		public void* pNext = null;
		public uint32 drmFormatModifierCount = default;
		public uint64* pDrmFormatModifiers = default;

		public this() {}
		public this(uint32 drmFormatModifierCount_,uint64* pDrmFormatModifiers_)
		{
			drmFormatModifierCount = drmFormatModifierCount_;
			pDrmFormatModifiers = pDrmFormatModifiers_;
		}
	}

	[CRepr]
	public struct ImageDrmFormatModifierExplicitCreateInfoEXT 
	{
		public readonly StructureType sType = .ImageDrmFormatModifierExplicitCreateInfoEXT;
		public void* pNext = null;
		public uint64 drmFormatModifier = default;
		public uint32 drmFormatModifierPlaneCount = default;
		public SubresourceLayout* pPlaneLayouts = default;

		public this() {}
		public this(uint64 drmFormatModifier_,uint32 drmFormatModifierPlaneCount_,SubresourceLayout* pPlaneLayouts_)
		{
			drmFormatModifier = drmFormatModifier_;
			drmFormatModifierPlaneCount = drmFormatModifierPlaneCount_;
			pPlaneLayouts = pPlaneLayouts_;
		}
	}

	[CRepr]
	public struct ImageDrmFormatModifierPropertiesEXT 
	{
		public readonly StructureType sType = .ImageDrmFormatModifierPropertiesEXT;
		public void* pNext = null;
		public uint64 drmFormatModifier = default;

		public this() {}
		public this(uint64 drmFormatModifier_)
		{
			drmFormatModifier = drmFormatModifier_;
		}
	}

	[CRepr]
	public struct ValidationCacheCreateInfoEXT 
	{
		public readonly StructureType sType = .ValidationCacheCreateInfoEXT;
		public void* pNext = null;
		public ValidationCacheCreateFlagsEXT flags = default;
		public uint initialDataSize = default;
		public void* pInitialData = default;

		public this() {}
		public this(ValidationCacheCreateFlagsEXT flags_,uint initialDataSize_,void* pInitialData_)
		{
			flags = flags_;
			initialDataSize = initialDataSize_;
			pInitialData = pInitialData_;
		}
	}

	[CRepr]
	public struct ShaderModuleValidationCacheCreateInfoEXT 
	{
		public readonly StructureType sType = .ShaderModuleValidationCacheCreateInfoEXT;
		public void* pNext = null;
		public ValidationCacheEXT validationCache = default;

		public this() {}
		public this(ValidationCacheEXT validationCache_)
		{
			validationCache = validationCache_;
		}
	}

	[CRepr]
	public struct ShadingRatePaletteNV 
	{
		public uint32 shadingRatePaletteEntryCount = default;
		public ShadingRatePaletteEntryNV* pShadingRatePaletteEntries = default;

		public this() {}
		public this(uint32 shadingRatePaletteEntryCount_,ShadingRatePaletteEntryNV* pShadingRatePaletteEntries_)
		{
			shadingRatePaletteEntryCount = shadingRatePaletteEntryCount_;
			pShadingRatePaletteEntries = pShadingRatePaletteEntries_;
		}
	}

	[CRepr]
	public struct PipelineViewportShadingRateImageStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineViewportShadingRateImageStateCreateInfoNV;
		public void* pNext = null;
		public Bool32 shadingRateImageEnable = default;
		public uint32 viewportCount = default;
		public ShadingRatePaletteNV* pShadingRatePalettes = default;

		public this() {}
		public this(Bool32 shadingRateImageEnable_,uint32 viewportCount_,ShadingRatePaletteNV* pShadingRatePalettes_)
		{
			shadingRateImageEnable = shadingRateImageEnable_;
			viewportCount = viewportCount_;
			pShadingRatePalettes = pShadingRatePalettes_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShadingRateImageFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceShadingRateImageFeaturesNV;
		public void* pNext = null;
		public Bool32 shadingRateImage = default;
		public Bool32 shadingRateCoarseSampleOrder = default;

		public this() {}
		public this(Bool32 shadingRateImage_,Bool32 shadingRateCoarseSampleOrder_)
		{
			shadingRateImage = shadingRateImage_;
			shadingRateCoarseSampleOrder = shadingRateCoarseSampleOrder_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShadingRateImagePropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceShadingRateImagePropertiesNV;
		public void* pNext = null;
		public Extent2D shadingRateTexelSize = default;
		public uint32 shadingRatePaletteSize = default;
		public uint32 shadingRateMaxCoarseSamples = default;

		public this() {}
		public this(Extent2D shadingRateTexelSize_,uint32 shadingRatePaletteSize_,uint32 shadingRateMaxCoarseSamples_)
		{
			shadingRateTexelSize = shadingRateTexelSize_;
			shadingRatePaletteSize = shadingRatePaletteSize_;
			shadingRateMaxCoarseSamples = shadingRateMaxCoarseSamples_;
		}
	}

	[CRepr]
	public struct CoarseSampleLocationNV 
	{
		public uint32 pixelX = default;
		public uint32 pixelY = default;
		public uint32 sample = default;

		public this() {}
		public this(uint32 pixelX_,uint32 pixelY_,uint32 sample_)
		{
			pixelX = pixelX_;
			pixelY = pixelY_;
			sample = sample_;
		}
	}

	[CRepr]
	public struct CoarseSampleOrderCustomNV 
	{
		public ShadingRatePaletteEntryNV shadingRate = default;
		public uint32 sampleCount = default;
		public uint32 sampleLocationCount = default;
		public CoarseSampleLocationNV* pSampleLocations = default;

		public this() {}
		public this(ShadingRatePaletteEntryNV shadingRate_,uint32 sampleCount_,uint32 sampleLocationCount_,CoarseSampleLocationNV* pSampleLocations_)
		{
			shadingRate = shadingRate_;
			sampleCount = sampleCount_;
			sampleLocationCount = sampleLocationCount_;
			pSampleLocations = pSampleLocations_;
		}
	}

	[CRepr]
	public struct PipelineViewportCoarseSampleOrderStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineViewportCoarseSampleOrderStateCreateInfoNV;
		public void* pNext = null;
		public CoarseSampleOrderTypeNV sampleOrderType = default;
		public uint32 customSampleOrderCount = default;
		public CoarseSampleOrderCustomNV* pCustomSampleOrders = default;

		public this() {}
		public this(CoarseSampleOrderTypeNV sampleOrderType_,uint32 customSampleOrderCount_,CoarseSampleOrderCustomNV* pCustomSampleOrders_)
		{
			sampleOrderType = sampleOrderType_;
			customSampleOrderCount = customSampleOrderCount_;
			pCustomSampleOrders = pCustomSampleOrders_;
		}
	}

	[CRepr]
	public struct RayTracingShaderGroupCreateInfoNV 
	{
		public readonly StructureType sType = .RayTracingShaderGroupCreateInfoNV;
		public void* pNext = null;
		public RayTracingShaderGroupTypeKHR type = default;
		public uint32 generalShader = default;
		public uint32 closestHitShader = default;
		public uint32 anyHitShader = default;
		public uint32 intersectionShader = default;

		public this() {}
		public this(RayTracingShaderGroupTypeKHR type_,uint32 generalShader_,uint32 closestHitShader_,uint32 anyHitShader_,uint32 intersectionShader_)
		{
			type = type_;
			generalShader = generalShader_;
			closestHitShader = closestHitShader_;
			anyHitShader = anyHitShader_;
			intersectionShader = intersectionShader_;
		}
	}

	[CRepr]
	public struct RayTracingPipelineCreateInfoNV 
	{
		public readonly StructureType sType = .RayTracingPipelineCreateInfoNV;
		public void* pNext = null;
		public PipelineCreateFlags flags = default;
		public uint32 stageCount = default;
		public PipelineShaderStageCreateInfo* pStages = default;
		public uint32 groupCount = default;
		public RayTracingShaderGroupCreateInfoNV* pGroups = default;
		public uint32 maxRecursionDepth = default;
		public PipelineLayout layout = default;
		public Pipeline basePipelineHandle = default;
		public int32 basePipelineIndex = default;

		public this() {}
		public this(PipelineCreateFlags flags_,uint32 stageCount_,PipelineShaderStageCreateInfo* pStages_,uint32 groupCount_,RayTracingShaderGroupCreateInfoNV* pGroups_,uint32 maxRecursionDepth_,PipelineLayout layout_,Pipeline basePipelineHandle_,int32 basePipelineIndex_)
		{
			flags = flags_;
			stageCount = stageCount_;
			pStages = pStages_;
			groupCount = groupCount_;
			pGroups = pGroups_;
			maxRecursionDepth = maxRecursionDepth_;
			layout = layout_;
			basePipelineHandle = basePipelineHandle_;
			basePipelineIndex = basePipelineIndex_;
		}
	}

	[CRepr]
	public struct GeometryTrianglesNV 
	{
		public readonly StructureType sType = .GeometryTrianglesNV;
		public void* pNext = null;
		public Buffer vertexData = default;
		public DeviceSize vertexOffset = default;
		public uint32 vertexCount = default;
		public DeviceSize vertexStride = default;
		public Format vertexFormat = default;
		public Buffer indexData = default;
		public DeviceSize indexOffset = default;
		public uint32 indexCount = default;
		public IndexType indexType = default;
		public Buffer transformData = default;
		public DeviceSize transformOffset = default;

		public this() {}
		public this(Buffer vertexData_,DeviceSize vertexOffset_,uint32 vertexCount_,DeviceSize vertexStride_,Format vertexFormat_,Buffer indexData_,DeviceSize indexOffset_,uint32 indexCount_,IndexType indexType_,Buffer transformData_,DeviceSize transformOffset_)
		{
			vertexData = vertexData_;
			vertexOffset = vertexOffset_;
			vertexCount = vertexCount_;
			vertexStride = vertexStride_;
			vertexFormat = vertexFormat_;
			indexData = indexData_;
			indexOffset = indexOffset_;
			indexCount = indexCount_;
			indexType = indexType_;
			transformData = transformData_;
			transformOffset = transformOffset_;
		}
	}

	[CRepr]
	public struct GeometryAABBNV 
	{
		public readonly StructureType sType = .GeometryAabbNV;
		public void* pNext = null;
		public Buffer aabbData = default;
		public uint32 numAABBs = default;
		public uint32 stride = default;
		public DeviceSize offset = default;

		public this() {}
		public this(Buffer aabbData_,uint32 numAABBs_,uint32 stride_,DeviceSize offset_)
		{
			aabbData = aabbData_;
			numAABBs = numAABBs_;
			stride = stride_;
			offset = offset_;
		}
	}

	[CRepr]
	public struct GeometryDataNV 
	{
		public GeometryTrianglesNV triangles = default;
		public GeometryAABBNV aabbs = default;

		public this() {}
		public this(GeometryTrianglesNV triangles_,GeometryAABBNV aabbs_)
		{
			triangles = triangles_;
			aabbs = aabbs_;
		}
	}

	[CRepr]
	public struct GeometryNV 
	{
		public readonly StructureType sType = .GeometryNV;
		public void* pNext = null;
		public GeometryTypeKHR geometryType = default;
		public GeometryDataNV geometry = default;
		public GeometryFlagsKHR flags = default;

		public this() {}
		public this(GeometryTypeKHR geometryType_,GeometryDataNV geometry_,GeometryFlagsKHR flags_)
		{
			geometryType = geometryType_;
			geometry = geometry_;
			flags = flags_;
		}
	}

	[CRepr]
	public struct AccelerationStructureInfoNV 
	{
		public readonly StructureType sType = .AccelerationStructureInfoNV;
		public void* pNext = null;
		public AccelerationStructureTypeNV type = default;
		public BuildAccelerationStructureFlagsNV flags = default;
		public uint32 instanceCount = default;
		public uint32 geometryCount = default;
		public GeometryNV* pGeometries = default;

		public this() {}
		public this(AccelerationStructureTypeNV type_,BuildAccelerationStructureFlagsNV flags_,uint32 instanceCount_,uint32 geometryCount_,GeometryNV* pGeometries_)
		{
			type = type_;
			flags = flags_;
			instanceCount = instanceCount_;
			geometryCount = geometryCount_;
			pGeometries = pGeometries_;
		}
	}

	[CRepr]
	public struct AccelerationStructureCreateInfoNV 
	{
		public readonly StructureType sType = .AccelerationStructureCreateInfoNV;
		public void* pNext = null;
		public DeviceSize compactedSize = default;
		public AccelerationStructureInfoNV info = default;

		public this() {}
		public this(DeviceSize compactedSize_,AccelerationStructureInfoNV info_)
		{
			compactedSize = compactedSize_;
			info = info_;
		}
	}

	[CRepr]
	public struct BindAccelerationStructureMemoryInfoKHR 
	{
		public readonly StructureType sType = .BindAccelerationStructureMemoryInfoKHR;
		public void* pNext = null;
		public AccelerationStructureKHR accelerationStructure = default;
		public DeviceMemory memory = default;
		public DeviceSize memoryOffset = default;
		public uint32 deviceIndexCount = default;
		public uint32* pDeviceIndices = default;

		public this() {}
		public this(AccelerationStructureKHR accelerationStructure_,DeviceMemory memory_,DeviceSize memoryOffset_,uint32 deviceIndexCount_,uint32* pDeviceIndices_)
		{
			accelerationStructure = accelerationStructure_;
			memory = memory_;
			memoryOffset = memoryOffset_;
			deviceIndexCount = deviceIndexCount_;
			pDeviceIndices = pDeviceIndices_;
		}
	}

	[CRepr]
	public struct WriteDescriptorSetAccelerationStructureKHR 
	{
		public readonly StructureType sType = .WriteDescriptorSetAccelerationStructureKHR;
		public void* pNext = null;
		public uint32 accelerationStructureCount = default;
		public AccelerationStructureKHR* pAccelerationStructures = default;

		public this() {}
		public this(uint32 accelerationStructureCount_,AccelerationStructureKHR* pAccelerationStructures_)
		{
			accelerationStructureCount = accelerationStructureCount_;
			pAccelerationStructures = pAccelerationStructures_;
		}
	}

	[CRepr]
	public struct AccelerationStructureMemoryRequirementsInfoNV 
	{
		public readonly StructureType sType = .AccelerationStructureMemoryRequirementsInfoNV;
		public void* pNext = null;
		public AccelerationStructureMemoryRequirementsTypeNV type = default;
		public AccelerationStructureNV accelerationStructure = default;

		public this() {}
		public this(AccelerationStructureMemoryRequirementsTypeNV type_,AccelerationStructureNV accelerationStructure_)
		{
			type = type_;
			accelerationStructure = accelerationStructure_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceRayTracingPropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceRayTracingPropertiesNV;
		public void* pNext = null;
		public uint32 shaderGroupHandleSize = default;
		public uint32 maxRecursionDepth = default;
		public uint32 maxShaderGroupStride = default;
		public uint32 shaderGroupBaseAlignment = default;
		public uint64 maxGeometryCount = default;
		public uint64 maxInstanceCount = default;
		public uint64 maxTriangleCount = default;
		public uint32 maxDescriptorSetAccelerationStructures = default;

		public this() {}
		public this(uint32 shaderGroupHandleSize_,uint32 maxRecursionDepth_,uint32 maxShaderGroupStride_,uint32 shaderGroupBaseAlignment_,uint64 maxGeometryCount_,uint64 maxInstanceCount_,uint64 maxTriangleCount_,uint32 maxDescriptorSetAccelerationStructures_)
		{
			shaderGroupHandleSize = shaderGroupHandleSize_;
			maxRecursionDepth = maxRecursionDepth_;
			maxShaderGroupStride = maxShaderGroupStride_;
			shaderGroupBaseAlignment = shaderGroupBaseAlignment_;
			maxGeometryCount = maxGeometryCount_;
			maxInstanceCount = maxInstanceCount_;
			maxTriangleCount = maxTriangleCount_;
			maxDescriptorSetAccelerationStructures = maxDescriptorSetAccelerationStructures_;
		}
	}

	[CRepr]
	public struct TransformMatrixKHR 
	{
		public float[3][4] matrix = default;

		public this() {}
		public this(float[3][4] matrix_)
		{
			matrix = matrix_;
		}
	}

	[CRepr]
	public struct AabbPositionsKHR 
	{
		public float minX = default;
		public float minY = default;
		public float minZ = default;
		public float maxX = default;
		public float maxY = default;
		public float maxZ = default;

		public this() {}
		public this(float minX_,float minY_,float minZ_,float maxX_,float maxY_,float maxZ_)
		{
			minX = minX_;
			minY = minY_;
			minZ = minZ_;
			maxX = maxX_;
			maxY = maxY_;
			maxZ = maxZ_;
		}
	}

	[CRepr][Obsolete("Couldn't generate Beef representation for this type.", false)]
public struct AccelerationStructureInstanceKHR { /*
    VkTransformMatrixKHR          transform;
    uint32                      instanceCustomIndex:24;
    uint32                      mask:8;
    uint32                      instanceShaderBindingTableRecordOffset:24;
    VkGeometryInstanceFlagsKHR    flags:8;
    uint64                      accelerationStructureReference;
*/ }

	[CRepr]
	public struct PhysicalDeviceRepresentativeFragmentTestFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceRepresentativeFragmentTestFeaturesNV;
		public void* pNext = null;
		public Bool32 representativeFragmentTest = default;

		public this() {}
		public this(Bool32 representativeFragmentTest_)
		{
			representativeFragmentTest = representativeFragmentTest_;
		}
	}

	[CRepr]
	public struct PipelineRepresentativeFragmentTestStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineRepresentativeFragmentTestStateCreateInfoNV;
		public void* pNext = null;
		public Bool32 representativeFragmentTestEnable = default;

		public this() {}
		public this(Bool32 representativeFragmentTestEnable_)
		{
			representativeFragmentTestEnable = representativeFragmentTestEnable_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceImageViewImageFormatInfoEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceImageViewImageFormatInfoEXT;
		public void* pNext = null;
		public ImageViewType imageViewType = default;

		public this() {}
		public this(ImageViewType imageViewType_)
		{
			imageViewType = imageViewType_;
		}
	}

	[CRepr]
	public struct FilterCubicImageViewImageFormatPropertiesEXT 
	{
		public readonly StructureType sType = .FilterCubicImageViewImageFormatPropertiesEXT;
		public void* pNext = null;
		public Bool32 filterCubic = default;
		public Bool32 filterCubicMinmax = default;

		public this() {}
		public this(Bool32 filterCubic_,Bool32 filterCubicMinmax_)
		{
			filterCubic = filterCubic_;
			filterCubicMinmax = filterCubicMinmax_;
		}
	}

	[CRepr]
	public struct DeviceQueueGlobalPriorityCreateInfoEXT 
	{
		public readonly StructureType sType = .DeviceQueueGlobalPriorityCreateInfoEXT;
		public void* pNext = null;
		public QueueGlobalPriorityEXT globalPriority = default;

		public this() {}
		public this(QueueGlobalPriorityEXT globalPriority_)
		{
			globalPriority = globalPriority_;
		}
	}

	[CRepr]
	public struct ImportMemoryHostPointerInfoEXT 
	{
		public readonly StructureType sType = .ImportMemoryHostPointerInfoEXT;
		public void* pNext = null;
		public ExternalMemoryHandleTypeFlags handleType = default;
		public void* pHostPointer = default;

		public this() {}
		public this(ExternalMemoryHandleTypeFlags handleType_,void* pHostPointer_)
		{
			handleType = handleType_;
			pHostPointer = pHostPointer_;
		}
	}

	[CRepr]
	public struct MemoryHostPointerPropertiesEXT 
	{
		public readonly StructureType sType = .MemoryHostPointerPropertiesEXT;
		public void* pNext = null;
		public uint32 memoryTypeBits = default;

		public this() {}
		public this(uint32 memoryTypeBits_)
		{
			memoryTypeBits = memoryTypeBits_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExternalMemoryHostPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceExternalMemoryHostPropertiesEXT;
		public void* pNext = null;
		public DeviceSize minImportedHostPointerAlignment = default;

		public this() {}
		public this(DeviceSize minImportedHostPointerAlignment_)
		{
			minImportedHostPointerAlignment = minImportedHostPointerAlignment_;
		}
	}

	[CRepr]
	public struct PipelineCompilerControlCreateInfoAMD 
	{
		public readonly StructureType sType = .PipelineCompilerControlCreateInfoAMD;
		public void* pNext = null;
		public PipelineCompilerControlFlagsAMD compilerControlFlags = default;

		public this() {}
		public this(PipelineCompilerControlFlagsAMD compilerControlFlags_)
		{
			compilerControlFlags = compilerControlFlags_;
		}
	}

	[CRepr]
	public struct CalibratedTimestampInfoEXT 
	{
		public readonly StructureType sType = .CalibratedTimestampInfoEXT;
		public void* pNext = null;
		public TimeDomainEXT timeDomain = default;

		public this() {}
		public this(TimeDomainEXT timeDomain_)
		{
			timeDomain = timeDomain_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderCorePropertiesAMD 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderCorePropertiesAMD;
		public void* pNext = null;
		public uint32 shaderEngineCount = default;
		public uint32 shaderArraysPerEngineCount = default;
		public uint32 computeUnitsPerShaderArray = default;
		public uint32 simdPerComputeUnit = default;
		public uint32 wavefrontsPerSimd = default;
		public uint32 wavefrontSize = default;
		public uint32 sgprsPerSimd = default;
		public uint32 minSgprAllocation = default;
		public uint32 maxSgprAllocation = default;
		public uint32 sgprAllocationGranularity = default;
		public uint32 vgprsPerSimd = default;
		public uint32 minVgprAllocation = default;
		public uint32 maxVgprAllocation = default;
		public uint32 vgprAllocationGranularity = default;

		public this() {}
		public this(uint32 shaderEngineCount_,uint32 shaderArraysPerEngineCount_,uint32 computeUnitsPerShaderArray_,uint32 simdPerComputeUnit_,uint32 wavefrontsPerSimd_,uint32 wavefrontSize_,uint32 sgprsPerSimd_,uint32 minSgprAllocation_,uint32 maxSgprAllocation_,uint32 sgprAllocationGranularity_,uint32 vgprsPerSimd_,uint32 minVgprAllocation_,uint32 maxVgprAllocation_,uint32 vgprAllocationGranularity_)
		{
			shaderEngineCount = shaderEngineCount_;
			shaderArraysPerEngineCount = shaderArraysPerEngineCount_;
			computeUnitsPerShaderArray = computeUnitsPerShaderArray_;
			simdPerComputeUnit = simdPerComputeUnit_;
			wavefrontsPerSimd = wavefrontsPerSimd_;
			wavefrontSize = wavefrontSize_;
			sgprsPerSimd = sgprsPerSimd_;
			minSgprAllocation = minSgprAllocation_;
			maxSgprAllocation = maxSgprAllocation_;
			sgprAllocationGranularity = sgprAllocationGranularity_;
			vgprsPerSimd = vgprsPerSimd_;
			minVgprAllocation = minVgprAllocation_;
			maxVgprAllocation = maxVgprAllocation_;
			vgprAllocationGranularity = vgprAllocationGranularity_;
		}
	}

	[CRepr]
	public struct DeviceMemoryOverallocationCreateInfoAMD 
	{
		public readonly StructureType sType = .DeviceMemoryOverallocationCreateInfoAMD;
		public void* pNext = null;
		public MemoryOverallocationBehaviorAMD overallocationBehavior = default;

		public this() {}
		public this(MemoryOverallocationBehaviorAMD overallocationBehavior_)
		{
			overallocationBehavior = overallocationBehavior_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVertexAttributeDivisorPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceVertexAttributeDivisorPropertiesEXT;
		public void* pNext = null;
		public uint32 maxVertexAttribDivisor = default;

		public this() {}
		public this(uint32 maxVertexAttribDivisor_)
		{
			maxVertexAttribDivisor = maxVertexAttribDivisor_;
		}
	}

	[CRepr]
	public struct VertexInputBindingDivisorDescriptionEXT 
	{
		public uint32 binding = default;
		public uint32 divisor = default;

		public this() {}
		public this(uint32 binding_,uint32 divisor_)
		{
			binding = binding_;
			divisor = divisor_;
		}
	}

	[CRepr]
	public struct PipelineVertexInputDivisorStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineVertexInputDivisorStateCreateInfoEXT;
		public void* pNext = null;
		public uint32 vertexBindingDivisorCount = default;
		public VertexInputBindingDivisorDescriptionEXT* pVertexBindingDivisors = default;

		public this() {}
		public this(uint32 vertexBindingDivisorCount_,VertexInputBindingDivisorDescriptionEXT* pVertexBindingDivisors_)
		{
			vertexBindingDivisorCount = vertexBindingDivisorCount_;
			pVertexBindingDivisors = pVertexBindingDivisors_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceVertexAttributeDivisorFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceVertexAttributeDivisorFeaturesEXT;
		public void* pNext = null;
		public Bool32 vertexAttributeInstanceRateDivisor = default;
		public Bool32 vertexAttributeInstanceRateZeroDivisor = default;

		public this() {}
		public this(Bool32 vertexAttributeInstanceRateDivisor_,Bool32 vertexAttributeInstanceRateZeroDivisor_)
		{
			vertexAttributeInstanceRateDivisor = vertexAttributeInstanceRateDivisor_;
			vertexAttributeInstanceRateZeroDivisor = vertexAttributeInstanceRateZeroDivisor_;
		}
	}

	[CRepr]
	public struct PipelineCreationFeedbackEXT 
	{
		public PipelineCreationFeedbackFlagsEXT flags = default;
		public uint64 duration = default;

		public this() {}
		public this(PipelineCreationFeedbackFlagsEXT flags_,uint64 duration_)
		{
			flags = flags_;
			duration = duration_;
		}
	}

	[CRepr]
	public struct PipelineCreationFeedbackCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineCreationFeedbackCreateInfoEXT;
		public void* pNext = null;
		public PipelineCreationFeedbackEXT* pPipelineCreationFeedback = default;
		public uint32 pipelineStageCreationFeedbackCount = default;
		public PipelineCreationFeedbackEXT* pPipelineStageCreationFeedbacks = default;

		public this() {}
		public this(PipelineCreationFeedbackEXT* pPipelineCreationFeedback_,uint32 pipelineStageCreationFeedbackCount_,PipelineCreationFeedbackEXT* pPipelineStageCreationFeedbacks_)
		{
			pPipelineCreationFeedback = pPipelineCreationFeedback_;
			pipelineStageCreationFeedbackCount = pipelineStageCreationFeedbackCount_;
			pPipelineStageCreationFeedbacks = pPipelineStageCreationFeedbacks_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceComputeShaderDerivativesFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceComputeShaderDerivativesFeaturesNV;
		public void* pNext = null;
		public Bool32 computeDerivativeGroupQuads = default;
		public Bool32 computeDerivativeGroupLinear = default;

		public this() {}
		public this(Bool32 computeDerivativeGroupQuads_,Bool32 computeDerivativeGroupLinear_)
		{
			computeDerivativeGroupQuads = computeDerivativeGroupQuads_;
			computeDerivativeGroupLinear = computeDerivativeGroupLinear_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMeshShaderFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceMeshShaderFeaturesNV;
		public void* pNext = null;
		public Bool32 taskShader = default;
		public Bool32 meshShader = default;

		public this() {}
		public this(Bool32 taskShader_,Bool32 meshShader_)
		{
			taskShader = taskShader_;
			meshShader = meshShader_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMeshShaderPropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceMeshShaderPropertiesNV;
		public void* pNext = null;
		public uint32 maxDrawMeshTasksCount = default;
		public uint32 maxTaskWorkGroupInvocations = default;
		public uint32[3] maxTaskWorkGroupSize = default;
		public uint32 maxTaskTotalMemorySize = default;
		public uint32 maxTaskOutputCount = default;
		public uint32 maxMeshWorkGroupInvocations = default;
		public uint32[3] maxMeshWorkGroupSize = default;
		public uint32 maxMeshTotalMemorySize = default;
		public uint32 maxMeshOutputVertices = default;
		public uint32 maxMeshOutputPrimitives = default;
		public uint32 maxMeshMultiviewViewCount = default;
		public uint32 meshOutputPerVertexGranularity = default;
		public uint32 meshOutputPerPrimitiveGranularity = default;

		public this() {}
		public this(uint32 maxDrawMeshTasksCount_,uint32 maxTaskWorkGroupInvocations_,uint32[3] maxTaskWorkGroupSize_,uint32 maxTaskTotalMemorySize_,uint32 maxTaskOutputCount_,uint32 maxMeshWorkGroupInvocations_,uint32[3] maxMeshWorkGroupSize_,uint32 maxMeshTotalMemorySize_,uint32 maxMeshOutputVertices_,uint32 maxMeshOutputPrimitives_,uint32 maxMeshMultiviewViewCount_,uint32 meshOutputPerVertexGranularity_,uint32 meshOutputPerPrimitiveGranularity_)
		{
			maxDrawMeshTasksCount = maxDrawMeshTasksCount_;
			maxTaskWorkGroupInvocations = maxTaskWorkGroupInvocations_;
			maxTaskWorkGroupSize = maxTaskWorkGroupSize_;
			maxTaskTotalMemorySize = maxTaskTotalMemorySize_;
			maxTaskOutputCount = maxTaskOutputCount_;
			maxMeshWorkGroupInvocations = maxMeshWorkGroupInvocations_;
			maxMeshWorkGroupSize = maxMeshWorkGroupSize_;
			maxMeshTotalMemorySize = maxMeshTotalMemorySize_;
			maxMeshOutputVertices = maxMeshOutputVertices_;
			maxMeshOutputPrimitives = maxMeshOutputPrimitives_;
			maxMeshMultiviewViewCount = maxMeshMultiviewViewCount_;
			meshOutputPerVertexGranularity = meshOutputPerVertexGranularity_;
			meshOutputPerPrimitiveGranularity = meshOutputPerPrimitiveGranularity_;
		}
	}

	[CRepr]
	public struct DrawMeshTasksIndirectCommandNV 
	{
		public uint32 taskCount = default;
		public uint32 firstTask = default;

		public this() {}
		public this(uint32 taskCount_,uint32 firstTask_)
		{
			taskCount = taskCount_;
			firstTask = firstTask_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFragmentShaderBarycentricFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceFragmentShaderBarycentricFeaturesNV;
		public void* pNext = null;
		public Bool32 fragmentShaderBarycentric = default;

		public this() {}
		public this(Bool32 fragmentShaderBarycentric_)
		{
			fragmentShaderBarycentric = fragmentShaderBarycentric_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderImageFootprintFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderImageFootprintFeaturesNV;
		public void* pNext = null;
		public Bool32 imageFootprint = default;

		public this() {}
		public this(Bool32 imageFootprint_)
		{
			imageFootprint = imageFootprint_;
		}
	}

	[CRepr]
	public struct PipelineViewportExclusiveScissorStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineViewportExclusiveScissorStateCreateInfoNV;
		public void* pNext = null;
		public uint32 exclusiveScissorCount = default;
		public Rect2D* pExclusiveScissors = default;

		public this() {}
		public this(uint32 exclusiveScissorCount_,Rect2D* pExclusiveScissors_)
		{
			exclusiveScissorCount = exclusiveScissorCount_;
			pExclusiveScissors = pExclusiveScissors_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceExclusiveScissorFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceExclusiveScissorFeaturesNV;
		public void* pNext = null;
		public Bool32 exclusiveScissor = default;

		public this() {}
		public this(Bool32 exclusiveScissor_)
		{
			exclusiveScissor = exclusiveScissor_;
		}
	}

	[CRepr]
	public struct QueueFamilyCheckpointPropertiesNV 
	{
		public readonly StructureType sType = .QueueFamilyCheckpointPropertiesNV;
		public void* pNext = null;
		public PipelineStageFlags checkpointExecutionStageMask = default;

		public this() {}
		public this(PipelineStageFlags checkpointExecutionStageMask_)
		{
			checkpointExecutionStageMask = checkpointExecutionStageMask_;
		}
	}

	[CRepr]
	public struct CheckpointDataNV 
	{
		public readonly StructureType sType = .CheckpointDataNV;
		public void* pNext = null;
		public PipelineStageFlags stage = default;
		public void* pCheckpointMarker = default;

		public this() {}
		public this(PipelineStageFlags stage_,void* pCheckpointMarker_)
		{
			stage = stage_;
			pCheckpointMarker = pCheckpointMarker_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL;
		public void* pNext = null;
		public Bool32 shaderIntegerFunctions2 = default;

		public this() {}
		public this(Bool32 shaderIntegerFunctions2_)
		{
			shaderIntegerFunctions2 = shaderIntegerFunctions2_;
		}
	}

	[CRepr]
	public struct PerformanceValueINTEL 
	{
		public PerformanceValueTypeINTEL type = default;
		public PerformanceValueDataINTEL data = default;

		public this() {}
		public this(PerformanceValueTypeINTEL type_,PerformanceValueDataINTEL data_)
		{
			type = type_;
			data = data_;
		}
	}

	[CRepr]
	public struct InitializePerformanceApiInfoINTEL 
	{
		public readonly StructureType sType = .InitializePerformanceApiInfoINTEL;
		public void* pNext = null;
		public void* pUserData = default;

		public this() {}
		public this(void* pUserData_)
		{
			pUserData = pUserData_;
		}
	}

	[CRepr]
	public struct QueryPoolPerformanceQueryCreateInfoINTEL 
	{
		public StructureType sType = default;
		public void* pNext = null;
		public QueryPoolSamplingModeINTEL performanceCountersSampling = default;

		public this() {}
		public this(StructureType sType_,QueryPoolSamplingModeINTEL performanceCountersSampling_)
		{
			sType = sType_;
			performanceCountersSampling = performanceCountersSampling_;
		}
	}

	[CRepr]
	public struct PerformanceMarkerInfoINTEL 
	{
		public readonly StructureType sType = .PerformanceMarkerInfoINTEL;
		public void* pNext = null;
		public uint64 marker = default;

		public this() {}
		public this(uint64 marker_)
		{
			marker = marker_;
		}
	}

	[CRepr]
	public struct PerformanceStreamMarkerInfoINTEL 
	{
		public readonly StructureType sType = .PerformanceStreamMarkerInfoINTEL;
		public void* pNext = null;
		public uint32 marker = default;

		public this() {}
		public this(uint32 marker_)
		{
			marker = marker_;
		}
	}

	[CRepr]
	public struct PerformanceOverrideInfoINTEL 
	{
		public readonly StructureType sType = .PerformanceOverrideInfoINTEL;
		public void* pNext = null;
		public PerformanceOverrideTypeINTEL type = default;
		public Bool32 enable = default;
		public uint64 parameter = default;

		public this() {}
		public this(PerformanceOverrideTypeINTEL type_,Bool32 enable_,uint64 parameter_)
		{
			type = type_;
			enable = enable_;
			parameter = parameter_;
		}
	}

	[CRepr]
	public struct PerformanceConfigurationAcquireInfoINTEL 
	{
		public readonly StructureType sType = .PerformanceConfigurationAcquireInfoINTEL;
		public void* pNext = null;
		public PerformanceConfigurationTypeINTEL type = default;

		public this() {}
		public this(PerformanceConfigurationTypeINTEL type_)
		{
			type = type_;
		}
	}

	[CRepr]
	public struct PhysicalDevicePCIBusInfoPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDevicePciBusInfoPropertiesEXT;
		public void* pNext = null;
		public uint32 pciDomain = default;
		public uint32 pciBus = default;
		public uint32 pciDevice = default;
		public uint32 pciFunction = default;

		public this() {}
		public this(uint32 pciDomain_,uint32 pciBus_,uint32 pciDevice_,uint32 pciFunction_)
		{
			pciDomain = pciDomain_;
			pciBus = pciBus_;
			pciDevice = pciDevice_;
			pciFunction = pciFunction_;
		}
	}

	[CRepr]
	public struct DisplayNativeHdrSurfaceCapabilitiesAMD 
	{
		public readonly StructureType sType = .DisplayNativeHdrSurfaceCapabilitiesAMD;
		public void* pNext = null;
		public Bool32 localDimmingSupport = default;

		public this() {}
		public this(Bool32 localDimmingSupport_)
		{
			localDimmingSupport = localDimmingSupport_;
		}
	}

	[CRepr]
	public struct SwapchainDisplayNativeHdrCreateInfoAMD 
	{
		public readonly StructureType sType = .SwapchainDisplayNativeHdrCreateInfoAMD;
		public void* pNext = null;
		public Bool32 localDimmingEnable = default;

		public this() {}
		public this(Bool32 localDimmingEnable_)
		{
			localDimmingEnable = localDimmingEnable_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFragmentDensityMapFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceFragmentDensityMapFeaturesEXT;
		public void* pNext = null;
		public Bool32 fragmentDensityMap = default;
		public Bool32 fragmentDensityMapDynamic = default;
		public Bool32 fragmentDensityMapNonSubsampledImages = default;

		public this() {}
		public this(Bool32 fragmentDensityMap_,Bool32 fragmentDensityMapDynamic_,Bool32 fragmentDensityMapNonSubsampledImages_)
		{
			fragmentDensityMap = fragmentDensityMap_;
			fragmentDensityMapDynamic = fragmentDensityMapDynamic_;
			fragmentDensityMapNonSubsampledImages = fragmentDensityMapNonSubsampledImages_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFragmentDensityMapPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceFragmentDensityMapPropertiesEXT;
		public void* pNext = null;
		public Extent2D minFragmentDensityTexelSize = default;
		public Extent2D maxFragmentDensityTexelSize = default;
		public Bool32 fragmentDensityInvocations = default;

		public this() {}
		public this(Extent2D minFragmentDensityTexelSize_,Extent2D maxFragmentDensityTexelSize_,Bool32 fragmentDensityInvocations_)
		{
			minFragmentDensityTexelSize = minFragmentDensityTexelSize_;
			maxFragmentDensityTexelSize = maxFragmentDensityTexelSize_;
			fragmentDensityInvocations = fragmentDensityInvocations_;
		}
	}

	[CRepr]
	public struct RenderPassFragmentDensityMapCreateInfoEXT 
	{
		public readonly StructureType sType = .RenderPassFragmentDensityMapCreateInfoEXT;
		public void* pNext = null;
		public AttachmentReference fragmentDensityMapAttachment = default;

		public this() {}
		public this(AttachmentReference fragmentDensityMapAttachment_)
		{
			fragmentDensityMapAttachment = fragmentDensityMapAttachment_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSubgroupSizeControlFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceSubgroupSizeControlFeaturesEXT;
		public void* pNext = null;
		public Bool32 subgroupSizeControl = default;
		public Bool32 computeFullSubgroups = default;

		public this() {}
		public this(Bool32 subgroupSizeControl_,Bool32 computeFullSubgroups_)
		{
			subgroupSizeControl = subgroupSizeControl_;
			computeFullSubgroups = computeFullSubgroups_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceSubgroupSizeControlPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceSubgroupSizeControlPropertiesEXT;
		public void* pNext = null;
		public uint32 minSubgroupSize = default;
		public uint32 maxSubgroupSize = default;
		public uint32 maxComputeWorkgroupSubgroups = default;
		public ShaderStageFlags requiredSubgroupSizeStages = default;

		public this() {}
		public this(uint32 minSubgroupSize_,uint32 maxSubgroupSize_,uint32 maxComputeWorkgroupSubgroups_,ShaderStageFlags requiredSubgroupSizeStages_)
		{
			minSubgroupSize = minSubgroupSize_;
			maxSubgroupSize = maxSubgroupSize_;
			maxComputeWorkgroupSubgroups = maxComputeWorkgroupSubgroups_;
			requiredSubgroupSizeStages = requiredSubgroupSizeStages_;
		}
	}

	[CRepr]
	public struct PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT;
		public void* pNext = null;
		public uint32 requiredSubgroupSize = default;

		public this() {}
		public this(uint32 requiredSubgroupSize_)
		{
			requiredSubgroupSize = requiredSubgroupSize_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderCoreProperties2AMD 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderCoreProperties2AMD;
		public void* pNext = null;
		public ShaderCorePropertiesFlagsAMD shaderCoreFeatures = default;
		public uint32 activeComputeUnitCount = default;

		public this() {}
		public this(ShaderCorePropertiesFlagsAMD shaderCoreFeatures_,uint32 activeComputeUnitCount_)
		{
			shaderCoreFeatures = shaderCoreFeatures_;
			activeComputeUnitCount = activeComputeUnitCount_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceCoherentMemoryFeaturesAMD 
	{
		public readonly StructureType sType = .PhysicalDeviceCoherentMemoryFeaturesAMD;
		public void* pNext = null;
		public Bool32 deviceCoherentMemory = default;

		public this() {}
		public this(Bool32 deviceCoherentMemory_)
		{
			deviceCoherentMemory = deviceCoherentMemory_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMemoryBudgetPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceMemoryBudgetPropertiesEXT;
		public void* pNext = null;
		public DeviceSize[VK_MAX_MEMORY_HEAPS] heapBudget = default;
		public DeviceSize[VK_MAX_MEMORY_HEAPS] heapUsage = default;

		public this() {}
		public this(DeviceSize[Vulkan.VK_MAX_MEMORY_HEAPS] heapBudget_,DeviceSize[Vulkan.VK_MAX_MEMORY_HEAPS] heapUsage_)
		{
			heapBudget = heapBudget_;
			heapUsage = heapUsage_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceMemoryPriorityFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceMemoryPriorityFeaturesEXT;
		public void* pNext = null;
		public Bool32 memoryPriority = default;

		public this() {}
		public this(Bool32 memoryPriority_)
		{
			memoryPriority = memoryPriority_;
		}
	}

	[CRepr]
	public struct MemoryPriorityAllocateInfoEXT 
	{
		public readonly StructureType sType = .MemoryPriorityAllocateInfoEXT;
		public void* pNext = null;
		public float priority = default;

		public this() {}
		public this(float priority_)
		{
			priority = priority_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV;
		public void* pNext = null;
		public Bool32 dedicatedAllocationImageAliasing = default;

		public this() {}
		public this(Bool32 dedicatedAllocationImageAliasing_)
		{
			dedicatedAllocationImageAliasing = dedicatedAllocationImageAliasing_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceBufferDeviceAddressFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceBufferDeviceAddressFeaturesEXT;
		public void* pNext = null;
		public Bool32 bufferDeviceAddress = default;
		public Bool32 bufferDeviceAddressCaptureReplay = default;
		public Bool32 bufferDeviceAddressMultiDevice = default;

		public this() {}
		public this(Bool32 bufferDeviceAddress_,Bool32 bufferDeviceAddressCaptureReplay_,Bool32 bufferDeviceAddressMultiDevice_)
		{
			bufferDeviceAddress = bufferDeviceAddress_;
			bufferDeviceAddressCaptureReplay = bufferDeviceAddressCaptureReplay_;
			bufferDeviceAddressMultiDevice = bufferDeviceAddressMultiDevice_;
		}
	}

	[CRepr]
	public struct BufferDeviceAddressCreateInfoEXT 
	{
		public readonly StructureType sType = .BufferDeviceAddressCreateInfoEXT;
		public void* pNext = null;
		public DeviceAddress deviceAddress = default;

		public this() {}
		public this(DeviceAddress deviceAddress_)
		{
			deviceAddress = deviceAddress_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceToolPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceToolPropertiesEXT;
		public void* pNext = null;
		public char8[VK_MAX_EXTENSION_NAME_SIZE] name = default;
		public char8[VK_MAX_EXTENSION_NAME_SIZE] version = default;
		public ToolPurposeFlagsEXT purposes = default;
		public char8[VK_MAX_DESCRIPTION_SIZE] description = default;
		public char8[VK_MAX_EXTENSION_NAME_SIZE] layer = default;

		public this() {}
		public this(char8[Vulkan.VK_MAX_EXTENSION_NAME_SIZE] name_,char8[Vulkan.VK_MAX_EXTENSION_NAME_SIZE] version_,ToolPurposeFlagsEXT purposes_,char8[Vulkan.VK_MAX_DESCRIPTION_SIZE] description_,char8[Vulkan.VK_MAX_EXTENSION_NAME_SIZE] layer_)
		{
			name = name_;
			version = version_;
			purposes = purposes_;
			description = description_;
			layer = layer_;
		}
	}

	[CRepr]
	public struct ValidationFeaturesEXT 
	{
		public readonly StructureType sType = .ValidationFeaturesEXT;
		public void* pNext = null;
		public uint32 enabledValidationFeatureCount = default;
		public ValidationFeatureEnableEXT* pEnabledValidationFeatures = default;
		public uint32 disabledValidationFeatureCount = default;
		public ValidationFeatureDisableEXT* pDisabledValidationFeatures = default;

		public this() {}
		public this(uint32 enabledValidationFeatureCount_,ValidationFeatureEnableEXT* pEnabledValidationFeatures_,uint32 disabledValidationFeatureCount_,ValidationFeatureDisableEXT* pDisabledValidationFeatures_)
		{
			enabledValidationFeatureCount = enabledValidationFeatureCount_;
			pEnabledValidationFeatures = pEnabledValidationFeatures_;
			disabledValidationFeatureCount = disabledValidationFeatureCount_;
			pDisabledValidationFeatures = pDisabledValidationFeatures_;
		}
	}

	[CRepr]
	public struct CooperativeMatrixPropertiesNV 
	{
		public readonly StructureType sType = .CooperativeMatrixPropertiesNV;
		public void* pNext = null;
		public uint32 MSize = default;
		public uint32 NSize = default;
		public uint32 KSize = default;
		public ComponentTypeNV AType = default;
		public ComponentTypeNV BType = default;
		public ComponentTypeNV CType = default;
		public ComponentTypeNV DType = default;
		public ScopeNV _scope = default;

		public this() {}
		public this(uint32 MSize_,uint32 NSize_,uint32 KSize_,ComponentTypeNV AType_,ComponentTypeNV BType_,ComponentTypeNV CType_,ComponentTypeNV DType_,ScopeNV _scope_)
		{
			MSize = MSize_;
			NSize = NSize_;
			KSize = KSize_;
			AType = AType_;
			BType = BType_;
			CType = CType_;
			DType = DType_;
			_scope = _scope_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceCooperativeMatrixFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceCooperativeMatrixFeaturesNV;
		public void* pNext = null;
		public Bool32 cooperativeMatrix = default;
		public Bool32 cooperativeMatrixRobustBufferAccess = default;

		public this() {}
		public this(Bool32 cooperativeMatrix_,Bool32 cooperativeMatrixRobustBufferAccess_)
		{
			cooperativeMatrix = cooperativeMatrix_;
			cooperativeMatrixRobustBufferAccess = cooperativeMatrixRobustBufferAccess_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceCooperativeMatrixPropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceCooperativeMatrixPropertiesNV;
		public void* pNext = null;
		public ShaderStageFlags cooperativeMatrixSupportedStages = default;

		public this() {}
		public this(ShaderStageFlags cooperativeMatrixSupportedStages_)
		{
			cooperativeMatrixSupportedStages = cooperativeMatrixSupportedStages_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceCoverageReductionModeFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceCoverageReductionModeFeaturesNV;
		public void* pNext = null;
		public Bool32 coverageReductionMode = default;

		public this() {}
		public this(Bool32 coverageReductionMode_)
		{
			coverageReductionMode = coverageReductionMode_;
		}
	}

	[CRepr]
	public struct PipelineCoverageReductionStateCreateInfoNV 
	{
		public readonly StructureType sType = .PipelineCoverageReductionStateCreateInfoNV;
		public void* pNext = null;
		public PipelineCoverageReductionStateCreateFlagsNV flags = default;
		public CoverageReductionModeNV coverageReductionMode = default;

		public this() {}
		public this(PipelineCoverageReductionStateCreateFlagsNV flags_,CoverageReductionModeNV coverageReductionMode_)
		{
			flags = flags_;
			coverageReductionMode = coverageReductionMode_;
		}
	}

	[CRepr]
	public struct FramebufferMixedSamplesCombinationNV 
	{
		public readonly StructureType sType = .FramebufferMixedSamplesCombinationNV;
		public void* pNext = null;
		public CoverageReductionModeNV coverageReductionMode = default;
		public SampleCountFlags rasterizationSamples = default;
		public SampleCountFlags depthStencilSamples = default;
		public SampleCountFlags colorSamples = default;

		public this() {}
		public this(CoverageReductionModeNV coverageReductionMode_,SampleCountFlags rasterizationSamples_,SampleCountFlags depthStencilSamples_,SampleCountFlags colorSamples_)
		{
			coverageReductionMode = coverageReductionMode_;
			rasterizationSamples = rasterizationSamples_;
			depthStencilSamples = depthStencilSamples_;
			colorSamples = colorSamples_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceFragmentShaderInterlockFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceFragmentShaderInterlockFeaturesEXT;
		public void* pNext = null;
		public Bool32 fragmentShaderSampleInterlock = default;
		public Bool32 fragmentShaderPixelInterlock = default;
		public Bool32 fragmentShaderShadingRateInterlock = default;

		public this() {}
		public this(Bool32 fragmentShaderSampleInterlock_,Bool32 fragmentShaderPixelInterlock_,Bool32 fragmentShaderShadingRateInterlock_)
		{
			fragmentShaderSampleInterlock = fragmentShaderSampleInterlock_;
			fragmentShaderPixelInterlock = fragmentShaderPixelInterlock_;
			fragmentShaderShadingRateInterlock = fragmentShaderShadingRateInterlock_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceYcbcrImageArraysFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceYcbcrImageArraysFeaturesEXT;
		public void* pNext = null;
		public Bool32 ycbcrImageArrays = default;

		public this() {}
		public this(Bool32 ycbcrImageArrays_)
		{
			ycbcrImageArrays = ycbcrImageArrays_;
		}
	}

	[CRepr]
	public struct HeadlessSurfaceCreateInfoEXT 
	{
		public readonly StructureType sType = .HeadlessSurfaceCreateInfoEXT;
		public void* pNext = null;
		public HeadlessSurfaceCreateFlagsEXT flags = default;

		public this() {}
		public this(HeadlessSurfaceCreateFlagsEXT flags_)
		{
			flags = flags_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceLineRasterizationFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceLineRasterizationFeaturesEXT;
		public void* pNext = null;
		public Bool32 rectangularLines = default;
		public Bool32 bresenhamLines = default;
		public Bool32 smoothLines = default;
		public Bool32 stippledRectangularLines = default;
		public Bool32 stippledBresenhamLines = default;
		public Bool32 stippledSmoothLines = default;

		public this() {}
		public this(Bool32 rectangularLines_,Bool32 bresenhamLines_,Bool32 smoothLines_,Bool32 stippledRectangularLines_,Bool32 stippledBresenhamLines_,Bool32 stippledSmoothLines_)
		{
			rectangularLines = rectangularLines_;
			bresenhamLines = bresenhamLines_;
			smoothLines = smoothLines_;
			stippledRectangularLines = stippledRectangularLines_;
			stippledBresenhamLines = stippledBresenhamLines_;
			stippledSmoothLines = stippledSmoothLines_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceLineRasterizationPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceLineRasterizationPropertiesEXT;
		public void* pNext = null;
		public uint32 lineSubPixelPrecisionBits = default;

		public this() {}
		public this(uint32 lineSubPixelPrecisionBits_)
		{
			lineSubPixelPrecisionBits = lineSubPixelPrecisionBits_;
		}
	}

	[CRepr]
	public struct PipelineRasterizationLineStateCreateInfoEXT 
	{
		public readonly StructureType sType = .PipelineRasterizationLineStateCreateInfoEXT;
		public void* pNext = null;
		public LineRasterizationModeEXT lineRasterizationMode = default;
		public Bool32 stippledLineEnable = default;
		public uint32 lineStippleFactor = default;
		public uint16 lineStipplePattern = default;

		public this() {}
		public this(LineRasterizationModeEXT lineRasterizationMode_,Bool32 stippledLineEnable_,uint32 lineStippleFactor_,uint16 lineStipplePattern_)
		{
			lineRasterizationMode = lineRasterizationMode_;
			stippledLineEnable = stippledLineEnable_;
			lineStippleFactor = lineStippleFactor_;
			lineStipplePattern = lineStipplePattern_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceIndexTypeUint8FeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceIndexTypeUint8FeaturesEXT;
		public void* pNext = null;
		public Bool32 indexTypeUint8 = default;

		public this() {}
		public this(Bool32 indexTypeUint8_)
		{
			indexTypeUint8 = indexTypeUint8_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT;
		public void* pNext = null;
		public Bool32 shaderDemoteToHelperInvocation = default;

		public this() {}
		public this(Bool32 shaderDemoteToHelperInvocation_)
		{
			shaderDemoteToHelperInvocation = shaderDemoteToHelperInvocation_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDeviceGeneratedCommandsPropertiesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceDeviceGeneratedCommandsPropertiesNV;
		public void* pNext = null;
		public uint32 maxGraphicsShaderGroupCount = default;
		public uint32 maxIndirectSequenceCount = default;
		public uint32 maxIndirectCommandsTokenCount = default;
		public uint32 maxIndirectCommandsStreamCount = default;
		public uint32 maxIndirectCommandsTokenOffset = default;
		public uint32 maxIndirectCommandsStreamStride = default;
		public uint32 minSequencesCountBufferOffsetAlignment = default;
		public uint32 minSequencesIndexBufferOffsetAlignment = default;
		public uint32 minIndirectCommandsBufferOffsetAlignment = default;

		public this() {}
		public this(uint32 maxGraphicsShaderGroupCount_,uint32 maxIndirectSequenceCount_,uint32 maxIndirectCommandsTokenCount_,uint32 maxIndirectCommandsStreamCount_,uint32 maxIndirectCommandsTokenOffset_,uint32 maxIndirectCommandsStreamStride_,uint32 minSequencesCountBufferOffsetAlignment_,uint32 minSequencesIndexBufferOffsetAlignment_,uint32 minIndirectCommandsBufferOffsetAlignment_)
		{
			maxGraphicsShaderGroupCount = maxGraphicsShaderGroupCount_;
			maxIndirectSequenceCount = maxIndirectSequenceCount_;
			maxIndirectCommandsTokenCount = maxIndirectCommandsTokenCount_;
			maxIndirectCommandsStreamCount = maxIndirectCommandsStreamCount_;
			maxIndirectCommandsTokenOffset = maxIndirectCommandsTokenOffset_;
			maxIndirectCommandsStreamStride = maxIndirectCommandsStreamStride_;
			minSequencesCountBufferOffsetAlignment = minSequencesCountBufferOffsetAlignment_;
			minSequencesIndexBufferOffsetAlignment = minSequencesIndexBufferOffsetAlignment_;
			minIndirectCommandsBufferOffsetAlignment = minIndirectCommandsBufferOffsetAlignment_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDeviceGeneratedCommandsFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceDeviceGeneratedCommandsFeaturesNV;
		public void* pNext = null;
		public Bool32 deviceGeneratedCommands = default;

		public this() {}
		public this(Bool32 deviceGeneratedCommands_)
		{
			deviceGeneratedCommands = deviceGeneratedCommands_;
		}
	}

	[CRepr]
	public struct GraphicsShaderGroupCreateInfoNV 
	{
		public readonly StructureType sType = .GraphicsShaderGroupCreateInfoNV;
		public void* pNext = null;
		public uint32 stageCount = default;
		public PipelineShaderStageCreateInfo* pStages = default;
		public PipelineVertexInputStateCreateInfo* pVertexInputState = default;
		public PipelineTessellationStateCreateInfo* pTessellationState = default;

		public this() {}
		public this(uint32 stageCount_,PipelineShaderStageCreateInfo* pStages_,PipelineVertexInputStateCreateInfo* pVertexInputState_,PipelineTessellationStateCreateInfo* pTessellationState_)
		{
			stageCount = stageCount_;
			pStages = pStages_;
			pVertexInputState = pVertexInputState_;
			pTessellationState = pTessellationState_;
		}
	}

	[CRepr]
	public struct GraphicsPipelineShaderGroupsCreateInfoNV 
	{
		public readonly StructureType sType = .GraphicsPipelineShaderGroupsCreateInfoNV;
		public void* pNext = null;
		public uint32 groupCount = default;
		public GraphicsShaderGroupCreateInfoNV* pGroups = default;
		public uint32 pipelineCount = default;
		public Pipeline* pPipelines = default;

		public this() {}
		public this(uint32 groupCount_,GraphicsShaderGroupCreateInfoNV* pGroups_,uint32 pipelineCount_,Pipeline* pPipelines_)
		{
			groupCount = groupCount_;
			pGroups = pGroups_;
			pipelineCount = pipelineCount_;
			pPipelines = pPipelines_;
		}
	}

	[CRepr]
	public struct BindShaderGroupIndirectCommandNV 
	{
		public uint32 groupIndex = default;

		public this() {}
		public this(uint32 groupIndex_)
		{
			groupIndex = groupIndex_;
		}
	}

	[CRepr]
	public struct BindIndexBufferIndirectCommandNV 
	{
		public DeviceAddress bufferAddress = default;
		public uint32 size = default;
		public IndexType indexType = default;

		public this() {}
		public this(DeviceAddress bufferAddress_,uint32 size_,IndexType indexType_)
		{
			bufferAddress = bufferAddress_;
			size = size_;
			indexType = indexType_;
		}
	}

	[CRepr]
	public struct BindVertexBufferIndirectCommandNV 
	{
		public DeviceAddress bufferAddress = default;
		public uint32 size = default;
		public uint32 stride = default;

		public this() {}
		public this(DeviceAddress bufferAddress_,uint32 size_,uint32 stride_)
		{
			bufferAddress = bufferAddress_;
			size = size_;
			stride = stride_;
		}
	}

	[CRepr]
	public struct SetStateFlagsIndirectCommandNV 
	{
		public uint32 data = default;

		public this() {}
		public this(uint32 data_)
		{
			data = data_;
		}
	}

	[CRepr]
	public struct IndirectCommandsStreamNV 
	{
		public Buffer buffer = default;
		public DeviceSize offset = default;

		public this() {}
		public this(Buffer buffer_,DeviceSize offset_)
		{
			buffer = buffer_;
			offset = offset_;
		}
	}

	[CRepr]
	public struct IndirectCommandsLayoutTokenNV 
	{
		public readonly StructureType sType = .IndirectCommandsLayoutTokenNV;
		public void* pNext = null;
		public IndirectCommandsTokenTypeNV tokenType = default;
		public uint32 stream = default;
		public uint32 offset = default;
		public uint32 vertexBindingUnit = default;
		public Bool32 vertexDynamicStride = default;
		public PipelineLayout pushconstantPipelineLayout = default;
		public ShaderStageFlags pushconstantShaderStageFlags = default;
		public uint32 pushconstantOffset = default;
		public uint32 pushconstantSize = default;
		public IndirectStateFlagsNV indirectStateFlags = default;
		public uint32 indexTypeCount = default;
		public IndexType* pIndexTypes = default;
		public uint32* pIndexTypeValues = default;

		public this() {}
		public this(IndirectCommandsTokenTypeNV tokenType_,uint32 stream_,uint32 offset_,uint32 vertexBindingUnit_,Bool32 vertexDynamicStride_,PipelineLayout pushconstantPipelineLayout_,ShaderStageFlags pushconstantShaderStageFlags_,uint32 pushconstantOffset_,uint32 pushconstantSize_,IndirectStateFlagsNV indirectStateFlags_,uint32 indexTypeCount_,IndexType* pIndexTypes_,uint32* pIndexTypeValues_)
		{
			tokenType = tokenType_;
			stream = stream_;
			offset = offset_;
			vertexBindingUnit = vertexBindingUnit_;
			vertexDynamicStride = vertexDynamicStride_;
			pushconstantPipelineLayout = pushconstantPipelineLayout_;
			pushconstantShaderStageFlags = pushconstantShaderStageFlags_;
			pushconstantOffset = pushconstantOffset_;
			pushconstantSize = pushconstantSize_;
			indirectStateFlags = indirectStateFlags_;
			indexTypeCount = indexTypeCount_;
			pIndexTypes = pIndexTypes_;
			pIndexTypeValues = pIndexTypeValues_;
		}
	}

	[CRepr]
	public struct IndirectCommandsLayoutCreateInfoNV 
	{
		public readonly StructureType sType = .IndirectCommandsLayoutCreateInfoNV;
		public void* pNext = null;
		public IndirectCommandsLayoutUsageFlagsNV flags = default;
		public PipelineBindPoint pipelineBindPoint = default;
		public uint32 tokenCount = default;
		public IndirectCommandsLayoutTokenNV* pTokens = default;
		public uint32 streamCount = default;
		public uint32* pStreamStrides = default;

		public this() {}
		public this(IndirectCommandsLayoutUsageFlagsNV flags_,PipelineBindPoint pipelineBindPoint_,uint32 tokenCount_,IndirectCommandsLayoutTokenNV* pTokens_,uint32 streamCount_,uint32* pStreamStrides_)
		{
			flags = flags_;
			pipelineBindPoint = pipelineBindPoint_;
			tokenCount = tokenCount_;
			pTokens = pTokens_;
			streamCount = streamCount_;
			pStreamStrides = pStreamStrides_;
		}
	}

	[CRepr]
	public struct GeneratedCommandsInfoNV 
	{
		public readonly StructureType sType = .GeneratedCommandsInfoNV;
		public void* pNext = null;
		public PipelineBindPoint pipelineBindPoint = default;
		public Pipeline pipeline = default;
		public IndirectCommandsLayoutNV indirectCommandsLayout = default;
		public uint32 streamCount = default;
		public IndirectCommandsStreamNV* pStreams = default;
		public uint32 sequencesCount = default;
		public Buffer preprocessBuffer = default;
		public DeviceSize preprocessOffset = default;
		public DeviceSize preprocessSize = default;
		public Buffer sequencesCountBuffer = default;
		public DeviceSize sequencesCountOffset = default;
		public Buffer sequencesIndexBuffer = default;
		public DeviceSize sequencesIndexOffset = default;

		public this() {}
		public this(PipelineBindPoint pipelineBindPoint_,Pipeline pipeline_,IndirectCommandsLayoutNV indirectCommandsLayout_,uint32 streamCount_,IndirectCommandsStreamNV* pStreams_,uint32 sequencesCount_,Buffer preprocessBuffer_,DeviceSize preprocessOffset_,DeviceSize preprocessSize_,Buffer sequencesCountBuffer_,DeviceSize sequencesCountOffset_,Buffer sequencesIndexBuffer_,DeviceSize sequencesIndexOffset_)
		{
			pipelineBindPoint = pipelineBindPoint_;
			pipeline = pipeline_;
			indirectCommandsLayout = indirectCommandsLayout_;
			streamCount = streamCount_;
			pStreams = pStreams_;
			sequencesCount = sequencesCount_;
			preprocessBuffer = preprocessBuffer_;
			preprocessOffset = preprocessOffset_;
			preprocessSize = preprocessSize_;
			sequencesCountBuffer = sequencesCountBuffer_;
			sequencesCountOffset = sequencesCountOffset_;
			sequencesIndexBuffer = sequencesIndexBuffer_;
			sequencesIndexOffset = sequencesIndexOffset_;
		}
	}

	[CRepr]
	public struct GeneratedCommandsMemoryRequirementsInfoNV 
	{
		public readonly StructureType sType = .GeneratedCommandsMemoryRequirementsInfoNV;
		public void* pNext = null;
		public PipelineBindPoint pipelineBindPoint = default;
		public Pipeline pipeline = default;
		public IndirectCommandsLayoutNV indirectCommandsLayout = default;
		public uint32 maxSequencesCount = default;

		public this() {}
		public this(PipelineBindPoint pipelineBindPoint_,Pipeline pipeline_,IndirectCommandsLayoutNV indirectCommandsLayout_,uint32 maxSequencesCount_)
		{
			pipelineBindPoint = pipelineBindPoint_;
			pipeline = pipeline_;
			indirectCommandsLayout = indirectCommandsLayout_;
			maxSequencesCount = maxSequencesCount_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTexelBufferAlignmentFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceTexelBufferAlignmentFeaturesEXT;
		public void* pNext = null;
		public Bool32 texelBufferAlignment = default;

		public this() {}
		public this(Bool32 texelBufferAlignment_)
		{
			texelBufferAlignment = texelBufferAlignment_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceTexelBufferAlignmentPropertiesEXT 
	{
		public readonly StructureType sType = .PhysicalDeviceTexelBufferAlignmentPropertiesEXT;
		public void* pNext = null;
		public DeviceSize storageTexelBufferOffsetAlignmentBytes = default;
		public Bool32 storageTexelBufferOffsetSingleTexelAlignment = default;
		public DeviceSize uniformTexelBufferOffsetAlignmentBytes = default;
		public Bool32 uniformTexelBufferOffsetSingleTexelAlignment = default;

		public this() {}
		public this(DeviceSize storageTexelBufferOffsetAlignmentBytes_,Bool32 storageTexelBufferOffsetSingleTexelAlignment_,DeviceSize uniformTexelBufferOffsetAlignmentBytes_,Bool32 uniformTexelBufferOffsetSingleTexelAlignment_)
		{
			storageTexelBufferOffsetAlignmentBytes = storageTexelBufferOffsetAlignmentBytes_;
			storageTexelBufferOffsetSingleTexelAlignment = storageTexelBufferOffsetSingleTexelAlignment_;
			uniformTexelBufferOffsetAlignmentBytes = uniformTexelBufferOffsetAlignmentBytes_;
			uniformTexelBufferOffsetSingleTexelAlignment = uniformTexelBufferOffsetSingleTexelAlignment_;
		}
	}

	[CRepr]
	public struct RenderPassTransformBeginInfoQCOM 
	{
		public readonly StructureType sType = .RenderPassTransformBeginInfoQCOM;
		public void* pNext = null;
		public SurfaceTransformFlagsKHR transform = default;

		public this() {}
		public this(SurfaceTransformFlagsKHR transform_)
		{
			transform = transform_;
		}
	}

	[CRepr]
	public struct CommandBufferInheritanceRenderPassTransformInfoQCOM 
	{
		public readonly StructureType sType = .CommandBufferInheritanceRenderPassTransformInfoQCOM;
		public void* pNext = null;
		public SurfaceTransformFlagsKHR transform = default;
		public Rect2D renderArea = default;

		public this() {}
		public this(SurfaceTransformFlagsKHR transform_,Rect2D renderArea_)
		{
			transform = transform_;
			renderArea = renderArea_;
		}
	}

	[CRepr]
	public struct PhysicalDevicePipelineCreationCacheControlFeaturesEXT 
	{
		public readonly StructureType sType = .PhysicalDevicePipelineCreationCacheControlFeaturesEXT;
		public void* pNext = null;
		public Bool32 pipelineCreationCacheControl = default;

		public this() {}
		public this(Bool32 pipelineCreationCacheControl_)
		{
			pipelineCreationCacheControl = pipelineCreationCacheControl_;
		}
	}

	[CRepr]
	public struct PhysicalDeviceDiagnosticsConfigFeaturesNV 
	{
		public readonly StructureType sType = .PhysicalDeviceDiagnosticsConfigFeaturesNV;
		public void* pNext = null;
		public Bool32 diagnosticsConfig = default;

		public this() {}
		public this(Bool32 diagnosticsConfig_)
		{
			diagnosticsConfig = diagnosticsConfig_;
		}
	}

	[CRepr]
	public struct DeviceDiagnosticsConfigCreateInfoNV 
	{
		public readonly StructureType sType = .DeviceDiagnosticsConfigCreateInfoNV;
		public void* pNext = null;
		public DeviceDiagnosticsConfigFlagsNV flags = default;

		public this() {}
		public this(DeviceDiagnosticsConfigFlagsNV flags_)
		{
			flags = flags_;
		}
	}

	[CRepr]
	[Union]
	public struct ClearColorValue 
	{
		public float[4] float32 = default;
		public int32[4] int32 = default;
		public uint32[4] uint32 = default;

		public this() {
			this = default;
		}

		public this(float[4] float32_,int32[4] int32_,uint32[4] uint32_)
		{
			float32 = float32_;
			int32 = int32_;
			uint32 = uint32_;
		}
	}

	[CRepr]
	[Union]
	public struct ClearValue 
	{
		public ClearColorValue color = default;
		public ClearDepthStencilValue depthStencil = default;

		public this() {
			this = default;
		}

		public this(ClearColorValue color_,ClearDepthStencilValue depthStencil_)
		{
			color = color_;
			depthStencil = depthStencil_;
		}
	}

	[CRepr]
	[Union]
	public struct PerformanceCounterResultKHR 
	{
		public int32 int32 = default;
		public int64 int64 = default;
		public uint32 uint32 = default;
		public uint64 uint64 = default;
		public float float32 = default;
		public double float64 = default;

		public this() {}
		public this(int32 int32_,int64 int64_,uint32 uint32_,uint64 uint64_,float float32_,double float64_)
		{
			int32 = int32_;
			int64 = int64_;
			uint32 = uint32_;
			uint64 = uint64_;
			float32 = float32_;
			float64 = float64_;
		}
	}

	[CRepr]
	[Union]
	public struct PipelineExecutableStatisticValueKHR 
	{
		public Bool32 b32 = default;
		public int64 i64 = default;
		public uint64 u64 = default;
		public double f64 = default;

		public this() {}
		public this(Bool32 b32_,int64 i64_,uint64 u64_,double f64_)
		{
			b32 = b32_;
			i64 = i64_;
			u64 = u64_;
			f64 = f64_;
		}
	}

	[CRepr]
	[Union]
	public struct PerformanceValueDataINTEL 
	{
		public uint32 value32 = default;
		public uint64 value64 = default;
		public float valueFloat = default;
		public Bool32 valueBool = default;
		public char8* valueString = default;

		public this() {}
		public this(uint32 value32_,uint64 value64_,float valueFloat_,Bool32 valueBool_,char8* valueString_)
		{
			value32 = value32_;
			value64 = value64_;
			valueFloat = valueFloat_;
			valueBool = valueBool_;
			valueString = valueString_;
		}
	}


}