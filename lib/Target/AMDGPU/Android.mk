LOCAL_PATH := $(call my-dir)

amdgpu_codegen_TBLGEN_TABLES70 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenDAGISel.inc  \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenCallingConv.inc \
  AMDGPUGenIntrinsics.inc \
  AMDGPUGenDFAPacketizer.inc \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenDisassemblerTables.inc \
  AMDGPUGenMCPseudoLowering.inc

amdgpu_codegen_SRC_FILES := \
  AMDILCFGStructurizer.cpp \
  AMDGPUAliasAnalysis.cpp \
  AMDGPUAlwaysInlinePass.cpp \
  AMDGPUAnnotateKernelFeatures.cpp \
  AMDGPUAnnotateUniformValues.cpp \
  AMDGPUAsmPrinter.cpp \
  AMDGPUCodeGenPrepare.cpp \
  AMDGPUFrameLowering.cpp \
  AMDGPUTargetObjectFile.cpp \
  AMDGPUIntrinsicInfo.cpp \
  AMDGPUISelDAGToDAG.cpp \
  AMDGPULowerIntrinsics.cpp \
  AMDGPUMacroFusion.cpp \
  AMDGPUMCInstLower.cpp \
  AMDGPUMachineCFGStructurizer.cpp \
  AMDGPUMachineFunction.cpp \
  AMDGPUUnifyMetadata.cpp \
  AMDGPUOpenCLImageTypeLoweringPass.cpp \
  AMDGPUSubtarget.cpp \
  AMDGPUTargetMachine.cpp \
  AMDGPUTargetTransformInfo.cpp \
  AMDGPUISelLowering.cpp \
  AMDGPUInstrInfo.cpp \
  AMDGPUPromoteAlloca.cpp \
  AMDGPURegAsmNames.inc.cpp \
  AMDGPURegisterInfo.cpp \
  AMDGPUUnifyDivergentExitNodes.cpp \
  GCNHazardRecognizer.cpp \
  GCNSchedStrategy.cpp \
  R600ClauseMergePass.cpp \
  R600ControlFlowFinalizer.cpp \
  R600EmitClauseMarkers.cpp \
  R600ExpandSpecialInstrs.cpp \
  R600FrameLowering.cpp \
  R600InstrInfo.cpp \
  R600ISelLowering.cpp \
  R600MachineFunctionInfo.cpp \
  R600MachineScheduler.cpp \
  R600OptimizeVectorRegisters.cpp \
  R600Packetizer.cpp \
  R600RegisterInfo.cpp \
  SIAnnotateControlFlow.cpp \
  SIDebuggerInsertNops.cpp \
  SIFixControlFlowLiveIntervals.cpp \
  SIFixSGPRCopies.cpp \
  SIFixVGPRCopies.cpp \
  SIFoldOperands.cpp \
  SIFrameLowering.cpp \
  SIInsertSkips.cpp \
  SIInsertWaits.cpp \
  SIInsertWaitcnts.cpp \
  SIInstrInfo.cpp \
  SIISelLowering.cpp \
  SILoadStoreOptimizer.cpp \
  SILowerControlFlow.cpp \
  SILowerI1Copies.cpp \
  SIMachineFunctionInfo.cpp \
  SIMachineScheduler.cpp \
  SIOptimizeExecMasking.cpp \
  SIPeepholeSDWA.cpp \
  SIRegisterInfo.cpp \
  SIShrinkInstructions.cpp \
  SIWholeQuadMode.cpp \
  GCNIterativeScheduler.cpp \
  GCNMinRegStrategy.cpp \
  GCNRegPressure.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
amdgpu_codegen_TBLGEN_TABLES70 += \
  AMDGPUGenRegisterBank.inc

amdgpu_codegen_SRC_FILES += \
  AMDGPUCallLowering.cpp \
  AMDGPUInstructionSelector.cpp \
  AMDGPULegalizerInfo.cpp \
  AMDGPURegisterBankInfo.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

TBLGEN_TABLES70 := $(amdgpu_codegen_TBLGEN_TABLES70)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM70AMDGPUCodeGen

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

TBLGEN_TABLES70 := $(amdgpu_codegen_TBLGEN_TABLES70)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM70AMDGPUCodeGen

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
