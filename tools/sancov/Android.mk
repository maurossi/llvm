LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES39 := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM39IRReader \
  libLLVM39ARMCodeGen \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMDisassembler \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39Symbolize \
  libLLVM39DebugInfoDWARF \
  libLLVM39DebugInfoPDB \
  libLLVM39DebugInfoCodeView \
  libLLVM39AsmPrinter \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39TransformObjCARC \
  libLLVM39Vectorize \
  libLLVM39ScalarOpts \
  libLLVM39Passes \
  libLLVM39ipo \
  libLLVM39Linker \
  libLLVM39InstCombine \
  libLLVM39Instrumentation \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39BitWriter \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39ProfileData \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39Support \
  libLLVM39MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
