LOCAL_PATH:= $(call my-dir)

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	ExecutionEngineBindings.cpp \
	ExecutionEngine.cpp \
	GDBRegistrationListener.cpp \
	SectionMemoryManager.cpp \
	TargetSelect.cpp

LOCAL_MODULE:= libLLVMExecutionEngine

LOCAL_C_INCLUDES := $(LLVM_ROOT_PATH)/llvm/ExecutionEngine

LOCAL_WHOLE_STATIC_LIBRARIES := libLLVMRuntimeDyld libLLVMMCJIT

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := \
	ExecutionEngineBindings.cpp \
	ExecutionEngine.cpp \
	GDBRegistrationListener.cpp \
	SectionMemoryManager.cpp \
	TargetSelect.cpp

LOCAL_C_INCLUDES := $(LLVM_ROOT_PATH)/llvm/ExecutionEngine

LOCAL_MODULE:= libLLVMExecutionEngine

LOCAL_WHOLE_STATIC_LIBRARIES := libLLVMRuntimeDyld libLLVMMCJIT

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
