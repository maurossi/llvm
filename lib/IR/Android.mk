LOCAL_PATH:= $(call my-dir)

vmcore_TBLGEN_TABLES39 := AttributesCompatFunc.inc
vmcore_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES39)
TBLGEN_TABLES39 := $(vmcore_TBLGEN_TABLES39)

LOCAL_MODULE:= libLLVM39Core

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES39)
TBLGEN_TABLES39 := $(vmcore_TBLGEN_TABLES39)

LOCAL_MODULE:= libLLVM39Core
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := $(call local-generated-sources-dir)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
