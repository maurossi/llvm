LOCAL_PATH:= $(call my-dir)

global_isel_SRC_FILES := \
      GlobalISel.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
global_isel_SRC_FILES += \
      CallLowering.cpp \
      IRTranslator.cpp \
      InstructionSelect.cpp \
      InstructionSelector.cpp \
      MachineIRBuilder.cpp \
      LegalizerHelper.cpp \
      Legalizer.cpp \
      LegalizerInfo.cpp \
      Localizer.cpp \
      RegBankSelect.cpp \
      RegisterBank.cpp \
      RegisterBankInfo.cpp \
      Utils.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(global_isel_SRC_FILES)

LOCAL_MODULE:= libLLVM70GlobalISel

LOCAL_MODULE_TAGS := optional

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(global_isel_SRC_FILES)

LOCAL_MODULE:= libLLVM70GlobalISel

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
