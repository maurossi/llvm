LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM80IRReader \
  libLLVM80ARMCodeGen \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMDisassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80Symbolize \
  libLLVM80DebugInfoDWARF \
  libLLVM80DebugInfoPDB \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80TransformObjCARC \
  libLLVM80Vectorize \
  libLLVM80ScalarOpts \
  libLLVM80Passes \
  libLLVM80ipo \
  libLLVM80Linker \
  libLLVM80InstCombine \
  libLLVM80Instrumentation \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80Object \
  libLLVM80BitReader \
  libLLVM80BitWriter \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80ProfileData \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80Support \
  libLLVM80MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
