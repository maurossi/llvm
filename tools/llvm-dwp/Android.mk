LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM60DebugInfoDWARF \
  libLLVM60Object \
  libLLVM60BitReader \
  libLLVM60ARMCodeGen \
  libLLVM60ARMAsmParser \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMInfo \
  libLLVM60ARMDesc \
  libLLVM60ARMDisassembler \
  libLLVM60MipsCodeGen \
  libLLVM60MipsInfo \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmParser \
  libLLVM60MipsAsmPrinter \
  libLLVM60MipsDisassembler \
  libLLVM60X86CodeGen \
  libLLVM60X86Info \
  libLLVM60X86Desc \
  libLLVM60X86AsmParser \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils \
  libLLVM60X86Disassembler \
  libLLVM60AArch64CodeGen \
  libLLVM60AArch64Info \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmParser \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils \
  libLLVM60AArch64Disassembler \
  libLLVM60ExecutionEngine \
  libLLVM60RuntimeDyld \
  libLLVM60MCJIT \
  libLLVM60OrcJIT \
  libLLVM60AsmPrinter \
  libLLVM60SelectionDAG \
  libLLVM60CodeGen \
  libLLVM60Object \
  libLLVM60ScalarOpts \
  libLLVM60InstCombine \
  libLLVM60Instrumentation \
  libLLVM60TransformObjCARC \
  libLLVM60TransformUtils \
  libLLVM60Vectorize \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60MCDisassembler \
  libLLVM60MC \
  libLLVM60MCParser \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Option \
  libLLVM60LTO \
  libLLVM60Support \
  libLLVM60ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
