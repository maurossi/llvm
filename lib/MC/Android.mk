LOCAL_PATH:= $(call my-dir)

mc_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(mc_SRC_FILES39)

LOCAL_MODULE:= libLLVM39MC

LOCAL_MODULE_HOST_OS := darwin linux windows


include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(mc_SRC_FILES39)

LOCAL_MODULE:= libLLVM39MC

include $(LLVM39_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
