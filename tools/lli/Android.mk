LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# lli command line tool
#===---------------------------------------------------------------===

lli_SRC_FILES := \
  lli.cpp \
  OrcLazyJIT.cpp \
  RemoteMemoryManager.cpp \
  RemoteTarget.cpp \
  RemoteTargetExternal.cpp \

lli_STATIC_LIBRARIES := \
  libLLVM50IRReader \
  libLLVM50BitReader \
  libLLVM50ARMCodeGen \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMAsmParser \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsAsmParser \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmPrinter \
  libLLVM50X86AsmParser \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50Instrumentation \
  libLLVM50Linker \
  libLLVM50Interpreter \
  libLLVM50ScalarOpts \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50MC \
  libLLVM50MCJIT \
  libLLVM50OrcJIT \
  libLLVM50ExecutionEngine \
  libLLVM50RuntimeDyld \
  libLLVM50MCParser \
  libLLVM50Object \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50Support \
  libLLVM50MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := lli
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(lli_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(lli_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
