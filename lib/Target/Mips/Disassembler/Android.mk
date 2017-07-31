LOCAL_PATH := $(call my-dir)

mips_disassembler_TBLGEN_TABLES39 := \
  MipsGenDisassemblerTables.inc \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_disassembler_SRC_FILES39 := \
  MipsDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLL39MipsDisassembler

LOCAL_SRC_FILES := $(mips_disassembler_SRC_FILES39)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES39 := $(mips_disassembler_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLL39MipsDisassembler
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(mips_disassembler_SRC_FILES39)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES39 := $(mips_disassembler_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
