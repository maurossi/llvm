LOCAL_PATH := $(call my-dir)

AMDGPU_target_info_TBLGEN_TABLES := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenInstrInfo.inc

AMDGPU_target_info_SRC_FILES := \
  AMDGPUTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_target_info_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(AMDGPU_target_info_SRC_FILES)

LOCAL_MODULE:= libLLVMR600Info

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := STATIC_LIBRARIES

generated-sources := $(call local-generated-sources-dir)
LOCAL_C_INCLUDES +=     \
	$(LOCAL_PATH)/.. \
	$(generated-sources)/../libLLVMR600CodeGen_intermediates

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_target_info_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(AMDGPU_target_info_SRC_FILES)

LOCAL_MODULE:= libLLVMR600Info

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := STATIC_LIBRARIES

generated-sources := $(call local-generated-sources-dir)
LOCAL_C_INCLUDES +=     \
        $(LOCAL_PATH)/.. \
	$(generated-sources)/../libLLVMR600CodeGen_intermediates

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
