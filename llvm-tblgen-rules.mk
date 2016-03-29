###########################################################
## Commands for running tblgen to compile a td file
##########################################################
define transform-td-to-out
$(if $(LOCAL_IS_HOST_MODULE),	\
	$(call transform-host-td-to-out,$(1)),	\
	$(call transform-device-td-to-out,$(1)))
endef

# $(1): an output file
# $(2): an input .td file
# $(3): a parameter passed to transform-td-to-out
# You must call this with $(eval).
define define-tblgen-rule
$(1): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(1): $(2) $(LLVM_TBLGEN)
	$$(call transform-td-to-out,$(3))
$$(call include-depfile, $(1).d, $(1))
endef

###########################################################
## TableGen: Compile .td files to .inc.
###########################################################

# Set LOCAL_MODULE_CLASS to STATIC_LIBRARIES default (require
# for macro local-generated-sources-dir)
ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

ifneq ($(strip $(TBLGEN_TABLES)),)

generated_sources := $(call local-generated-sources-dir)
tblgen_gen_tables := $(addprefix $(generated_sources)/,$(TBLGEN_TABLES))
LOCAL_GENERATED_SOURCES += $(tblgen_gen_tables)

tblgen_source_dir := $(LOCAL_PATH)
ifneq ($(TBLGEN_TD_DIR),)
tblgen_source_dir := $(TBLGEN_TD_DIR)
endif

#
# The directory and the .td directory is not the same.
#
ifeq ($(tblgen_source_dir),$(LLVM_ROOT_PATH)/lib/Target/ARM/MCTargetDesc)
$(eval $(call define-tblgen-rule, $(generated_sources)/ARMGenRegisterInfo.inc, \
    $(tblgen_source_dir)/../ARM.td,register-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/ARMGenInstrInfo.inc, \
    $(tblgen_source_dir)/../ARM.td,instr-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/ARMGenSubtargetInfo.inc, \
    $(tblgen_source_dir)/../ARM.td,subtarget))
endif

ifeq ($(tblgen_source_dir),$(LLVM_ROOT_PATH)/lib/Target/X86/MCTargetDesc)
$(eval $(call define-tblgen-rule, $(generated_sources)/X86GenRegisterInfo.inc, \
    $(tblgen_source_dir)/../X86.td,register-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/X86GenInstrInfo.inc, \
    $(tblgen_source_dir)/../X86.td,instr-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/X86GenSubtargetInfo.inc, \
    $(tblgen_source_dir)/../X86.td,subtarget))
endif

ifeq ($(tblgen_source_dir),$(LLVM_ROOT_PATH)/lib/Target/Mips/MCTargetDesc)
$(eval $(call define-tblgen-rule, $(generated_sources)/MipsGenRegisterInfo.inc, \
    $(tblgen_source_dir)/../Mips.td,register-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/MipsGenInstrInfo.inc, \
    $(tblgen_source_dir)/../Mips.td,instr-info))
$(eval $(call define-tblgen-rule, $(generated_sources)/MipsGenSubtargetInfo.inc, \
    $(tblgen_source_dir)/../Mips.td,subtarget))
endif


genfile := $(filter $(generated_sources)/%GenRegisterInfo.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenRegisterInfo.inc=$(tblgen_source_dir)/%.td),register-info))
endif

genfile := $(filter $(generated_sources)/%GenInstrInfo.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenInstrInfo.inc=$(tblgen_source_dir)/%.td),instr-info))
endif

genfile := $(filter $(generated_sources)/%GenAsmWriter.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenAsmWriter.inc=$(tblgen_source_dir)/%.td),asm-writer))
endif

genfile := $(filter $(generated_sources)/%GenAsmWriter1.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenAsmWriter1.inc=$(tblgen_source_dir)/%.td),asm-writer -asmwriternum=1))
endif

genfile := $(filter $(generated_sources)/%GenAsmMatcher.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenAsmMatcher.inc=$(tblgen_source_dir)/%.td),asm-matcher))
endif

# TODO(srhines): Is this needed
genfile := $(filter $(generated_sources)/%GenCodeEmitter.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenCodeEmitter.inc=$(tblgen_source_dir)/%.td),emitter))
endif

genfile := $(filter $(generated_sources)/%GenMCCodeEmitter.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenMCCodeEmitter.inc=$(tblgen_source_dir)/%.td),emitter))
endif

genfile := $(filter $(generated_sources)/%GenMCPseudoLowering.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenMCPseudoLowering.inc=$(tblgen_source_dir)/%.td),pseudo-lowering))
endif

genfile := $(filter $(generated_sources)/%GenDAGISel.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenDAGISel.inc=$(tblgen_source_dir)/%.td),dag-isel))
endif

genfile := $(filter $(generated_sources)/%GenDisassemblerTables.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenDisassemblerTables.inc=$(tblgen_source_dir)/%.td),disassembler))
endif

genfile := $(filter $(generated_sources)/%GenEDInfo.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenEDInfo.inc=$(tblgen_source_dir)/%.td),enhanced-disassembly-info))
endif

genfile := $(filter $(generated_sources)/%GenFastISel.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenFastISel.inc=$(tblgen_source_dir)/%.td),fast-isel))
endif

genfile := $(filter $(generated_sources)/%GenSubtargetInfo.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenSubtargetInfo.inc=$(tblgen_source_dir)/%.td),subtarget))
endif

genfile := $(filter $(generated_sources)/%GenCallingConv.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenCallingConv.inc=$(tblgen_source_dir)/%.td),callingconv))
endif

genfile := $(filter $(generated_sources)/%GenIntrinsics.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/%GenIntrinsics.inc=$(tblgen_source_dir)/%.td),tgt_intrinsics))
endif

genfile := $(filter $(generated_sources)/ARMGenDecoderTables.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/ARMGenDecoderTables.inc=$(tblgen_source_dir)/ARM.td),arm-decoder))
endif

genfile := $(filter $(generated_sources)/Options.inc,$(tblgen_gen_tables))
ifneq ($(genfile),)
$(eval $(call define-tblgen-rule, $(genfile), \
    $(genfile:$(generated_sources)/Options.inc=$(tblgen_source_dir)/Options.td),opt-parser-defs))
endif

# Reset local variables
genfile :=

endif
