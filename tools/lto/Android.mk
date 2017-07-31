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

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM39_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS39)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES39 := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES39)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM39Linker \
  libLLVM39ipo \
  libLLVM39DebugInfoDWARF \
  libLLVM39DebugInfoPDB \
  libLLVM39IRReader \
  libLLVM39BitWriter \
  libLLVM39BitReader \
  libLLVM39ARMCodeGen \
  libLLVM39ARMAsmParser \
  libLLVM39ARMAsmPrinter \
  libLLVM39DebugInfoCodeView \
  libLLVM39ARMInfo \
  libLLVM39ARMDesc \
  libLLVM39ARMDisassembler \
  libLLVM39MipsCodeGen \
  libLLVM39MipsInfo \
  libLLVM39MipsDesc \
  libLLVM39MipsAsmParser \
  libLLVM39MipsAsmPrinter \
  libLLVM39MipsDisassembler \
  libLLVM39X86CodeGen \
  libLLVM39X86Info \
  libLLVM39X86Desc \
  libLLVM39X86AsmParser \
  libLLVM39X86AsmPrinter \
  libLLVM39X86Utils \
  libLLVM39X86Disassembler \
  libLLVM39AArch64CodeGen \
  libLLVM39AArch64Info \
  libLLVM39AArch64Desc \
  libLLVM39AArch64AsmParser \
  libLLVM39AArch64AsmPrinter \
  libLLVM39AArch64Utils \
  libLLVM39AArch64Disassembler \
  libLLVM39ExecutionEngine \
  libLLVM39RuntimeDyld \
  libLLVM39MCJIT \
  libLLVM39OrcJIT \
  libLLVM39GlobalISel \
  libLLVM39AsmPrinter \
  libLLVM39SelectionDAG \
  libLLVM39CodeGen \
  libLLVM39Object \
  libLLVM39ScalarOpts \
  libLLVM39InstCombine \
  libLLVM39Instrumentation \
  libLLVM39TransformObjCARC \
  libLLVM39TransformUtils \
  libLLVM39Vectorize \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39MCDisassembler \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39AsmParser \
  libLLVM39Option \
  libLLVM39LTO \
  libLLVM39Support \
  libLLVM39ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
