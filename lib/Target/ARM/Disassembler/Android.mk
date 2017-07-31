LOCAL_PATH := $(call my-dir)

arm_disassembler_TBLGEN_TABLES39 := \
  ARMGenDisassemblerTables.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc

arm_disassembler_SRC_FILES39 := \
  ARMDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_disassembler_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES39)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39ARMDisassembler

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_disassembler_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES39)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39ARMDisassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

