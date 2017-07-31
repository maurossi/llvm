LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-mc command line tool
#===---------------------------------------------------------------===

llvm_mc_SRC_FILES39 := \
  llvm-mc.cpp \
  Disassembler.cpp

llvm_mc_STATIC_LIBRARIES := \
  libLLVM39ARMAsmParser \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMDisassembler \
  libLLVM39AArch64Info \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39MipsInfo \
  libLLVM39MipsAsmParser \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmParser \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39X86CodeGen \
  libLLVM39AsmPrinter \
  libLLVM39CodeGen \
  libLLVM39TransformUtils \
  libLLVM39Target \
  libLLVM39Analysis \
  libLLVM39MC \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Support \
  libLLVM39MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-mc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_mc_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_mc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
