LOCAL_PATH := $(call my-dir)

amdgpu_disassembler_TBLGEN_TABLES50 := \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_disassembler_SRC_FILES := \
  AMDGPUDisassembler.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE := libLLVM50AMDGPUAsmDisassembler
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_disassembler_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES50 := $(amdgpu_disassembler_TBLGEN_TABLES50)
TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE := libLLVM50AMDGPUDisassembler

LOCAL_SRC_FILES := $(amdgpu_disassembler_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES50 := $(amdgpu_disassembler_TBLGEN_TABLES50)
TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
