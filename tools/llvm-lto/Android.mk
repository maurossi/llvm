LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-lto command line tool
#===---------------------------------------------------------------===

llvm_lto_SRC_FILES := \
  llvm-lto.cpp

llvm_lto_STATIC_LIBRARIES := \
  libLL39ARMCodeGen \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMAsmPrinter \
  libLL39ARMAsmParser \
  libLL39ARMDisassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64AsmParser \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Desc \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \
  libLL39MipsAsmParser \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmPrinter \
  libLL39X86AsmParser \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39AsmPrinter \
  libLL39SelectionDAG \
  libLL39LTO \
  libLL39CodeGen \
  libLL39GlobalISel \
  libLL39DebugInfoCodeView \
  libLL39Target \
  libLL39BitReader \
  libLL39BitWriter \
  libLL39Linker \
  libLL39ipo \
  libLL39IRReader \
  libLL39TransformObjCARC \
  libLL39ScalarOpts \
  libLL39InstCombine \
  libLL39Vectorize \
  libLL39Instrumentation \
  libLL39TransformUtils \
  libLL39ProfileData \
  libLL39Analysis \
  libLL39MC \
  libLL39MCParser \
  libLL39MCDisassembler \
  libLL39Object \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-lto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
