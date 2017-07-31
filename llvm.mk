LLVM39_ROOT_PATH := external/llvm39

CLEAR_TBLGEN_VARS39 := $(LLVM39_ROOT_PATH)/clear_tblgen_vars.mk
LLVM39_HOST_BUILD_MK := $(LLVM39_ROOT_PATH)/llvm-host-build.mk
LLVM39_DEVICE_BUILD_MK := $(LLVM39_ROOT_PATH)/llvm-device-build.mk
LLVM39_GEN_ATTRIBUTES_MK := $(LLVM39_ROOT_PATH)/llvm-gen-attributes.mk
LLVM39_GEN_INTRINSICS_MK := $(LLVM39_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM39_TBLGEN_RULES_MK := $(LLVM39_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM39_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
