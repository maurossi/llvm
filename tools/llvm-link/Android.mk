LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM80Linker \
  libLLVM80IRReader \
  libLLVM80Object \
  libLLVM80MC \
  libLLVM80MCParser \
  libLLVM80BitReader \
  libLLVM80BitWriter \
  libLLVM80AsmParser \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80Core \
  libLLVM80Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif
