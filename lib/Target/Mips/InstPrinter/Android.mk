LOCAL_PATH := $(call my-dir)

mips_asm_printer_TBLGEN_TABLES80 := \
  MipsGenAsmWriter.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc \
  MipsGenInstrInfo.inc

mips_asm_printer_SRC_FILES := \
  MipsInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE:= libLLVM80MipsAsmPrinter
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES80 := $(mips_asm_printer_TBLGEN_TABLES80)
TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

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

LOCAL_MODULE:= libLLVM80MipsAsmPrinter

TBLGEN_TABLES80 := $(mips_asm_printer_TBLGEN_TABLES80)
TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
