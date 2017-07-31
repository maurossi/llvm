LOCAL_PATH := $(call my-dir)

amdgpu_instprinter_TBLGEN_TABLES39 := \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_instprinter_SRC_FILES39 := \
  AMDGPUInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUAsmPrinter
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES39 := $(amdgpu_instprinter_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUAsmPrinter

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TABLES39 := $(amdgpu_instprinter_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
