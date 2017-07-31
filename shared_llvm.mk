LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM39Linker \
  libLLVM39ipo \
  libLLVM39DebugInfoDWARF \
  libLLVM39DebugInfoPDB \
  libLLVM39Symbolize \
  libLLVM39IRReader \
  libLLVM39BitWriter \
  libLLVM39BitReader

llvm_arm_static_libraries := \
  libLLVM39ARMCodeGen \
  libLLVM39ARMAsmParser \
  libLLVM39ARMAsmPrinter \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMDisassembler

llvm_x86_static_libraries := \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmParser \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM39AMDGPUCodeGen \
  libLLVM39AMDGPUInfo \
  libLLVM39AMDGPUDesc \
  libLLVM39AMDGPUAsmParser \
  libLLVM39AMDGPUAsmPrinter \
  libLLVM39AMDGPUUtils
endif

llvm_mips_static_libraries := \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmParser \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM39LTO \
  libLLVM39AsmPrinter \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39DebugInfoCodeView \
  libLLVM39Object \
  libLLVM39ScalarOpts \
  libLLVM39InstCombine \
  libLLVM39Instrumentation \
  libLLVM39TransformObjCARC \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39GlobalISel \
  libLLVM39MCDisassembler \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39Support \
  libLLVM39Vectorize \
  libLLVM39ProfileData \
  libLLVM39ProfileDataCoverage \
  libLLVM39LibDriver

llvm_host_static_libraries := \
  libLLVM39ExecutionEngine \
  libLLVM39RuntimeDyld \
  libLLVM39MCJIT \
  libLLVM39OrcJIT

llvm_device_static_libraries := \
  libLLVM39ExecutionEngine \
  libLLVM39RuntimeDyld \
  libLLVM39MCJIT

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM39

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

LOCAL_MODULE:= libLLVM39

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
