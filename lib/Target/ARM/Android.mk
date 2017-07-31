LOCAL_PATH := $(call my-dir)

arm_codegen_TBLGEN_TABLES39 := \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenCodeEmitter.inc \
  ARMGenMCCodeEmitter.inc \
  ARMGenMCPseudoLowering.inc \
  ARMGenAsmWriter.inc \
  ARMGenAsmMatcher.inc \
  ARMGenDAGISel.inc \
  ARMGenFastISel.inc \
  ARMGenCallingConv.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenDisassemblerTables.inc

arm_codegen_SRC_FILES39 := \
  A15SDOptimizer.cpp \
  ARMAsmPrinter.cpp \
  ARMBaseInstrInfo.cpp \
  ARMBaseRegisterInfo.cpp \
  ARMConstantIslandPass.cpp \
  ARMConstantPoolValue.cpp \
  ARMExpandPseudoInsts.cpp \
  ARMFastISel.cpp \
  ARMFrameLowering.cpp \
  ARMHazardRecognizer.cpp \
  ARMISelDAGToDAG.cpp \
  ARMISelLowering.cpp \
  ARMInstrInfo.cpp \
  ARMLoadStoreOptimizer.cpp \
  ARMMCInstLower.cpp \
  ARMMachineFunctionInfo.cpp \
  ARMOptimizeBarriersPass.cpp \
  ARMRegisterInfo.cpp \
  ARMSelectionDAGInfo.cpp \
  ARMSubtarget.cpp \
  ARMTargetMachine.cpp \
  ARMTargetObjectFile.cpp \
  ARMTargetTransformInfo.cpp \
  MLxExpansionPass.cpp \
  Thumb1FrameLowering.cpp \
  Thumb1InstrInfo.cpp \
  ThumbRegisterInfo.cpp \
  Thumb2ITBlockPass.cpp \
  Thumb2InstrInfo.cpp \
  Thumb2SizeReduction.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

# b/31559947, b/31938382 clang-tidy segmentation fault.
LOCAL_TIDY_CHECKS := -clang-analyzer-*,-readability-*

LOCAL_MODULE:= libLL39ARMCodeGen
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES39 := $(arm_codegen_TBLGEN_TABLES39)

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

# b/31559947, b/31938382 clang-tidy segmentation fault.
LOCAL_TIDY_CHECKS := -clang-analyzer-*,-readability-*

LOCAL_MODULE:= libLL39ARMCodeGen

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES39)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES39 := $(arm_codegen_TBLGEN_TABLES39)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_TBLGEN_RULES_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
