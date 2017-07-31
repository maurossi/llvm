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
  libLLVM39ARMCodeGen \
  libLLVM39ARMAsmParser \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMDisassembler \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsAsmParser \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmParser \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39X86CodeGen \
  libLLVM39AsmPrinter \
  libLLVM39DebugInfoCodeView \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39ProfileData \
  libLLVM39GlobalISel \
  libLLVM39DebugInfoDWARF \
  libLLVM39Instrumentation \
  libLLVM39MCParser \
  libLLVM39MCDisassembler \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39ScalarOpts \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39Core \
  libLLVM39MC \
  libLLVM39Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
