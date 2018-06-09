LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM70Linker \
  libLLVM70ipo \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
  libLLVM70Symbolize \
  libLLVM70DebugInfoMSF \
  libLLVM70DebugInfoCodeView \
  libLLVM70Demangle \
  libLLVM70IRReader \
  libLLVM70BitWriter \
  libLLVM70BitReader \
  libLLVM70GlobalISel

llvm_arm_static_libraries := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMAsmParser \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMDisassembler \
  libLLVM70ARMUtils

llvm_x86_static_libraries := \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM70AMDGPUCodeGen \
  libLLVM70AMDGPUInfo \
  libLLVM70AMDGPUDesc \
  libLLVM70AMDGPUAsmParser \
  libLLVM70AMDGPUAsmPrinter \
  libLLVM70AMDGPUUtils
endif

llvm_mips_static_libraries := \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmParser \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70Object \
  libLLVM70ScalarOpts \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70TransformObjCARC \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70MCDisassembler \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70Support \
  libLLVM70Vectorize \
  libLLVM70ProfileData \
  libLLVM70LibDriver \
  libLLVM70BinaryFormat

llvm_host_static_libraries := \
  libLLVM70ExecutionEngine \
  libLLVM70RuntimeDyld \
  libLLVM70MCJIT \
  libLLVM70OrcJIT

llvm_device_static_libraries := \
  libLLVM70ExecutionEngine \
  libLLVM70RuntimeDyld \
  libLLVM70MCJIT

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM70

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

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM70_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70

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

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
