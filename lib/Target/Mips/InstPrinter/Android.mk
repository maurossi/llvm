LOCAL_PATH := $(call my-dir)

mips_asm_printer_TBLGEN_TABLES39 := \
  MipsGenAsmWriter.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc \
  MipsGenInstrInfo.inc

mips_asm_printer_SRC_FILES39 := \
  MipsInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLL39MipsAsmPrinter
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES39 := $(mips_asm_printer_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES39)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLL39MipsAsmPrinter

TBLGEN_TABLES39 := $(mips_asm_printer_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_asm_printer_SRC_FILES39)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
