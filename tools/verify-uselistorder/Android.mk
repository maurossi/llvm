LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

verify_uselistorder_SRC_FILES39 := \
  verify-uselistorder.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := verify-uselistorder
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(verify_uselistorder_SRC_FILES39)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLL39AsmParser \
  libLL39BitReader \
  libLL39BitWriter \
  libLL39Analysis \
  libLL39Core \
  libLL39IRReader \
  libLL39Support

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
