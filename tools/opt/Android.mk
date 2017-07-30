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
  libLL39IRReader \
  libLL39BitReader \
  libLL39BitWriter \
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
  libLL39GlobalISel \
  libLL39AsmPrinter \
  libLL39DebugInfoCodeView \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39TransformObjCARC \
  libLL39Vectorize \
  libLL39ScalarOpts \
  libLL39Passes \
  libLL39ipo \
  libLL39Linker \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39MC \
  libLL39MCParser \
  libLL39Object \
  libLL39ProfileData \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \
  libLL39MCDisassembler \

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
