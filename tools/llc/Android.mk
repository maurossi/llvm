LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM80MipsAsmParser \
  libLLVM80MipsInfo \
  libLLVM80MipsCodeGen \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM80X86Info \
  libLLVM80X86AsmParser \
  libLLVM80X86CodeGen \
  libLLVM80X86Disassembler \
  libLLVM80X86Desc \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM80ARMCodeGen \
  libLLVM80ARMDisassembler \
  libLLVM80ARMAsmParser \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMDesc \
  libLLVM80ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM80AsmPrinter \
  libLLVM80IRReader \
  libLLVM80AsmParser \
  libLLVM80BitReader \
  libLLVM80BitWriter \
  libLLVM80SelectionDAG \
  libLLVM80InstCombine \
  libLLVM80CodeGen \
  libLLVM80Instrumentation \
  libLLVM80Object \
  libLLVM80ipo \
  libLLVM80Linker \
  libLLVM80MCDisassembler \
  libLLVM80MC \
  libLLVM80MIRParser \
  libLLVM80MCParser \
  libLLVM80ScalarOpts \
  libLLVM80TransformUtils \
  libLLVM80Vectorize \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80Core \
  libLLVM80Support \
  libLLVM80Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM80AArch64Info \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Disassembler \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils



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

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM80_SUPPORTED_ARCH)))
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

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
