LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES80 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES80 := $(LibDriver_TBLGEN_TABLES80)

LOCAL_MODULE:= libLLVM80LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES80 := $(LibDriver_TBLGEN_TABLES80)

LOCAL_MODULE:= libLLVM80LibDriver

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
