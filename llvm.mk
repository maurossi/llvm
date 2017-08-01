ifeq ($(LLVM50_ROOT_PATH),)
$(error Must set variable LLVM50_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS := $(LLVM50_ROOT_PATH)/clear_tblgen_vars.mk
LLVM50_HOST_BUILD_MK := $(LLVM50_ROOT_PATH)/llvm-host-build.mk
LLVM50_DEVICE_BUILD_MK := $(LLVM50_ROOT_PATH)/llvm-device-build.mk
LLVM50_GEN_ATTRIBUTES_MK := $(LLVM50_ROOT_PATH)/llvm-gen-attributes.mk
LLVM50_GEN_INTRINSICS_MK := $(LLVM50_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM50_TBLGEN_RULES_MK := $(LLVM50_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
