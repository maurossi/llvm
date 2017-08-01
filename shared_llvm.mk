LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM50Linker \
  libLLVM50ipo \
  libLLVM50DebugInfoDWARF \
  libLLVM50DebugInfoPDB \
  libLLVM50Symbolize \
  libLLVM50DebugInfoMSF \
  libLLVM50DebugInfoCodeView \
  libLLVM50IRReader \
  libLLVM50BitWriter \
  libLLVM50BitReader \
  libLLVM50GlobalISel

llvm_arm_static_libraries := \
  libLLVM50ARMCodeGen \
  libLLVM50ARMAsmParser \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMDisassembler

llvm_x86_static_libraries := \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmParser \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM50AMDGPUCodeGen \
  libLLVM50AMDGPUInfo \
  libLLVM50AMDGPUDesc \
  libLLVM50AMDGPUAsmParser \
  libLLVM50AMDGPUAsmPrinter \
  libLLVM50AMDGPUUtils
endif

llvm_mips_static_libraries := \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmParser \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50Object \
  libLLVM50ScalarOpts \
  libLLVM50InstCombine \
  libLLVM50Instrumentation \
  libLLVM50TransformObjCARC \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50MCDisassembler \
  libLLVM50MC \
  libLLVM50MCParser \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50Support \
  libLLVM50Vectorize \
  libLLVM50ProfileData \
  libLLVM50LibDriver \
  libLLVM50BinaryFormat

llvm_host_static_libraries := \
  libLLVM50ExecutionEngine \
  libLLVM50RuntimeDyld \
  libLLVM50MCJIT \
  libLLVM50OrcJIT

llvm_device_static_libraries := \
  libLLVM50ExecutionEngine \
  libLLVM50RuntimeDyld \
  libLLVM50MCJIT

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM50

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

LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lole32
LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

# Use prebuilts for linux and darwin unless
# FORCE_BUILD_LLVM_COMPONENTS is true
ifneq (true,$(FORCE_BUILD_LLVM_COMPONENTS))
LOCAL_MODULE_HOST_OS := windows
else
LOCAL_MODULE_HOST_OS := darwin linux windows
endif

include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM50

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

include $(LLVM_DEVICE_BUILD_MK)
include $(BUILD_SHARED_LIBRARY)

endif
