LOCAL_PATH := $(call my-dir)

LLVM60_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# bugpoint command line tool
#===---------------------------------------------------------------===

bugpoint_SRC_FILES := \
  BugDriver.cpp       \
  CrashDebugger.cpp   \
  ExecutionDriver.cpp \
  ExtractFunction.cpp \
  FindBugs.cpp        \
  Miscompilation.cpp  \
  OptimizerDriver.cpp \
  ToolRunner.cpp      \
  bugpoint.cpp        \

bugpoint_STATIC_LIBRARIES := \
  libLLVM60BitWriter \
  libLLVM60CodeGen \
  libLLVM60ipo \
  libLLVM60IRReader \
  libLLVM60BitReader \
  libLLVM60AsmParser \
  libLLVM60InstCombine \
  libLLVM60Instrumentation \
  libLLVM60Linker \
  libLLVM60TransformObjCARC \
  libLLVM60Object \
  libLLVM60ScalarOpts \
  libLLVM60TransformUtils \
  libLLVM60Analysis \
  libLLVM60Target \
  libLLVM60Core \
  libLLVM60MC \
  libLLVM60MCParser \
  libLLVM60ProfileData \
  libLLVM60Vectorize \
  libLLVM60Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM60_ROOT_PATH)/llvm.mk
include $(LLVM60_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
