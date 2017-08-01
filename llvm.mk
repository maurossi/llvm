ifeq ($(LLVM70_ROOT_PATH),)
$(error Must set variable LLVM70_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS := $(LLVM70_ROOT_PATH)/clear_tblgen_vars.mk
LLVM70_HOST_BUILD_MK := $(LLVM70_ROOT_PATH)/llvm-host-build.mk
LLVM70_DEVICE_BUILD_MK := $(LLVM70_ROOT_PATH)/llvm-device-build.mk
LLVM_GEN_ATTRIBUTES_MK := $(LLVM70_ROOT_PATH)/llvm-gen-attributes.mk
LLVM_GEN_INTRINSICS_MK := $(LLVM70_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM70_TBLGEN_RULES_MK := $(LLVM70_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
