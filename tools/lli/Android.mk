LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# lli command line tool
#===---------------------------------------------------------------===

lli_SRC_FILES39 := \
  lli.cpp \
  OrcLazyJIT.cpp \

lli_STATIC_LIBRARIES := \
  libLL39IRReader \
  libLL39BitReader \
  libLL39ARMCodeGen \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMAsmPrinter \
  libLL39ARMAsmParser \
  libLL39ARMDisassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmPrinter \
  libLL39AArch64AsmParser \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \
  libLL39MipsAsmParser \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmPrinter \
  libLL39X86AsmParser \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39AsmPrinter \
  libLL39GlobalISel \
  libLL39DebugInfoCodeView \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39ProfileData \
  libLL39Instrumentation \
  libLL39Linker \
  libLL39Interpreter \
  libLL39ScalarOpts \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39MC \
  libLL39MCJIT \
  libLL39OrcJIT \
  libLL39ExecutionEngine \
  libLL39RuntimeDyld \
  libLL39MCParser \
  libLL39Object \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \
  libLL39MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := lli
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(lli_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(lli_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
