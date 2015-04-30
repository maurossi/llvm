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
	AMDGPUGenAsmWriter.inc

AMDGPU_codegen_SRC_FILES := \
	AMDILCFGStructurizer.cpp \
	AMDGPUAsmPrinter.cpp \
	AMDGPUFrameLowering.cpp \
	AMDGPUISelDAGToDAG.cpp \
	AMDGPUMCInstLower.cpp \
	AMDGPUMachineFunction.cpp \
	AMDGPUSubtarget.cpp \
	AMDGPUTargetMachine.cpp \
	AMDGPUTargetTransformInfo.cpp \
	AMDGPUISelLowering.cpp \
	AMDGPUInstrInfo.cpp \
	AMDGPURegisterInfo.cpp \
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
	SIFixSGPRCopies.cpp \
	SIInsertWaits.cpp \
	SIInstrInfo.cpp \
	SIISelLowering.cpp \
	SILowerControlFlow.cpp \
	SIMachineFunctionInfo.cpp \
	SIRegisterInfo.cpp

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
include $(BUILD_STATIC_LIBRARY)
endif
