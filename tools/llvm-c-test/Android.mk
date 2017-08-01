LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM50BitReader \
  libLLVM50ARMCodeGen \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50Instrumentation \
  libLLVM50ScalarOpts \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50MC \
  libLLVM50Object \
  libLLVM50MCParser \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50Support \
  libLLVM50MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-c-test
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_c_test_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_c_test_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
