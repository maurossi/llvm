LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM50ARMCodeGen \
  libLLVM50ARMAsmParser \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsAsmParser \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmParser \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50X86CodeGen \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50DebugInfoDWARF \
  libLLVM50Instrumentation \
  libLLVM50MCParser \
  libLLVM50MCDisassembler \
  libLLVM50Object \
  libLLVM50BitReader \
  libLLVM50ScalarOpts \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50Core \
  libLLVM50MC \
  libLLVM50Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
