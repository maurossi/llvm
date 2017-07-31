LOCAL_PATH := $(call my-dir)
LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM39_ROOT_PATH)/llvm.mk

tablegen_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_MODULE := llvm39-tblgen
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(tablegen_SRC_FILES39)

REQUIRES_EH := 1
REQUIRES_RTTI := 1

LOCAL_STATIC_LIBRARIES := \
  libLLVM39TableGen \
  libLLVM39Support

LOCAL_LDLIBS += -lm
LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lversion
LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
