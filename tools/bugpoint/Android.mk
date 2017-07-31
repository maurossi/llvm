LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# bugpoint command line tool
#===---------------------------------------------------------------===

bugpoint_SRC_FILES39 := \
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
  libLL39BitWriter \
  libLL39CodeGen \
  libLL39ipo \
  libLL39IRReader \
  libLL39BitReader \
  libLL39AsmParser \
  libLL39InstCombine \
  libLL39Instrumentation \
  libLL39Linker \
  libLL39TransformObjCARC \
  libLL39Object \
  libLL39ScalarOpts \
  libLL39TransformUtils \
  libLL39Analysis \
  libLL39Target \
  libLL39Core \
  libLL39MC \
  libLL39MCParser \
  libLL39ProfileData \
  libLL39Vectorize \
  libLL39Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
