LOCAL_PATH := $(call my-dir)

amdgpu_asm_parser_SRC_FILES := \
  AMDGPUAsmParser.cpp

amdgpu_asm_parser_TBLGEN_TABLES70 := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_asm_parser_TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

amdgpu_asm_parser_C_INCLUDES :=	$(LOCAL_PATH)/..

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE := libLLVM70AMDGPUAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES70 := $(amdgpu_asm_parser_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(amdgpu_asm_parser_TBLGEN_TD_DIR70)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE := libLLVM70AMDGPUAsmParser
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES70 := $(amdgpu_asm_parser_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(amdgpu_asm_parser_TBLGEN_TD_DIR70)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
