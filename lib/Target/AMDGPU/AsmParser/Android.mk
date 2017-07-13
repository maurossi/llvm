LOCAL_PATH := $(call my-dir)

amdgpu_asm_parser_SRC_FILES := \
  AMDGPUAsmParser.cpp

amdgpu_asm_parser_TBLGEN_TABLES := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_asm_parser_TBLGEN_TD_DIR := $(LOCAL_PATH)/..

amdgpu_asm_parser_C_INCLUDES :=	$(LOCAL_PATH)/..

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE := libLLVMAMDGPUAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES := $(amdgpu_asm_parser_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(amdgpu_asm_parser_TBLGEN_TD_DIR)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE := libLLVMAMDGPUAsmParser
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES := $(amdgpu_asm_parser_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(amdgpu_asm_parser_TBLGEN_TD_DIR)

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
