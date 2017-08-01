LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM60_ROOT_PATH)/llvm.mk

verify_uselistorder_SRC_FILES := \
  verify-uselistorder.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := verify-uselistorder
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(verify_uselistorder_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM60AsmParser \
  libLLVM60BitReader \
  libLLVM60BitWriter \
  libLLVM60Core \
  libLLVM60IRReader \
  libLLVM60Support

include $(LLVM60_HOST_BUILD_MK)
include $(LLVM60_GEN_ATTRIBUTES_MK)
include $(LLVM60_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
