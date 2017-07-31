LOCAL_PATH := $(call my-dir)

x86_mc_desc_TBLGEN_TABLES39 := \
  X86GenRegisterInfo.inc \
  X86GenInstrInfo.inc \
  X86GenSubtargetInfo.inc

x86_mc_desc_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLLVM39X86Desc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(x86_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(x86_mc_desc_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)


LOCAL_MODULE:= libLLVM39X86Desc

LOCAL_SRC_FILES := $(x86_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(x86_mc_desc_TBLGEN_TABLES39)
TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
