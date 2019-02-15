# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD80 := $(LLVM80_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTD80S := $(wildcard $(dir $(INTRINSICTD80))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicEnums.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD80) $(INTRINSICTD80S) | $(LLVM80_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out80,intrinsic-enums)
else
	$(call transform-device-td-to-out80,intrinsic-enums)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicImpl.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD80) $(INTRINSICTD80S) | $(LLVM80_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out80,intrinsic-impl)
else
	$(call transform-device-td-to-out80,intrinsic-impl)
endif
