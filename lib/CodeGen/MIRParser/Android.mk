LOCAL_PATH:= $(call my-dir)

MIRParser_SRC_FILES39 := \
  MILexer.cpp \
  MIParser.cpp \
  MIRParser.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(MIRParser_SRC_FILES39)

LOCAL_MODULE:= libLLVM39MIRParser

LOCAL_MODULE_TAGS := optional

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(MIRParser_SRC_FILES39)

LOCAL_MODULE:= libLLVM39MIRParser

LOCAL_MODULE_TAGS := optional

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
