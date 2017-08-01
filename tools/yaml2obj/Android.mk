LOCAL_PATH := $(call my-dir)

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# yaml2obj command line tool
#===---------------------------------------------------------------===

yaml2obj_SRC_FILES := \
  yaml2obj.cpp        \
  yaml2coff.cpp       \
  yaml2elf.cpp        \

yaml2obj_STATIC_LIBRARIES := \
  libLLVM50Object              \
  libLLVM50MC                  \
  libLLVM50MCParser            \
  libLLVM50BitReader           \
  libLLVM50Core                \
  libLLVM50Support             \

include $(CLEAR_VARS)

LOCAL_MODULE := yaml2obj
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(yaml2obj_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(yaml2obj_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM50_ROOT_PATH)/llvm.mk
include $(LLVM50_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
