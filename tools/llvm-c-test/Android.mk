LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-c-test command line tool
#===---------------------------------------------------------------===

llvm_c_test_SRC_FILES := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))
llvm_c_test_SRC_FILES += $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.c)))

llvm_c_test_STATIC_LIBRARIES := \
  libLL39BitReader \
  libLL39ARMCodeGen \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMAsmPrinter \
  libLL39ARMDisassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39AsmPrinter \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39GlobalISel \
  libLL39ProfileData \
  libLL39Instrumentation \
  libLL39ScalarOpts \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39MC \
  libLL39Object \
  libLL39MCParser \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \
  libLL39MCDisassembler \

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
