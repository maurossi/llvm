LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# opt command line tool
#===---------------------------------------------------------------===

llvm_opt_SRC_FILES := \
  AnalysisWrappers.cpp \
  BreakpointPrinter.cpp \
  GraphPrinters.cpp \
  NewPMDriver.cpp \
  PassPrinters.cpp \
  PrintSCC.cpp \
  opt.cpp \

llvm_opt_STATIC_LIBRARIES := \
  libLLVM60IRReader \
  libLLVM60BitReader \
  libLLVM60BitWriter \
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
  libLLVM60TransformObjCARC \
  libLLVM60Vectorize \
  libLLVM60ScalarOpts \
  libLLVM60Passes \
  libLLVM60ipo \
  libLLVM60Linker \
  libLLVM60InstCombine \
  libLLVM60Instrumentation \
  libLLVM60TransformUtils \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60MC \
  libLLVM60MCParser \
  libLLVM60Object \
  libLLVM60ProfileData \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Option \
  libLLVM60Support \
  libLLVM60MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
