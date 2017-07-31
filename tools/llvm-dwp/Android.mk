LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM39DebugInfoDWARF \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39ARMCodeGen \
  libLLVM39ARMAsmParser \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMDisassembler \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmParser \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmParser \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39ExecutionEngine \
  libLLVM39RuntimeDyld \
  libLLVM39MCJIT \
  libLLVM39OrcJIT \
  libLLVM39GlobalISel \
  libLLVM39AsmPrinter \
  libLLVM39DebugInfoCodeView \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39Object \
  libLLVM39ScalarOpts \
  libLLVM39InstCombine \
  libLLVM39Instrumentation \
  libLLVM39TransformObjCARC \
  libLLVM39TransformUtils \
  libLLVM39Vectorize \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39MCDisassembler \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39LTO \
  libLLVM39Support \
  libLLVM39ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
