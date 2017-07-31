LOCAL_PATH:= $(call my-dir)

# No dia support
debuginfo_pdb_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

# lib/PDB/Raw is included into libLL39DebugInfoPDB instead of as a separate module
debuginfo_pdb_raw_SRC_FILES39 = $(sort $(notdir $(wildcard $(LOCAL_PATH)/Raw/*.cpp)))
debuginfo_pdb_SRC_FILES39 += $(debuginfo_pdb_raw_SRC_FILES39:%=Raw/%)

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_pdb_SRC_FILES39)

LOCAL_MODULE:= libLL39DebugInfoPDB

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_pdb_SRC_FILES39)

LOCAL_MODULE:= libLL39DebugInfoPDB

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
