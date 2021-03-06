LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Basecomponent.c \
	Exynos_OMX_Baseport.c

LOCAL_MODULE := libExynosOMX_Basecomponent

LOCAL_CFLAGS :=

LOCAL_STATIC_LIBRARIES := libExynosOMX_OSAL
LOCAL_SHARED_LIBRARIES := libcutils libutils liblog

LOCAL_C_INCLUDES := \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal

ifeq ($(BOARD_USE_KHRONOS_OMX_HEADER), true)
LOCAL_CFLAGS += -DUSE_KHRONOS_OMX_HEADER
LOCAL_C_INCLUDES += $(EXYNOS_OMX_INC)/khronos
else
ifeq ($(BOARD_USE_ANDROID), true)
LOCAL_C_INCLUDES += $(ANDROID_MEDIA_INC)/openmax
endif
endif

LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-unused-variable
LOCAL_CFLAGS += -Wno-unused-label
LOCAL_CFLAGS += -Wno-enum-conversion

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Resourcemanager.c

LOCAL_MODULE := libExynosOMX_Resourcemanager

LOCAL_CFLAGS :=

LOCAL_STATIC_LIBRARIES := libExynosOMX_OSAL
LOCAL_SHARED_LIBRARIES := libcutils libutils

LOCAL_C_INCLUDES := \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal

ifeq ($(BOARD_USE_KHRONOS_OMX_HEADER), true)
LOCAL_CFLAGS += -DUSE_KHRONOS_OMX_HEADER
LOCAL_C_INCLUDES += $(EXYNOS_OMX_INC)/khronos
else
ifeq ($(BOARD_USE_ANDROID), true)
LOCAL_C_INCLUDES += $(ANDROID_MEDIA_INC)/openmax
endif
endif

include $(BUILD_SHARED_LIBRARY)
