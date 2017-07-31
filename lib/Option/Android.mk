LOCAL_PATH:= $(call my-dir)

option_SRC_FILES39 := \
    Arg.cpp \
    ArgList.cpp \
    Option.cpp \
    OptTable.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

# FIXME: This only requires RTTI because tblgen uses it.  Fix that.
REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(option_SRC_FILES39)

LOCAL_MODULE:= libLL39Option

LOCAL_CFLAGS := -D__android__

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(option_SRC_FILES39)

LOCAL_MODULE:= libLL39Option

LOCAL_CFLAGS := -D__android__

include $(LLVM39_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
