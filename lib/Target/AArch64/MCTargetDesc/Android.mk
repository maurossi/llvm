LOCAL_PATH := $(call my-dir)

aarch64_mc_desc_TBLGEN_TABLES39 := \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenMCCodeEmitter.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenSystemOperands.inc \

aarch64_mc_desc_SRC_FILES39 := \
  AArch64AsmBackend.cpp \
  AArch64ELFObjectWriter.cpp \
  AArch64ELFStreamer.cpp \
  AArch64MachObjectWriter.cpp \
  AArch64MCAsmInfo.cpp \
  AArch64MCCodeEmitter.cpp \
  AArch64MCExpr.cpp \
  AArch64MCTargetDesc.cpp \
  AArch64TargetStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)


LOCAL_MODULE:= libLL39AArch64Desc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(aarch64_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(aarch64_mc_desc_TBLGEN_TABLES39)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE:= libLL39AArch64Desc

LOCAL_SRC_FILES := $(aarch64_mc_desc_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR39 := $(LOCAL_PATH)/..
TBLGEN_TABLES39 := $(aarch64_mc_desc_TBLGEN_TABLES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
