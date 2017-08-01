LOCAL_PATH := $(call my-dir)

mips_asm_printer_TBLGEN_TABLES50 := \
  MipsGenAsmWriter.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc \
  MipsGenInstrInfo.inc

mips_asm_printer_SRC_FILES := \
  MipsInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM50MipsAsmPrinter
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES50 := $(mips_asm_printer_TBLGEN_TABLES50)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM50MipsAsmPrinter

TBLGEN_TABLES50 := $(mips_asm_printer_TBLGEN_TABLES50)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
