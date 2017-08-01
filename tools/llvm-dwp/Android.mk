LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM50DebugInfoDWARF \
  libLLVM50Object \
  libLLVM50BitReader \
  libLLVM50ARMCodeGen \
  libLLVM50ARMAsmParser \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMDisassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmParser \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmParser \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50ExecutionEngine \
  libLLVM50RuntimeDyld \
  libLLVM50MCJIT \
  libLLVM50OrcJIT \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50Object \
  libLLVM50ScalarOpts \
  libLLVM50InstCombine \
  libLLVM50Instrumentation \
  libLLVM50TransformObjCARC \
  libLLVM50TransformUtils \
  libLLVM50Vectorize \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50MCDisassembler \
  libLLVM50MC \
  libLLVM50MCParser \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50LTO \
  libLLVM50Support \
  libLLVM50ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
