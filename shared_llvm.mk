LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM80Linker \
  libLLVM80ipo \
  libLLVM80DebugInfoDWARF \
  libLLVM80DebugInfoPDB \
  libLLVM80Symbolize \
  libLLVM80DebugInfoMSF \
  libLLVM80DebugInfoCodeView \
  libLLVM80Demangle \
  libLLVM80IRReader \
  libLLVM80BitWriter \
  libLLVM80BitReader \
  libLLVM80GlobalISel

llvm_arm_static_libraries := \
  libLLVM80ARMCodeGen \
  libLLVM80ARMAsmParser \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMDisassembler \
  libLLVM80ARMUtils

llvm_x86_static_libraries := \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmParser \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM80AMDGPUCodeGen \
  libLLVM80AMDGPUInfo \
  libLLVM80AMDGPUDesc \
  libLLVM80AMDGPUAsmParser \
  libLLVM80AMDGPUAsmPrinter \
  libLLVM80AMDGPUUtils
endif

llvm_mips_static_libraries := \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmParser \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80Object \
  libLLVM80ScalarOpts \
  libLLVM80AggressiveInstCombine \
  libLLVM80InstCombine \
  libLLVM80Instrumentation \
  libLLVM80TransformObjCARC \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80MCDisassembler \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80Support \
  libLLVM80Vectorize \
  libLLVM80ProfileData \
  libLLVM80LibDriver \
  libLLVM80BinaryFormat \
  libLLVM80Coroutines

llvm_host_static_libraries := \
  libLLVM80ExecutionEngine \
  libLLVM80RuntimeDyld \
  libLLVM80MCJIT \
  libLLVM80OrcJIT

llvm_device_static_libraries := \
  libLLVM80ExecutionEngine \
  libLLVM80RuntimeDyld \
  libLLVM80MCJIT

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM80

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
LOCAL_MODULE_HOST_OS := linux
else
LOCAL_MODULE_HOST_OS := linux
endif

include $(LLVM80_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM80_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM80

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

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/device/include \
  $(call local-generated-sources-dir)

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
