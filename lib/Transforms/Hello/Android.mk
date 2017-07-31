LOCAL_PATH:= $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../../..
include $(LLVM39_ROOT_PATH)/llvm.mk

transforms_hello_SRC_FILES39 := \
  Hello.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_hello_SRC_FILES39)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE:= LL39Hello

LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
