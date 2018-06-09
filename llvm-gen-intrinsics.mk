# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD70 := $(LLVM70_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTD70S := $(wildcard $(dir $(INTRINSICTD70))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,Intrinsics.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD70) $(INTRINSICTD70S) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out70,intrinsic)
else
	$(call transform-device-td-to-out70,intrinsic)
endif
