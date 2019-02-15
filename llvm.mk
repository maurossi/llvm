ifeq ($(LLVM80_ROOT_PATH),)
$(error Must set variable LLVM80_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS80 := $(LLVM80_ROOT_PATH)/clear_tblgen_vars.mk
LLVM80_HOST_BUILD_MK := $(LLVM80_ROOT_PATH)/llvm-host-build.mk
LLVM80_DEVICE_BUILD_MK := $(LLVM80_ROOT_PATH)/llvm-device-build.mk
LLVM80_GEN_ATTRIBUTES_MK := $(LLVM80_ROOT_PATH)/llvm-gen-attributes.mk
LLVM80_GEN_INTRINSICS_MK := $(LLVM80_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM80_TBLGEN_RULES_MK := $(LLVM80_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM80_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
