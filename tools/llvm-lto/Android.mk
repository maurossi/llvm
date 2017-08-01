LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-lto command line tool
#===---------------------------------------------------------------===

llvm_lto_SRC_FILES := \
  llvm-lto.cpp

llvm_lto_STATIC_LIBRARIES := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMAsmParser \
  libLLVM70ARMDisassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Desc \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsAsmParser \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmPrinter \
  libLLVM70X86AsmParser \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70LTO \
  libLLVM70CodeGen \
  libLLVM70Target \
  libLLVM70BitReader \
  libLLVM70BitWriter \
  libLLVM70Linker \
  libLLVM70ipo \
  libLLVM70IRReader \
  libLLVM70TransformObjCARC \
  libLLVM70ScalarOpts \
  libLLVM70InstCombine \
  libLLVM70Vectorize \
  libLLVM70Instrumentation \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70MCDisassembler \
  libLLVM70Object \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-lto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
