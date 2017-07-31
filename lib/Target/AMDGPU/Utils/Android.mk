LOCAL_PATH := $(call my-dir)

amdgpu_utils_TBLGEN_TABLES39 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_utils_SRC_FILES39 := \
  AMDGPUBaseInfo.cpp \
  AMDKernelCodeTUtils.cpp \
  AMDGPUAsmUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES39)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM39AMDGPUUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(amdgpu_utils_TBLGEN_TABLES39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES39)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM39AMDGPUUtils

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(amdgpu_utils_TBLGEN_TABLES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
