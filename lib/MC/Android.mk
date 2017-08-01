LOCAL_PATH:= $(call my-dir)

mc_SRC_FILES := \
  ConstantPools.cpp \
  ELFObjectWriter.cpp \
  MCAsmBackend.cpp \
  MCAsmInfo.cpp \
  MCAsmInfoCOFF.cpp \
  MCAsmInfoDarwin.cpp \
  MCAsmInfoELF.cpp \
  MCAsmInfoWasm.cpp \
  MCAsmStreamer.cpp \
  MCAssembler.cpp \
  MCCodeEmitter.cpp \
  MCCodeView.cpp \
  MCContext.cpp \
  MCDwarf.cpp \
  MCELFObjectTargetWriter.cpp \
  MCELFStreamer.cpp \
  MCExpr.cpp \
  MCFragment.cpp \
  MCInst.cpp \
  MCInstPrinter.cpp \
  MCInstrAnalysis.cpp \
  MCInstrDesc.cpp \
  MCLabel.cpp \
  MCLinkerOptimizationHint.cpp \
  MCMachOStreamer.cpp \
  MCMachObjectTargetWriter.cpp \
  MCNullStreamer.cpp \
  MCObjectFileInfo.cpp \
  MCObjectStreamer.cpp \
  MCObjectWriter.cpp \
  MCRegisterInfo.cpp \
  MCSchedule.cpp \
  MCSection.cpp \
  MCSectionCOFF.cpp \
  MCSectionELF.cpp \
  MCSectionMachO.cpp \
  MCSectionWasm.cpp \
  MCStreamer.cpp \
  MCSubtargetInfo.cpp \
  MCSymbol.cpp \
  MCSymbolELF.cpp \
  MCTargetOptions.cpp \
  MCValue.cpp \
  MCWasmObjectTargetWriter.cpp \
  MCWasmStreamer.cpp \
  MCWin64EH.cpp \
  MCWinCOFFStreamer.cpp \
  MCWinEH.cpp \
  MachObjectWriter.cpp \
  StringTableBuilder.cpp \
  SubtargetFeature.cpp \
  WasmObjectWriter.cpp \
  WinCOFFObjectWriter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(mc_SRC_FILES)

LOCAL_MODULE:= libLLVM70MC

LOCAL_MODULE_HOST_OS := darwin linux windows


include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(mc_SRC_FILES)

LOCAL_MODULE:= libLLVM70MC

include $(LLVM_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
