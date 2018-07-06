LOCAL_PATH := $(call my-dir)

amdgpu_instprinter_TBLGEN_TABLES70 := \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  R600GenAsmWriter.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_instprinter_SRC_FILES := \
  AMDGPUInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE := libLLVM70AMDGPUAsmPrinter
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES70 := $(amdgpu_instprinter_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE := libLLVM70AMDGPUAsmPrinter

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES70 := $(amdgpu_instprinter_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
