LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-objdump command line tool
#===---------------------------------------------------------------===

llvm_objdump_SRC_FILES := \
  llvm-objdump.cpp \
  COFFDump.cpp \
  ELFDump.cpp \
  MachODump.cpp \

llvm_objdump_STATIC_LIBRARIES := \
  libLLVM60DebugInfoDWARF \
  libLLVM60DebugInfoPDB \
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
  libLLVM60TransformUtils \
  libLLVM60Target \
  libLLVM60Analysis \
  libLLVM60Object \
  libLLVM60MCParser \
  libLLVM60MC \
  libLLVM60MCDisassembler \
  libLLVM60BitReader \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-objdump
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_objdump_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_objdump_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
