LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES39 := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLL39ARMCodeGen \
  libLL39ARMAsmParser \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMAsmPrinter \
  libLL39ARMDisassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64AsmParser \
  libLL39AArch64Desc \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsAsmParser \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmParser \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39X86CodeGen \
  libLL39AsmPrinter \
  libLL39DebugInfoCodeView \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39ProfileData \
  libLL39GlobalISel \
  libLL39DebugInfoDWARF \
  libLL39Instrumentation \
  libLL39MCParser \
  libLL39MCDisassembler \
  libLL39Object \
  libLL39BitReader \
  libLL39ScalarOpts \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39Core \
  libLL39MC \
  libLL39Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES39)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
