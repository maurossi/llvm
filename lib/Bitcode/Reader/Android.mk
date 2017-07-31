LOCAL_PATH:= $(call my-dir)

bitcode_reader_SRC_FILES39 := \
	BitReader.cpp	\
	BitcodeReader.cpp \
	BitstreamReader.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(bitcode_reader_SRC_FILES39)

LOCAL_MODULE:= libLLVM39BitReader

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(bitcode_reader_SRC_FILES39)

LOCAL_MODULE:= libLLVM39BitReader

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
