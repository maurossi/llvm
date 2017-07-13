LOCAL_PATH := $(call my-dir)

amdgpu_utils_TBLGEN_TABLES := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_utils_SRC_FILES := \
  AMDGPUBaseInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVMAMDGPUUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(amdgpu_utils_TBLGEN_TABLES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVMAMDGPUUtils

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(amdgpu_utils_TBLGEN_TABLES)

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
