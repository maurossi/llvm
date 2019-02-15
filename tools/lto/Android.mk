#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH:= $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM80_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS80)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM80Linker \
  libLLVM80ipo \
  libLLVM80DebugInfoDWARF \
  libLLVM80DebugInfoPDB \
  libLLVM80IRReader \
  libLLVM80BitWriter \
  libLLVM80BitReader \
  libLLVM80ARMCodeGen \
  libLLVM80ARMAsmParser \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMDisassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmParser \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmParser \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80ExecutionEngine \
  libLLVM80RuntimeDyld \
  libLLVM80MCJIT \
  libLLVM80OrcJIT \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80Object \
  libLLVM80ScalarOpts \
  libLLVM80InstCombine \
  libLLVM80Instrumentation \
  libLLVM80TransformObjCARC \
  libLLVM80TransformUtils \
  libLLVM80Vectorize \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80MCDisassembler \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80Core \
  libLLVM80AsmParser \
  libLLVM80Option \
  libLLVM80LTO \
  libLLVM80Support \
  libLLVM80ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
