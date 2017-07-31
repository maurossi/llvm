LOCAL_PATH := $(call my-dir)

object_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLLVM39Object
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(object_SRC_FILES39)

# Our windows cross-compiler triggers a spurious uninitialized warning.
LOCAL_CFLAGS_windows := -Wno-uninitialized

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM39Object

LOCAL_SRC_FILES := $(object_SRC_FILES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
