ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

AUDIO_PLATFORM := $(TARGET_BOARD_PLATFORM)

ifneq ($(filter msm8916 msm8909 msm8952,$(TARGET_BOARD_PLATFORM)),)
  AUDIO_PLATFORM = msm8916
  LOCAL_CFLAGS := -DPLATFORM_MSM8916
  LOCAL_CFLAGS += -DMAX_TARGET_SPECIFIC_CHANNEL_CNT="2"
  LOCAL_CFLAGS += -DKPI_OPTIMIZE_ENABLED
  MULTIPLE_HW_VARIANTS_ENABLED := true
endif

LOCAL_SRC_FILES := \
	audio_hw.c \
	voice.c \
	platform_info.c \
	audio_extn/ext_speaker.c \
	audio_extn/audio_extn.c \
	audio_extn/utils.c \
	$(AUDIO_PLATFORM)/platform.c

ifdef MULTIPLE_HW_VARIANTS_ENABLED
  LOCAL_CFLAGS += -DHW_VARIANTS_ENABLED
  LOCAL_SRC_FILES +=  $(AUDIO_PLATFORM)/hw_info.c
endif

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \
	libtinyalsa \
	libtinycompress \
	libaudioroute \
	libdl \
	libexpat

LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	external/tinycompress/include \
	$(call include-path-for, audio-route) \
	$(call include-path-for, audio-effects) \
	$(LOCAL_PATH)/$(AUDIO_PLATFORM) \
	$(LOCAL_PATH)/audio_extn \
	$(LOCAL_PATH)/voice_extn \
	external/expat/lib

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SMART_PA_TFA_98XX)),true)
    LOCAL_SHARED_LIBRARIES += libexTfa98xx
    LOCAL_CFLAGS += -DSMART_PA_TFA_98XX_SUPPORTED
    LOCAL_SRC_FILES += audio_extn/tfa_98xx.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS)),true)
    LOCAL_CFLAGS += -DMULTI_VOICE_SESSION_ENABLED
    LOCAL_SRC_FILES += voice_extn/voice_extn.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HFP)),true)
    LOCAL_CFLAGS += -DHFP_ENABLED
    LOCAL_SRC_FILES += audio_extn/hfp.c
endif

ifeq ($(strip $(AUDIO_FEATURE_SUPPORTED_EXTERNAL_BT)),true)
    LOCAL_CFLAGS += -DEXTERNAL_BT_SUPPORTED
endif

ifeq ($(strip $(AUDIO_FEATURE_NO_AUDIO_OUT)),true)
    LOCAL_CFLAGS += -DNO_AUDIO_OUT
endif

ifeq ($(strip $(BOARD_SUPPORTS_SOUND_TRIGGER)),true)
    LOCAL_CFLAGS += -DSOUND_TRIGGER_ENABLED
    LOCAL_CFLAGS += -DSOUND_TRIGGER_PLATFORM_NAME=$(TARGET_BOARD_PLATFORM)
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/sound_trigger
    LOCAL_SRC_FILES += audio_extn/soundtrigger.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SPKR_PROTECTION)),true)
    LOCAL_CFLAGS += -DSPKR_PROT_ENABLED
    LOCAL_SRC_FILES += audio_extn/spkr_protection.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DSM_FEEDBACK)),true)
    LOCAL_CFLAGS += -DDSM_FEEDBACK_ENABLED
    LOCAL_SRC_FILES += audio_extn/dsm_feedback.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SND_MONITOR)), true)
    LOCAL_CFLAGS += -DSND_MONITOR_ENABLED
    LOCAL_SRC_FILES += audio_extn/sndmonitor.c
endif

LOCAL_MODULE := audio.primary.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif
