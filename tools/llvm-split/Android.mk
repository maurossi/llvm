LOCAL_PATH:= $(call my-dir)

llvm_split_SRC_FILES39 := \
  llvm-split.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-split
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_split_SRC_FILES39)
LOCAL_LDLIBS += -lm
LOCAL_LDLIBS_windows := -limagehlp -lversion
LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := \
  libLL39IRReader \
  libLL39BitReader \
  libLL39BitWriter \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Core \
  libLL39AsmParser \
  libLL39Support

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)
