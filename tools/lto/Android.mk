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

LLVM_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLL39Linker \
  libLL39ipo \
  libLL39DebugInfoDWARF \
  libLL39DebugInfoPDB \
  libLL39IRReader \
  libLL39BitWriter \
  libLL39BitReader \
  libLL39ARMCodeGen \
  libLL39ARMAsmParser \
  libLL39ARMAsmPrinter \
  libLL39DebugInfoCodeView \
  libLL39ARMInfo \
  libLL39ARMDesc \
  libLL39ARMDisassembler \
  libLL39MipsCodeGen \
  libLL39MipsInfo \
  libLL39MipsDesc \
  libLL39MipsAsmParser \
  libLL39MipsAsmPrinter \
  libLL39MipsDisassembler \
  libLL39X86CodeGen \
  libLL39X86Info \
  libLL39X86Desc \
  libLL39X86AsmParser \
  libLL39X86AsmPrinter \
  libLL39X86Utils \
  libLL39X86Disassembler \
  libLL39AArch64CodeGen \
  libLL39AArch64Info \
  libLL39AArch64Desc \
  libLL39AArch64AsmParser \
  libLL39AArch64AsmPrinter \
  libLL39AArch64Utils \
  libLL39AArch64Disassembler \
  libLL39ExecutionEngine \
  libLL39RuntimeDyld \
  libLL39MCJIT \
  libLL39OrcJIT \
  libLL39GlobalISel \
  libLL39AsmPrinter \
  libLL39SelectionDAG \
  libLL39CodeGen \
  libLL39Object \
  libLL39ScalarOpts \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39TransformObjCARC \
  libLL39TransformUtils \
  libLL39Vectorize \
  libLL39Analysis \
  libLL39Target \
  libLL39MCDisassembler \
  libLL39MC \
  libLL39MCParser \
  libLL39Core \
  libLL39AsmParser \
  libLL39Option \
  libLL39LTO \
  libLL39Support \
  libLL39ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
