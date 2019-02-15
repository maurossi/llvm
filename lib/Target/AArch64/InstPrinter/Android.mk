LOCAL_PATH := $(call my-dir)

aarch64_asm_printer_TBLGEN_TABLES80 := \
  AArch64GenAsmWriter.inc \
  AArch64GenAsmWriter1.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenSystemOperands.inc

aarch64_asm_printer_SRC_FILES := \
  AArch64InstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

TBLGEN_TABLES80 := $(aarch64_asm_printer_TBLGEN_TABLES80)

TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_asm_printer_SRC_FILES)

LOCAL_MODULE:= libLLVM80AArch64AsmPrinter

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/..

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

TBLGEN_TABLES80 := $(aarch64_asm_printer_TBLGEN_TABLES80)

TBLGEN_TD_DIR80 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_asm_printer_SRC_FILES)

LOCAL_C_INCLUDES+= \
    $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM80AArch64AsmPrinter

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

