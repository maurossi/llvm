LOCAL_PATH := $(call my-dir)

aarch64_utils_TBLGEN_TABLES39 := \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenSystemOperands.inc \

aarch64_utils_SRC_FILES39 := \
  AArch64BaseInfo.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(aarch64_utils_SRC_FILES39)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39AArch64Utils

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(aarch64_utils_TBLGEN_TABLES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(aarch64_utils_SRC_FILES39)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM39AArch64Utils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(aarch64_utils_TBLGEN_TABLES39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
