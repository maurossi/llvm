LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

bugpoint_passes_SRC_FILES39 := \
  TestPasses.cpp

# BugpointPasses module for the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(bugpoint_passes_SRC_FILES39)
LOCAL_MODULE := BugpointPasses

LOCAL_MODULE_CLASS := SHARED_LIBRARIES # needed for tblgen
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
