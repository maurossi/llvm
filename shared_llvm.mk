LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLL39Linker \
  libLL39ipo \
  libLL39DebugInfoDWARF \
  libLL39DebugInfoPDB \
  libLL39Symbolize \
  libLL39IRReader \
  libLL39BitWriter \
  libLL39BitReader

llvm_arm_static_libraries := \
  libLL39ARMCodeGen \
  libLL39ARMAsmParser \
  libLL39ARMAsmPrinter \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMDisassembler

llvm_x86_static_libraries := \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmParser \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLL39AMDGPUCodeGen \
  libLL39AMDGPUInfo \
  libLL39AMDGPUDesc \
  libLL39AMDGPUAsmParser \
  libLL39AMDGPUAsmPrinter \
  libLL39AMDGPUUtils
endif

llvm_mips_static_libraries := \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmParser \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler

llvm_aarch64_static_libraries := \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmParser \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler

llvm_post_static_libraries := \
  libLL39LTO \
  libLL39AsmPrinter \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39DebugInfoCodeView \
  libLL39Object \
  libLL39ScalarOpts \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39TransformObjCARC \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39GlobalISel \
  libLL39MCDisassembler \
  libLL39MC \
  libLL39MCParser \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39Support \
  libLL39Vectorize \
  libLL39ProfileData \
  libLL39ProfileDataCoverage \
  libLL39LibDriver

llvm_host_static_libraries := \
  libLL39ExecutionEngine \
  libLL39RuntimeDyld \
  libLL39MCJIT \
  libLL39OrcJIT

llvm_device_static_libraries := \
  libLL39ExecutionEngine \
  libLL39RuntimeDyld \
  libLL39MCJIT

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLL39

LOCAL_MODULE_TAGS := optional

# Host build pulls in all ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries) \
  $(llvm_arm_static_libraries) \
  $(llvm_x86_static_libraries) \
  $(llvm_mips_static_libraries) \
  $(llvm_aarch64_static_libraries) \
  $(llvm_host_static_libraries) \
  $(llvm_post_static_libraries)

LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lole32 -lversion
LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

# Use prebuilts for linux and darwin unless
# FORCE_BUILD_LLVM_COMPONENTS is true
ifneq (true,$(FORCE_BUILD_LLVM_COMPONENTS))
LOCAL_MODULE_HOST_OS := windows
else
LOCAL_MODULE_HOST_OS := darwin linux windows
endif

include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM39_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLL39

LOCAL_MODULE_TAGS := optional

# Device build selectively pulls in ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries)

LOCAL_WHOLE_STATIC_LIBRARIES_arm += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips64 += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_arm_static_libraries)

ifeq ($(BUILD_ARM_FOR_X86),true)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_aarch64_static_libraries)
endif

LOCAL_WHOLE_STATIC_LIBRARIES += \
  $(llvm_device_static_libraries) \
  $(llvm_post_static_libraries)

include $(LLVM39_DEVICE_BUILD_MK)
include $(BUILD_SHARED_LIBRARY)

endif
