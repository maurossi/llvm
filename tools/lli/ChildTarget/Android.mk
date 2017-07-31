LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../../../


#===---------------------------------------------------------------===
# lli-child-target command line tool
#===---------------------------------------------------------------===

lli_child_target_SRC_FILES39 := \
  ChildTarget.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := lli-child-target
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(lli_child_target_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := \
  libLL39OrcJIT \
  libLL39RuntimeDyld \
  libLL39Object \
  libLL39BitReader \
  libLL39MC \
  libLL39MCParser \
  libLL39Core \
  libLL39Support

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
