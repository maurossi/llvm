LOCAL_PATH:= $(call my-dir)

# Only pull in this one file to ensure we aren't building with this
# experimental feature just yet.
globalisel_SRC_FILES39 := GlobalISel.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(globalisel_SRC_FILES39)
LOCAL_MODULE:= libLLVM39GlobalISel

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(globalisel_SRC_FILES39)
LOCAL_MODULE:= libLLVM39GlobalISel

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
