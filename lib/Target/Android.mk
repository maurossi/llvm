LOCAL_PATH:= $(call my-dir)

target_SRC_FILES39 := \
  Target.cpp \
  TargetIntrinsicInfo.cpp \
  TargetLoweringObjectFile.cpp \
  TargetMachine.cpp \
  TargetMachineC.cpp \
  TargetRecip.cpp \
  TargetSubtargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(target_SRC_FILES39)

LOCAL_MODULE:= libLLVM39Target

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(target_SRC_FILES39)

LOCAL_MODULE:= libLLVM39Target

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
