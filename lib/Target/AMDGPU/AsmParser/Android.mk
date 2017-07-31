LOCAL_PATH := $(call my-dir)

amdgpu_asm_parser_SRC_FILES39 := \
  AMDGPUAsmParser.cpp

amdgpu_asm_parser_TBLGEN_TABLES39 := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc

amdgpu_asm_parser_TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

amdgpu_asm_parser_C_INCLUDES :=	$(LOCAL_PATH)/..

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES39)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES39 := $(amdgpu_asm_parser_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(amdgpu_asm_parser_TBLGEN_TD_DIR39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLLVM39AMDGPUAsmParser
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES39)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES39 := $(amdgpu_asm_parser_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(amdgpu_asm_parser_TBLGEN_TD_DIR39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
