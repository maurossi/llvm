LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM70DebugInfoDWARF \
  libLLVM70Object \
  libLLVM70BitReader \
  libLLVM70ARMCodeGen \
  libLLVM70ARMAsmParser \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMDisassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmParser \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70ExecutionEngine \
  libLLVM70RuntimeDyld \
  libLLVM70MCJIT \
  libLLVM70OrcJIT \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70Object \
  libLLVM70ScalarOpts \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70TransformObjCARC \
  libLLVM70TransformUtils \
  libLLVM70Vectorize \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70MCDisassembler \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70LTO \
  libLLVM70Support \
  libLLVM70ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
