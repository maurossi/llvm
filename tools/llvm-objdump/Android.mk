LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-objdump command line tool
#===---------------------------------------------------------------===

llvm_objdump_SRC_FILES := \
  llvm-objdump.cpp \
  COFFDump.cpp \
  ELFDump.cpp \
  MachODump.cpp \

llvm_objdump_STATIC_LIBRARIES := \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
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
  libLLVM70TransformUtils \
  libLLVM70Target \
  libLLVM70Analysis \
  libLLVM70Object \
  libLLVM70MCParser \
  libLLVM70MC \
  libLLVM70MCDisassembler \
  libLLVM70BitReader \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-objdump
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_objdump_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_objdump_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
