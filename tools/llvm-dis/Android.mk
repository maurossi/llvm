LOCAL_PATH:= $(call my-dir)

llvm_dis_SRC_FILES39 := \
  llvm-dis.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dis
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dis_SRC_FILES39)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM39Analysis \
  libLLVM39BitReader \
  libLLVM39Core \
  libLLVM39Support

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
