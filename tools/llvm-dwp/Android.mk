LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

llvm_dwp_STATIC_LIBRARIES := \
  libLL39DebugInfoDWARF \
  libLL39Object \
  libLL39BitReader \
  libLL39ARMCodeGen \
  libLL39ARMAsmParser \
  libLL39ARMAsmPrinter \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMDisassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmParser \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmParser \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmParser \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39ExecutionEngine \
  libLL39RuntimeDyld \
  libLL39MCJIT \
  libLL39OrcJIT \
  libLL39GlobalISel \
  libLL39AsmPrinter \
  libLL39DebugInfoCodeView \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39Object \
  libLL39ScalarOpts \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39TransformObjCARC \
  libLL39TransformUtils \
  libLL39Vectorize \
  libLL39Analysis \
  libLL39Target \
  libLL39MCDisassembler \
  libLL39MC \
  libLL39MCParser \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39LTO \
  libLL39Support \
  libLL39ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
