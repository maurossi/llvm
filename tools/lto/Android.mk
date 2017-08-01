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
  libLLVM60Linker \
  libLLVM60ipo \
  libLLVM60DebugInfoDWARF \
  libLLVM60DebugInfoPDB \
  libLLVM60IRReader \
  libLLVM60BitWriter \
  libLLVM60BitReader \
  libLLVM60ARMCodeGen \
  libLLVM60ARMAsmParser \
  libLLVM60ARMAsmPrinter \
  libLLVM60ARMInfo \
  libLLVM60ARMDesc \
  libLLVM60ARMDisassembler \
  libLLVM60MipsCodeGen \
  libLLVM60MipsInfo \
  libLLVM60MipsDesc \
  libLLVM60MipsAsmParser \
  libLLVM60MipsAsmPrinter \
  libLLVM60MipsDisassembler \
  libLLVM60X86CodeGen \
  libLLVM60X86Info \
  libLLVM60X86Desc \
  libLLVM60X86AsmParser \
  libLLVM60X86AsmPrinter \
  libLLVM60X86Utils \
  libLLVM60X86Disassembler \
  libLLVM60AArch64CodeGen \
  libLLVM60AArch64Info \
  libLLVM60AArch64Desc \
  libLLVM60AArch64AsmParser \
  libLLVM60AArch64AsmPrinter \
  libLLVM60AArch64Utils \
  libLLVM60AArch64Disassembler \
  libLLVM60ExecutionEngine \
  libLLVM60RuntimeDyld \
  libLLVM60MCJIT \
  libLLVM60OrcJIT \
  libLLVM60AsmPrinter \
  libLLVM60SelectionDAG \
  libLLVM60CodeGen \
  libLLVM60Object \
  libLLVM60ScalarOpts \
  libLLVM60InstCombine \
  libLLVM60Instrumentation \
  libLLVM60TransformObjCARC \
  libLLVM60TransformUtils \
  libLLVM60Vectorize \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60MCDisassembler \
  libLLVM60MC \
  libLLVM60MCParser \
  libLLVM60Core \
  libLLVM60AsmParser \
  libLLVM60Option \
  libLLVM60LTO \
  libLLVM60Support \
  libLLVM60ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
