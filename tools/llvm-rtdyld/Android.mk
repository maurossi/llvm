LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-rtdyld command line tool
#===---------------------------------------------------------------===

llvm_rtdyld_SRC_FILES := \
  llvm-rtdyld.cpp

llvm_rtdyld_STATIC_LIBRARIES := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMAsmParser \
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
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsAsmParser \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmPrinter \
  libLLVM70X86AsmParser \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
  libLLVM70ExecutionEngine    \
  libLLVM70CodeGen \
  libLLVM70Object             \
  libLLVM70MC                 \
  libLLVM70MCParser           \
  libLLVM70RuntimeDyld        \
  libLLVM70BitReader          \
  libLLVM70Core               \
  libLLVM70Support            \
  libLLVM70MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-rtdyld
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_rtdyld_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_rtdyld_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
