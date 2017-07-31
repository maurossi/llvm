LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# obj2yaml command line tool
#===---------------------------------------------------------------===

obj2yaml_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

obj2yaml_STATIC_LIBRARIES := \
  libLLVM39Object             \
  libLLVM39ObjectYAML         \
  libLLVM39MC                 \
  libLLVM39MCParser           \
  libLLVM39BitReader          \
  libLLVM39Core               \
  libLLVM39Support            \

include $(CLEAR_VARS)

LOCAL_MODULE := obj2yaml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(obj2yaml_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(obj2yaml_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
