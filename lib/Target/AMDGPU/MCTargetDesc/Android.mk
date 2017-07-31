LOCAL_PATH := $(call my-dir)

amdgpu_mc_desc_TBLGEN_TABLES39 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_mc_desc_SRC_FILES39 := \
  AMDGPUAsmBackend.cpp \
  AMDGPUELFObjectWriter.cpp \
  AMDGPUELFStreamer.cpp \
  AMDGPUMCCodeEmitter.cpp \
  AMDGPUMCTargetDesc.cpp \
  AMDGPUMCAsmInfo.cpp \
  AMDGPUTargetStreamer.cpp \
  R600MCCodeEmitter.cpp \
  SIMCCodeEmitter.cpp \

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(amdgpu_mc_desc_TBLGEN_TABLES39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUDesc

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(amdgpu_mc_desc_TBLGEN_TABLES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
