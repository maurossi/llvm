LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM60MipsAsmParser \
  libLLVM60MipsInfo \
  libLLVM60MipsCodeGen \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM60X86Info \
  libLLVM60X86AsmParser \
  libLLVM60X86CodeGen \
  libLLVM60X86Disassembler \
  libLLVM60X86Desc \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM60ARMCodeGen \
  libLLVM60ARMDisassembler \
  libLLVM60ARMAsmParser \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMDesc \
  libLLVM60ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM60AsmPrinter \
  libLLVM60IRReader \
  libLLVM60AsmParser \
  libLLVM60BitReader \
  libLLVM60BitWriter \
  libLLVM60SelectionDAG \
  libLLVM60InstCombine \
  libLLVM60CodeGen \
  libLLVM60Instrumentation \
  libLLVM60Object \
  libLLVM60ipo \
  libLLVM60Linker \
  libLLVM60MCDisassembler \
  libLLVM60MC \
  libLLVM60MIRParser \
  libLLVM60MCParser \
  libLLVM60ScalarOpts \
  libLLVM60TransformUtils \
  libLLVM60Vectorize \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60Core \
  libLLVM60Support \
  libLLVM60Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM60AArch64Info \
  libLLVM60AArch64AsmParser \
  libLLVM60AArch64CodeGen \
  libLLVM60AArch64Disassembler \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils



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

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_HOST_BUILD_MK)
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

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
