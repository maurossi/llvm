# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD50 := $(LLVM50_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTD50S := $(wildcard $(dir $(INTRINSICTD50))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,Intrinsics.gen)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD50) $(INTRINSICTD50S) | $(LLVM50_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out50,intrinsic)
else
	$(call transform-device-td-to-out50,intrinsic)
endif
