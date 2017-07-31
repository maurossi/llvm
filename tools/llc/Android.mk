LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES39 := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM39MipsAsmParser \
  libLLVM39MipsInfo \
  libLLVM39MipsCodeGen \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM39X86Info \
  libLLVM39X86AsmParser \
  libLLVM39X86CodeGen \
  libLLVM39X86Disassembler \
  libLLVM39X86Desc \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM39ARMCodeGen \
  libLLVM39ARMDisassembler \
  libLLVM39ARMAsmParser \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMDesc \
  libLLVM39ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM39GlobalISel \
  libLLVM39AsmPrinter \
  libLLVM39DebugInfoCodeView \
  libLLVM39IRReader \
  libLLVM39AsmParser \
  libLLVM39BitReader \
  libLLVM39BitWriter \
  libLLVM39SelectionDAG \
  libLLVM39InstCombine \
  libLLVM39CodeGen \
  libLLVM39ProfileData \
  libLLVM39Instrumentation \
  libLLVM39Object \
  libLLVM39ipo \
  libLLVM39Linker \
  libLLVM39MCDisassembler \
  libLLVM39MC \
  libLLVM39MIRParser \
  libLLVM39MCParser \
  libLLVM39ScalarOpts \
  libLLVM39TransformUtils \
  libLLVM39Vectorize \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39Core \
  libLLVM39Support \
  libLLVM39Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM39AArch64Info \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Disassembler \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils



#===---------------------------------------------------------------===
# llc command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := \
  $(llvm_llc_arm_STATIC_LIBRARIES) \
  $(llvm_llc_mips_STATIC_LIBRARIES) \
  $(llvm_llc_x86_STATIC_LIBRARIES) \
  $(llvm_llc_aarch64_STATIC_LIBRARIES) \
  $(llvm_llc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM39_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llc build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES39)
LOCAL_C_INCLUDES += external/llvm39/include

LOCAL_STATIC_LIBRARIES_arm += $(llvm_llc_arm_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips64 += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86_64 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_aarch64_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_arm_STATIC_LIBRARIES)

LOCAL_STATIC_LIBRARIES += $(llvm_llc_STATIC_LIBRARIES)

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
