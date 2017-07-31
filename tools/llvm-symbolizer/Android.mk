LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

llvm_symbolizer_SRC_FILES39 := \
  llvm-symbolizer.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES39)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM39Symbolize \
  libLLVM39DebugInfoDWARF \
  libLLVM39DebugInfoPDB \
  libLLVM39DebugInfoCodeView \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39Support

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES39)
LOCAL_SHARED_LIBRARIES := libLLVM39

include $(LLVM39_DEVICE_BUILD_MK)
include $(BUILD_EXECUTABLE)
endif
