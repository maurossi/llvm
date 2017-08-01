LOCAL_PATH := $(call my-dir)

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM50MipsAsmParser \
  libLLVM50MipsInfo \
  libLLVM50MipsCodeGen \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM50X86Info \
  libLLVM50X86AsmParser \
  libLLVM50X86CodeGen \
  libLLVM50X86Disassembler \
  libLLVM50X86Desc \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM50ARMCodeGen \
  libLLVM50ARMDisassembler \
  libLLVM50ARMAsmParser \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMDesc \
  libLLVM50ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM50AsmPrinter \
  libLLVM50IRReader \
  libLLVM50AsmParser \
  libLLVM50BitReader \
  libLLVM50BitWriter \
  libLLVM50SelectionDAG \
  libLLVM50InstCombine \
  libLLVM50CodeGen \
  libLLVM50Instrumentation \
  libLLVM50Object \
  libLLVM50ipo \
  libLLVM50Linker \
  libLLVM50MCDisassembler \
  libLLVM50MC \
  libLLVM50MIRParser \
  libLLVM50MCParser \
  libLLVM50ScalarOpts \
  libLLVM50TransformUtils \
  libLLVM50Vectorize \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50Core \
  libLLVM50Support \
  libLLVM50Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM50AArch64Info \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Disassembler \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils



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

include $(LLVM50_ROOT_PATH)/llvm.mk
include $(LLVM50_HOST_BUILD_MK)
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

include $(LLVM50_ROOT_PATH)/llvm.mk
include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
