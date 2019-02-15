LOCAL_PATH := $(call my-dir)

amdgpu_mc_desc_TBLGEN_TABLES80 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  R600GenMCCodeEmitter.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_mc_desc_SRC_FILES := \
  AMDGPUAsmBackend.cpp \
  AMDGPUELFObjectWriter.cpp \
  AMDGPUELFStreamer.cpp \
  AMDGPUMCAsmInfo.cpp \
  AMDGPUMCCodeEmitter.cpp \
  AMDGPUMCTargetDesc.cpp \
  AMDGPUTargetStreamer.cpp \
  R600MCCodeEmitter.cpp \
  R600MCTargetDesc.cpp \
  SIMCCodeEmitter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE := libLLVM80AMDGPUDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..
TBLGEN_TABLES80 := $(amdgpu_mc_desc_TBLGEN_TABLES80)

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE := libLLVM80AMDGPUDesc

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..
TBLGEN_TABLES80 := $(amdgpu_mc_desc_TBLGEN_TABLES80)

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
