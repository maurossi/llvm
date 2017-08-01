LOCAL_PATH := $(call my-dir)

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM50IRReader \
  libLLVM50ARMCodeGen \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50Symbolize \
  libLLVM50DebugInfoDWARF \
  libLLVM50DebugInfoPDB \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50TransformObjCARC \
  libLLVM50Vectorize \
  libLLVM50ScalarOpts \
  libLLVM50Passes \
  libLLVM50ipo \
  libLLVM50Linker \
  libLLVM50InstCombine \
  libLLVM50Instrumentation \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50Object \
  libLLVM50BitReader \
  libLLVM50BitWriter \
  libLLVM50MC \
  libLLVM50MCParser \
  libLLVM50ProfileData \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50Support \
  libLLVM50MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM50_ROOT_PATH)/llvm.mk
include $(LLVM50_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
