LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM80DebugInfoDWARF \
  libLLVM80Object \
  libLLVM80BitReader \
  libLLVM80ARMCodeGen \
  libLLVM80ARMAsmParser \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMDisassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmParser \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmParser \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80ExecutionEngine \
  libLLVM80RuntimeDyld \
  libLLVM80MCJIT \
  libLLVM80OrcJIT \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80Object \
  libLLVM80ScalarOpts \
  libLLVM80InstCombine \
  libLLVM80Instrumentation \
  libLLVM80TransformObjCARC \
  libLLVM80TransformUtils \
  libLLVM80Vectorize \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80MCDisassembler \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80LTO \
  libLLVM80Support \
  libLLVM80ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
