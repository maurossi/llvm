LOCAL_PATH:= $(call my-dir)

transforms_objcarc_SRC_FILES39 := \
  DependencyAnalysis.cpp \
  ObjCARCAPElim.cpp \
  ObjCARCContract.cpp \
  ObjCARC.cpp \
  ObjCARCExpand.cpp \
  ObjCARCOpts.cpp \
  PtrState.cpp \
  ProvenanceAnalysis.cpp \
  ProvenanceAnalysisEvaluator.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_objcarc_SRC_FILES39)
LOCAL_MODULE:= libLLVM39TransformObjCARC

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_objcarc_SRC_FILES39)
LOCAL_MODULE:= libLLVM39TransformObjCARC

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
