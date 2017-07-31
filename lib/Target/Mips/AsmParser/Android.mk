LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libLLVM39MipsAsmParser (common)
#===---------------------------------------------------------------===

mips_asm_parser_SRC_FILES39 := \
  MipsAsmParser.cpp

mips_asm_parser_C_INCLUDES := $(LOCAL_PATH)/..

mips_asm_parser_TBLGEN_TABLES39 := \
  MipsGenAsmMatcher.inc \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_asm_parser_TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libLLVM39MipsAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLLVM39MipsAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES39)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES39 := $(mips_asm_parser_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libLLVM39MipsAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLLVM39MipsAsmParser
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES39)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES39 := $(mips_asm_parser_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
