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

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM50_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM50Linker \
  libLLVM50ipo \
  libLLVM50DebugInfoDWARF \
  libLLVM50DebugInfoPDB \
  libLLVM50IRReader \
  libLLVM50BitWriter \
  libLLVM50BitReader \
  libLLVM50ARMCodeGen \
  libLLVM50ARMAsmParser \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMDisassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmParser \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86CodeGen \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmParser \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50ExecutionEngine \
  libLLVM50RuntimeDyld \
  libLLVM50MCJIT \
  libLLVM50OrcJIT \
  libLLVM50AsmPrinter \
  libLLVM50SelectionDAG \
  libLLVM50CodeGen \
  libLLVM50Object \
  libLLVM50ScalarOpts \
  libLLVM50InstCombine \
  libLLVM50Instrumentation \
  libLLVM50TransformObjCARC \
  libLLVM50TransformUtils \
  libLLVM50Vectorize \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50MCDisassembler \
  libLLVM50MC \
  libLLVM50MCParser \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Option \
  libLLVM50LTO \
  libLLVM50Support \
  libLLVM50ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
