LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sanstats command line tool
#===---------------------------------------------------------------===

llvm_sanstats_SRC_FILES39 := \
  sanstats.cpp

llvm_sanstats_STATIC_LIBRARIES := \
  libLLVM39Symbolize \
  libLLVM39DebugInfoDWARF \
  libLLVM39DebugInfoPDB \
  libLLVM39DebugInfoCodeView \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39Core \
  libLLVM39MCParser \
  libLLVM39MC \
  libLLVM39Support

include $(CLEAR_VARS)

LOCAL_MODULE := sanstats
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_sanstats_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(llvm_sanstats_STATIC_LIBRARIES)

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
