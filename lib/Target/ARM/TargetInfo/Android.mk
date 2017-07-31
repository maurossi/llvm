LOCAL_PATH := $(call my-dir)

arm_target_info_TBLGEN_TABLES39 := \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc

arm_target_info_SRC_FILES39 := \
  ARMTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_target_info_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES39)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39ARMInfo

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_target_info_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES39)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39ARMInfo

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
