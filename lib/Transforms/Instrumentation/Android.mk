LOCAL_PATH:= $(call my-dir)

instrumentation_SRC_FILES := \
  AddressSanitizer.cpp \
  BoundsChecking.cpp \
  DataFlowSanitizer.cpp \
  GCOVProfiling.cpp \
  MemorySanitizer.cpp \
  IndirectCallPromotion.cpp \
  Instrumentation.cpp \
  InstrProfiling.cpp \
  PGOInstrumentation.cpp \
  PGOMemOPSizeOpt.cpp \
  SanitizerCoverage.cpp \
  ThreadSanitizer.cpp \
  EfficiencySanitizer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Instrumentation
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(instrumentation_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the target
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Instrumentation
LOCAL_SRC_FILES := $(instrumentation_SRC_FILES)

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
