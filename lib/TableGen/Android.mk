LOCAL_PATH:= $(call my-dir)
LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

libtablegen_SRC_FILES39 := \
  Error.cpp \
  Main.cpp \
  Record.cpp \
  SetTheory.cpp \
  StringMatcher.cpp \
  TableGenBackend.cpp \
  TGLexer.cpp \
  TGParser.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_SRC_FILES := $(libtablegen_SRC_FILES39)
LOCAL_MODULE:= libLLVM39TableGen

LOCAL_MODULE_TAGS := optional

REQUIRES_EH := 1
REQUIRES_RTTI := 1

include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

## For the device
## =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := $(libtablegen_SRC_FILES39)
#LOCAL_MODULE:= libLLVM39TableGen
#
#LOCAL_MODULE_TAGS := optional
#
#include $(LLVM39_DEVICE_BUILD_MK)
#include $(BUILD_STATIC_LIBRARY)
endif
