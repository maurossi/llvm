LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-lto command line tool
#===---------------------------------------------------------------===

llvm_lto_SRC_FILES := \
  llvm-lto.cpp

llvm_lto_STATIC_LIBRARIES := \
  libLLVM80ARMCodeGen \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMAsmParser \
  libLLVM80ARMDisassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Desc \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsAsmParser \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmPrinter \
  libLLVM80X86AsmParser \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80LTO \
  libLLVM80CodeGen \
  libLLVM80Target \
  libLLVM80BitReader \
  libLLVM80BitWriter \
  libLLVM80Linker \
  libLLVM80ipo \
  libLLVM80IRReader \
  libLLVM80TransformObjCARC \
  libLLVM80ScalarOpts \
  libLLVM80InstCombine \
  libLLVM80Vectorize \
  libLLVM80Instrumentation \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80MCDisassembler \
  libLLVM80Object \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-lto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
