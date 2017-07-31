LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES39 := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES39 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES39)
TBLGEN_TABLES39 := $(LibDriver_TBLGEN_TABLES39)

LOCAL_MODULE:= libLL39LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES39)
TBLGEN_TABLES39 := $(LibDriver_TBLGEN_TABLES39)

LOCAL_MODULE:= libLL39LibDriver

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
