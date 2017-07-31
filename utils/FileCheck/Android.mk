LOCAL_PATH:= $(call my-dir)

filecheck_SRC_FILES39 := \
  FileCheck.cpp

filecheck_STATIC_LIBRARIES := \
  libLL39Support

include $(CLEAR_VARS)

LOCAL_MODULE := FileCheck
LOCAL_SRC_FILES := $(filecheck_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(filecheck_STATIC_LIBRARIES)
LOCAL_C_INCLUDES += external/llvm39/host/include
LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_CFLAGS += -D __STDC_LIMIT_MACROS -D __STDC_CONSTANT_MACROS

#REQUIRES_EH := 1
#REQUIRES_RTTI := 1

include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
