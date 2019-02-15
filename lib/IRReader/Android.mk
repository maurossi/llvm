LOCAL_PATH:= $(call my-dir)

irreader_SRC_FILES := \
  IRReader.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(irreader_SRC_FILES)

LOCAL_MODULE:= libLLVM80IRReader

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(irreader_SRC_FILES)

LOCAL_MODULE:= libLLVM80IRReader

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
