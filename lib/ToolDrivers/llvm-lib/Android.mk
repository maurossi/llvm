LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES60 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES60 := $(LibDriver_TBLGEN_TABLES60)

LOCAL_MODULE:= libLLVM60LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES60 := $(LibDriver_TBLGEN_TABLES60)

LOCAL_MODULE:= libLLVM60LibDriver

include $(LLVM60_DEVICE_BUILD_MK)
include $(LLVM60_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
