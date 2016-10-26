LOCAL_PATH := $(call my-dir)

objectyaml_SRC_FILES := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVMObjectYAML
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(objectyaml_SRC_FILES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVMObjectYAML

LOCAL_SRC_FILES := $(objectyaml_SRC_FILES)

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
