LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM70IRReader \
  libLLVM70BitReader \
  libLLVM70BitWriter \
  libLLVM70ARMCodeGen \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMDisassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70TransformObjCARC \
  libLLVM70Vectorize \
  libLLVM70ScalarOpts \
  libLLVM70Passes \
  libLLVM70ipo \
  libLLVM70Linker \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70Object \
  libLLVM70ProfileData \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70Support \
  libLLVM70MCDisassembler \

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

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM70_HOST_BUILD_MK)
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

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
