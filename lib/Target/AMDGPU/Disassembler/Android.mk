LOCAL_PATH := $(call my-dir)

amdgpu_disassembler_TBLGEN_TABLES80 := \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_disassembler_SRC_FILES := \
  AMDGPUDisassembler.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE := libLLVM80AMDGPUAsmDisassembler
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_disassembler_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES80 := $(amdgpu_disassembler_TBLGEN_TABLES80)
TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE := libLLVM80AMDGPUDisassembler

LOCAL_SRC_FILES := $(amdgpu_disassembler_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES80 := $(amdgpu_disassembler_TBLGEN_TABLES80)
TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
