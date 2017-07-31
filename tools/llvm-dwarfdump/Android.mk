LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwarfdump command line tool
#===---------------------------------------------------------------===

llvm_dwarfdump_SRC_FILES39 := \
  llvm-dwarfdump.cpp

llvm_dwarfdump_STATIC_LIBRARIES := \
  libLL39DebugInfoDWARF            \
  libLL39DebugInfoPDB              \
  libLL39Object                    \
  libLL39BitReader                 \
  libLL39MC                        \
  libLL39MCParser                  \
  libLL39Core                      \
  libLL39Support                   \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwarfdump
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwarfdump_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_dwarfdump_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
