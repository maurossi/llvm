LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM70_ROOT_PATH)/llvm.mk

llvm_cxxdump_SRC_FILES := \
  Error.cpp \
  llvm-cxxdump.cpp

llvm_cxxdump_STATIC_LIBRARIES := \
  libLLVM70ARMAsmParser \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMDisassembler \
  libLLVM70AArch64Info \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70MipsInfo \
  libLLVM70MipsAsmParser \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86CodeGen \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70AsmPrinter \
  libLLVM70CodeGen \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70Object \
  libLLVM70MCParser \
  libLLVM70MC \
  libLLVM70MCDisassembler \
  libLLVM70BitReader \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Support \


include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cxxdump
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_cxxdump_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_cxxdump_STATIC_LIBRARIES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
