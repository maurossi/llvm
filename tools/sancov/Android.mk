LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM70IRReader \
  libLLVM70ARMCodeGen \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMDisassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70Symbolize \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70TransformObjCARC \
  libLLVM70Vectorize \
  libLLVM70ScalarOpts \
  libLLVM70Passes \
  libLLVM70ipo \
  libLLVM70Linker \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70Object \
  libLLVM70BitReader \
  libLLVM70BitWriter \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70ProfileData \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70Support \
  libLLVM70MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
