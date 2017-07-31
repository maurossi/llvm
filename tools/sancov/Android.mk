LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES39 := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLL39IRReader \
  libLL39ARMCodeGen \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMAsmPrinter \
  libLL39ARMDisassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39Symbolize \
  libLL39DebugInfoDWARF \
  libLL39DebugInfoPDB \
  libLL39DebugInfoCodeView \
  libLL39AsmPrinter \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39TransformObjCARC \
  libLL39Vectorize \
  libLL39ScalarOpts \
  libLL39Passes \
  libLL39ipo \
  libLL39Linker \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39Object \
  libLL39BitReader \
  libLL39BitWriter \
  libLL39MC \
  libLL39MCParser \
  libLL39ProfileData \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \
  libLL39MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
