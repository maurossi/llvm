LOCAL_PATH := $(call my-dir)

arm_utils_TBLGEN_TABLES60 := \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenSystemOperands.inc \
  ARMGenSystemRegister.inc

arm_utils_SRC_FILES := \
  ARMBaseInfo.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM60ARMUtils

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(arm_utils_TBLGEN_TABLES60)

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM60ARMUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR60 := $(LOCAL_PATH)/..
TBLGEN_TABLES60 := $(arm_utils_TBLGEN_TABLES60)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
