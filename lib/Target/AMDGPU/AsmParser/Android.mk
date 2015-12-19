LOCAL_PATH := $(call my-dir)

AMDGPU_asmparser_TBLGEN_TABLES := \
  AMDGPUGenAsmMatcher.inc

AMDGPU_asmparser_SRC_FILES := \
  AMDGPUAsmParser.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_asmparser_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(AMDGPU_asmparser_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVMAMDGPUAsmParser

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_asmparser_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(AMDGPU_asmparser_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVMAMDGPUAsmParser

LOCAL_MODULE_TAGS := optional

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
