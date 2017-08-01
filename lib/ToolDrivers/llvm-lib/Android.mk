LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES50 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES50 := $(LibDriver_TBLGEN_TABLES50)

LOCAL_MODULE:= libLLVM50LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES50 := $(LibDriver_TBLGEN_TABLES50)

LOCAL_MODULE:= libLLVM50LibDriver

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
