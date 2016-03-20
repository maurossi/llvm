LOCAL_PATH:= $(call my-dir)

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  ExecutionUtils.cpp \
  IndirectionUtils.cpp \
  OrcMCJITReplacement.cpp \
  OrcTargetSupport.cpp

LOCAL_MODULE:= libLLVMOrcJIT

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := \
  CloneSubModule.cpp \
  ExecutionUtils.cpp \
  IndirectionUtils.cpp \
  OrcMCJITReplacement.cpp \
  OrcTargetSupport.cpp

LOCAL_MODULE:= libLLVMOrcJIT

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
