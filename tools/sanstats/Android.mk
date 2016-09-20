LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sanstats command line tool
#===---------------------------------------------------------------===

llvm_sanstats_SRC_FILES := \
  sanstats.cpp

llvm_sanstats_STATIC_LIBRARIES := \
  libLLVMSymbolize \
  libLLVMDebugInfoDWARF \
  libLLVMDebugInfoPDB \
  libLLVMDebugInfoCodeView \
  libLLVMObject \
  libLLVMBitReader \
  libLLVMCore \
  libLLVMMCParser \
  libLLVMMC \
  libLLVMSupport

include $(CLEAR_VARS)

LOCAL_MODULE := sanstats
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_sanstats_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sanstats_STATIC_LIBRARIES)

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
