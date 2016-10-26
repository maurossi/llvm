LOCAL_PATH := $(call my-dir)

x86_codegen_TBLGEN_TABLES := \
  X86GenAsmMatcher.inc \
  X86GenAsmWriter.inc \
  X86GenAsmWriter1.inc \
  X86GenDisassemblerTables.inc \
  X86GenRegisterInfo.inc \
  X86GenInstrInfo.inc \
  X86GenDAGISel.inc \
  X86GenFastISel.inc \
  X86GenSubtargetInfo.inc \
  X86GenCallingConv.inc

x86_codegen_SRC_FILES := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

# b/31559947, b/31938382 clang-tidy segmentation fault.
LOCAL_TIDY_CHECKS := -clang-analyzer-*,-readability-*,-google-readability-*

TBLGEN_TABLES := $(x86_codegen_TBLGEN_TABLES)

LOCAL_SRC_FILES := $(x86_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVMX86CodeGen

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

# b/31559947, b/31938382 clang-tidy segmentation fault.
LOCAL_TIDY_CHECKS := -clang-analyzer-*,-readability-*,-google-readability-*

TBLGEN_TABLES := $(x86_codegen_TBLGEN_TABLES)

LOCAL_SRC_FILES := $(x86_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVMX86CodeGen

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
