LOCAL_PATH := $(call my-dir)

AMDGPU_codegen_TBLGEN_TABLES := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenDAGISel.inc  \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenCallingConv.inc \
  AMDGPUGenIntrinsics.inc \
  AMDGPUGenDFAPacketizer.inc \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenAsmMatcher.inc

AMDGPU_codegen_SRC_FILES := \
  AMDILCFGStructurizer.cpp \
  AMDGPUAlwaysInlinePass.cpp \
  AMDGPUAsmPrinter.cpp \
  AMDGPUFrameLowering.cpp \
  AMDGPUIntrinsicInfo.cpp \
  AMDGPUISelDAGToDAG.cpp \
  AMDGPUMCInstLower.cpp \
  AMDGPUMachineFunction.cpp \
  AMDGPUSubtarget.cpp \
  AMDGPUTargetMachine.cpp \
  AMDGPUTargetTransformInfo.cpp \
  AMDGPUISelLowering.cpp \
  AMDGPUInstrInfo.cpp \
  AMDGPUPromoteAlloca.cpp \
  AMDGPURegisterInfo.cpp \
  R600ClauseMergePass.cpp \
  R600ControlFlowFinalizer.cpp \
  R600EmitClauseMarkers.cpp \
  R600ExpandSpecialInstrs.cpp \
  R600InstrInfo.cpp \
  R600ISelLowering.cpp \
  R600MachineFunctionInfo.cpp \
  R600MachineScheduler.cpp \
  R600OptimizeVectorRegisters.cpp \
  R600Packetizer.cpp \
  R600RegisterInfo.cpp \
  R600TextureIntrinsicsReplacer.cpp \
  SIAnnotateControlFlow.cpp \
  SIFixControlFlowLiveIntervals.cpp \
  SIFixSGPRCopies.cpp \
  SIFixSGPRLiveRanges.cpp \
  SIFoldOperands.cpp \
  SIInsertWaits.cpp \
  SIInstrInfo.cpp \
  SIISelLowering.cpp \
  SILoadStoreOptimizer.cpp \
  SILowerControlFlow.cpp \
  SILowerI1Copies.cpp \
  SIMachineFunctionInfo.cpp \
  SIPrepareScratchRegs.cpp \
  SIRegisterInfo.cpp \
  SIShrinkInstructions.cpp \
  SITypeRewriter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_codegen_TBLGEN_TABLES)

LOCAL_SRC_FILES := $(AMDGPU_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVMR600CodeGen

LOCAL_MODULE_TAGS := optional

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_INTRINSICS_MK)

LOCAL_EXPORT_C_INCLUDE_DIRS := $(generated_sources)

include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(AMDGPU_codegen_TBLGEN_TABLES)

LOCAL_SRC_FILES := $(AMDGPU_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVMR600CodeGen

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_INTRINSICS_MK)

LOCAL_EXPORT_C_INCLUDE_DIRS := $(generated_sources)

include $(BUILD_STATIC_LIBRARY)
endif
