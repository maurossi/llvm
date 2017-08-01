LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM70MipsAsmParser \
  libLLVM70MipsInfo \
  libLLVM70MipsCodeGen \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM70X86Info \
  libLLVM70X86AsmParser \
  libLLVM70X86CodeGen \
  libLLVM70X86Disassembler \
  libLLVM70X86Desc \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMDisassembler \
  libLLVM70ARMAsmParser \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMDesc \
  libLLVM70ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM70AsmPrinter \
  libLLVM70IRReader \
  libLLVM70AsmParser \
  libLLVM70BitReader \
  libLLVM70BitWriter \
  libLLVM70SelectionDAG \
  libLLVM70InstCombine \
  libLLVM70CodeGen \
  libLLVM70Instrumentation \
  libLLVM70Object \
  libLLVM70ipo \
  libLLVM70Linker \
  libLLVM70MCDisassembler \
  libLLVM70MC \
  libLLVM70MIRParser \
  libLLVM70MCParser \
  libLLVM70ScalarOpts \
  libLLVM70TransformUtils \
  libLLVM70Vectorize \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70Core \
  libLLVM70Support \
  libLLVM70Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM70AArch64Info \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Disassembler \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils



#===---------------------------------------------------------------===
# llc command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)

LOCAL_STATIC_LIBRARIES := \
  $(llvm_llc_arm_STATIC_LIBRARIES) \
  $(llvm_llc_mips_STATIC_LIBRARIES) \
  $(llvm_llc_x86_STATIC_LIBRARIES) \
  $(llvm_llc_aarch64_STATIC_LIBRARIES) \
  $(llvm_llc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llc build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)
LOCAL_C_INCLUDES += external/llvm/include

LOCAL_STATIC_LIBRARIES_arm += $(llvm_llc_arm_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips64 += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86_64 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_aarch64_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_arm_STATIC_LIBRARIES)

LOCAL_STATIC_LIBRARIES += $(llvm_llc_STATIC_LIBRARIES)

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
