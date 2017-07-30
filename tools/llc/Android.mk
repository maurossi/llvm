LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLL39MipsAsmParser \
  libLL39MipsInfo \
  libLL39MipsCodeGen \
  libLL39MipsDesc \
  libLL39MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLL39X86Info \
  libLL39X86AsmParser \
  libLL39X86CodeGen \
  libLL39X86Disassembler \
  libLL39X86Desc \
  libLL39X86AsmPrinter \
  libLL39X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLL39ARMCodeGen \
  libLL39ARMDisassembler \
  libLL39ARMAsmParser \
  libLL39ARMAsmPrinter \
  libLL39ARMDesc \
  libLL39ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLL39GlobalISel \
  libLL39AsmPrinter \
  libLL39DebugInfoCodeView \
  libLL39IRReader \
  libLL39AsmParser \
  libLL39BitReader \
  libLL39BitWriter \
  libLL39SelectionDAG \
  libLL39InstCombine \
  libLL39CodeGen \
  libLL39ProfileData \
  libLL39Instrumentation \
  libLL39Object \
  libLL39ipo \
  libLL39Linker \
  libLL39MCDisassembler \
  libLL39MC \
  libLL39MIRParser \
  libLL39MCParser \
  libLL39ScalarOpts \
  libLL39TransformUtils \
  libLL39Vectorize \
  libLL39Analysis \
  libLL39Target \
  libLL39Core \
  libLL39Support \
  libLL39Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLL39AArch64Info \
  libLL39AArch64AsmParser \
  libLL39AArch64CodeGen \
  libLL39AArch64Disassembler \
  libLL39AArch64Desc \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils



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

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
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

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
