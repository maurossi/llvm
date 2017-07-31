LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM39IRReader \
  libLLVM39BitReader \
  libLLVM39BitWriter \
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
  libLLVM39GlobalISel \
  libLLVM39AsmPrinter \
  libLLVM39DebugInfoCodeView \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39TransformObjCARC \
  libLLVM39Vectorize \
  libLLVM39ScalarOpts \
  libLLVM39Passes \
  libLLVM39ipo \
  libLLVM39Linker \
  libLLVM39InstCombine \
  libLLVM39Instrumentation \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Object \
  libLLVM39ProfileData \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39Support \
  libLLVM39MCDisassembler \

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

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
