LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM70_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMAsmParser \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMDisassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsAsmParser \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70X86CodeGen \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70DebugInfoDWARF \
  libLLVM70Instrumentation \
  libLLVM70MCParser \
  libLLVM70MCDisassembler \
  libLLVM70Object \
  libLLVM70BitReader \
  libLLVM70ScalarOpts \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70Core \
  libLLVM70MC \
  libLLVM70Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
