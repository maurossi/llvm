LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM60_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM60ARMCodeGen \
  libLLVM60ARMAsmParser \
  libLLVM60ARMInfo \
  libLLVM60ARMDesc \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMDisassembler \
  libLLVM60AArch64CodeGen \
  libLLVM60AArch64Info \
  libLLVM60AArch64AsmParser \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils \
  libLLVM60AArch64Disassembler \
  libLLVM60MipsCodeGen \
  libLLVM60MipsInfo \
  libLLVM60MipsAsmParser \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmPrinter \
  libLLVM60MipsDisassembler \
  libLLVM60X86CodeGen \
  libLLVM60X86Info \
  libLLVM60X86Desc \
  libLLVM60X86AsmParser \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils \
  libLLVM60X86Disassembler \
  libLLVM60X86CodeGen \
  libLLVM60AsmPrinter \
  libLLVM60SelectionDAG \
  libLLVM60CodeGen \
  libLLVM60DebugInfoDWARF \
  libLLVM60Instrumentation \
  libLLVM60MCParser \
  libLLVM60MCDisassembler \
  libLLVM60Object \
  libLLVM60BitReader \
  libLLVM60ScalarOpts \
  libLLVM60TransformUtils \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60Core \
  libLLVM60MC \
  libLLVM60Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
