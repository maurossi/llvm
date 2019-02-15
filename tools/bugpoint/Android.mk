LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM80BitWriter \
  libLLVM80CodeGen \
  libLLVM80ipo \
  libLLVM80IRReader \
  libLLVM80BitReader \
  libLLVM80AsmParser \
  libLLVM80InstCombine \
  libLLVM80Instrumentation \
  libLLVM80Linker \
  libLLVM80TransformObjCARC \
  libLLVM80Object \
  libLLVM80ScalarOpts \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80Core \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80ProfileData \
  libLLVM80Vectorize \
  libLLVM80Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM80_ROOT_PATH)/llvm.mk
include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
