LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-c-test command line tool
#===---------------------------------------------------------------===

llvm_c_test_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))
llvm_c_test_SRC_FILES39 += $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.c)))

llvm_c_test_STATIC_LIBRARIES := \
  libLLVM39BitReader \
  libLLVM39ARMCodeGen \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMDisassembler \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39AsmPrinter \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39GlobalISel \
  libLLVM39ProfileData \
  libLLVM39Instrumentation \
  libLLVM39ScalarOpts \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39MC \
  libLLVM39Object \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39Support \
  libLLVM39MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-c-test
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_c_test_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_c_test_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
