LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-cov command line tool
#===---------------------------------------------------------------===

llvm_cov_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

llvm_cov_STATIC_LIBRARIES := \
  libLL39Object              \
  libLL39ProfileDataCoverage \
  libLL39ProfileData         \
  libLL39MC                  \
  libLL39MCParser            \
  libLL39BitReader           \
  libLL39Core                \
  libLL39Support             \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cov
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_cov_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_cov_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
