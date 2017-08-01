LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-extract command line tool
#===---------------------------------------------------------------===

llvm_extract_SRC_FILES := \
  llvm-extract.cpp

llvm_extract_STATIC_LIBRARIES := \
  libLLVM70IRReader                \
  libLLVM70AsmParser               \
  libLLVM70Object                  \
  libLLVM70BitReader               \
  libLLVM70BitWriter               \
  libLLVM70ipo                     \
  libLLVM70TransformUtils          \
  libLLVM70Analysis                \
  libLLVM70Target                  \
  libLLVM70Core                    \
  libLLVM70Support                 \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-extract
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_extract_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_extract_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
