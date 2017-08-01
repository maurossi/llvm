LOCAL_PATH:= $(call my-dir)

debuginfo_dwarf_SRC_FILES := \
  DWARFAbbreviationDeclaration.cpp \
  DWARFAcceleratorTable.cpp \
  DWARFCompileUnit.cpp \
  DWARFContext.cpp \
  DWARFDataExtractor.cpp \
  DWARFDebugAbbrev.cpp \
  DWARFDebugArangeSet.cpp \
  DWARFDebugAranges.cpp \
  DWARFDebugFrame.cpp \
  DWARFDebugInfoEntry.cpp \
  DWARFDebugLine.cpp \
  DWARFDebugLoc.cpp \
  DWARFDebugMacro.cpp \
  DWARFDebugPubTable.cpp \
  DWARFDebugRangeList.cpp \
  DWARFDie.cpp \
  DWARFFormValue.cpp \
  DWARFGdbIndex.cpp \
  DWARFTypeUnit.cpp \
  DWARFUnitIndex.cpp \
  DWARFUnit.cpp \
  DWARFVerifier.cpp \
  SyntaxHighlighting.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_dwarf_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoDWARF

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_dwarf_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoDWARF

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
