LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-c-test command line tool
#===---------------------------------------------------------------===

llvm_c_test_SRC_FILES := \
  calc.c                 \
  disassemble.c          \
  helpers.c              \
  include-all.c          \
  main.c                 \
  metadata.c             \
  module.c               \
  object.c               \
  targets.c              \

llvm_c_test_STATIC_LIBRARIES := \
  libLLVM80BitReader \
  libLLVM80ARMCodeGen \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMDisassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80Instrumentation \
  libLLVM80ScalarOpts \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80MC \
  libLLVM80Object \
  libLLVM80MCParser \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80Support \
  libLLVM80MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-c-test
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_c_test_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_c_test_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
