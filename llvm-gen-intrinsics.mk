# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD39 := $(LLVM39_ROOT_PATH)/include/llvm/IR/Intrinsics.td

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,Intrinsics.gen)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD39) | $(LLVM39_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out39,intrinsic)
else
	$(call transform-device-td-to-out39,intrinsic)
endif
$(call include-depfile39, $(GENFILE).d, $(GENFILE))
