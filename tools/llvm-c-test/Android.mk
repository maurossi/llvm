LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM60BitReader \
  libLLVM60ARMCodeGen \
  libLLVM60ARMInfo \
  libLLVM60ARMDesc \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMDisassembler \
  libLLVM60AArch64CodeGen \
  libLLVM60AArch64Info \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils \
  libLLVM60AArch64Disassembler \
  libLLVM60MipsCodeGen \
  libLLVM60MipsInfo \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmPrinter \
  libLLVM60MipsDisassembler \
  libLLVM60X86CodeGen \
  libLLVM60X86Info \
  libLLVM60X86Desc \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils \
  libLLVM60X86Disassembler \
  libLLVM60AsmPrinter \
  libLLVM60SelectionDAG \
  libLLVM60CodeGen \
  libLLVM60Instrumentation \
  libLLVM60ScalarOpts \
  libLLVM60TransformUtils \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60MC \
  libLLVM60Object \
  libLLVM60MCParser \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Option \
  libLLVM60Support \
  libLLVM60MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-c-test
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_c_test_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_c_test_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
