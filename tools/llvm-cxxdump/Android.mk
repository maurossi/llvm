LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM60_ROOT_PATH)/llvm.mk

llvm_cxxdump_SRC_FILES := \
  Error.cpp \
  llvm-cxxdump.cpp

llvm_cxxdump_STATIC_LIBRARIES := \
  libLLVM60ARMAsmParser \
  libLLVM60ARMInfo \
  libLLVM60ARMDesc \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMDisassembler \
  libLLVM60AArch64Info \
  libLLVM60AArch64AsmParser \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils \
  libLLVM60AArch64Disassembler \
  libLLVM60MipsInfo \
  libLLVM60MipsAsmParser \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmPrinter \
  libLLVM60MipsDisassembler \
  libLLVM60X86Info \
  libLLVM60X86Desc \
  libLLVM60X86AsmParser \
  libLLVM60X86CodeGen \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils \
  libLLVM60X86Disassembler \
  libLLVM60AsmPrinter \
  libLLVM60CodeGen \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60Object \
  libLLVM60MCParser \
  libLLVM60MC \
  libLLVM60MCDisassembler \
  libLLVM60BitReader \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Support \


include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cxxdump
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_cxxdump_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_cxxdump_STATIC_LIBRARIES)

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
