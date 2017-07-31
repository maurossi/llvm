LOCAL_PATH:= $(call my-dir)

executionengine_SRC_FILES39 := \
	ExecutionEngineBindings.cpp \
	ExecutionEngine.cpp \
	GDBRegistrationListener.cpp \
	SectionMemoryManager.cpp \
	TargetSelect.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libLL39ExecutionEngine
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(executionengine_SRC_FILES39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := libLL39ExecutionEngine
LOCAL_SRC_FILES := $(executionengine_SRC_FILES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
