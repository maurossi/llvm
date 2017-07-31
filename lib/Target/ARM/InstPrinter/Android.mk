LOCAL_PATH := $(call my-dir)

arm_asm_printer_TBLGEN_TABLES39 := \
  ARMGenAsmWriter.inc \
  ARMGenRegisterInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenInstrInfo.inc

arm_asm_printer_SRC_FILES39 := \
  ARMInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_asm_printer_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES39)

LOCAL_MODULE:= libLL39ARMAsmPrinter

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/..

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

TBLGEN_TABLES39 := $(arm_asm_printer_TBLGEN_TABLES39)

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES39)

LOCAL_C_INCLUDES+= \
    $(LOCAL_PATH)/..

LOCAL_MODULE:= libLL39ARMAsmPrinter

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

