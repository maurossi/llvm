LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-diff command line tool
#===---------------------------------------------------------------===

llvm_diff_SRC_FILES39 := \
  llvm-diff.cpp        \
  DiffConsumer.cpp     \
  DifferenceEngine.cpp \
  DiffLog.cpp          \

llvm_diff_STATIC_LIBRARIES := \
  libLL39IRReader             \
  libLL39BitReader            \
  libLL39AsmParser            \
  libLL39Core                 \
  libLL39Support              \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-diff
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_diff_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_diff_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
