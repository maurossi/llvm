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

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM70_ROOT_PATH)/llvm.mk

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
  libLLVM70Linker \
  libLLVM70ipo \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
  libLLVM70IRReader \
  libLLVM70BitWriter \
  libLLVM70BitReader \
  libLLVM70ARMCodeGen \
  libLLVM70ARMAsmParser \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMDisassembler \
  libLLVM70MipsCodeGen \
  libLLVM70MipsInfo \
  libLLVM70MipsDesc \
  libLLVM70MipsAsmParser \
  libLLVM70MipsAsmPrinter \
  libLLVM70MipsDisassembler \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler \
  libLLVM70ExecutionEngine \
  libLLVM70RuntimeDyld \
  libLLVM70MCJIT \
  libLLVM70OrcJIT \
  libLLVM70AsmPrinter \
  libLLVM70SelectionDAG \
  libLLVM70CodeGen \
  libLLVM70Object \
  libLLVM70ScalarOpts \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70TransformObjCARC \
  libLLVM70TransformUtils \
  libLLVM70Vectorize \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70MCDisassembler \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70Core \
  libLLVM70AsmParser \
  libLLVM70Option \
  libLLVM70LTO \
  libLLVM70Support \
  libLLVM70ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
