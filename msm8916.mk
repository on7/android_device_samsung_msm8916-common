# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/msm8916-common/msm8916-common-vendor.mk)

# Common overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# System properties
-include device/samsung/msm8916-common/system_prop.mk

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.sec.boot.sh:system/etc/init.sec.boot.sh \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl \
    $(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Configurations
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config \
    $(LOCAL_PATH)/configs/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Ril
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/data/dsi_config.xml:system/etc/data/dsi_config.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/data/netmgr_config.xml:system/etc/data/netmgr_config.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/data/qmi_config.xml:system/etc/data/qmi_config.xml
 
# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# TinyAlsa utils
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo	

# Display
PRODUCT_PACKAGES += \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916 \
    liboverlay \
    libqdutils \
    libqservice \
    libtinyxml

# Power
PRODUCT_PACKAGES += \
    power.msm8916

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916

# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera \
    camera.msm8916 \
    Snap

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxVidcCommon \
    libOmxVdecHevc \
    libOmxVdpp \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt \
    libstagefrighthw \
    libdashplayer \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    fsck.f2fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# WCNSS service daemon
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

# Misc
PRODUCT_PACKAGES += \
    libxml2 \
    Stk \
    Stk2

# SoftAP
PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg

# WPA supplicant
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=0

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    cm.updater.uri=http://updates.cm-ota.pp.ua

# Low-RAM optimizations
ADDITIONAL_BUILD_PROPERTIES += \
    config.disable_atlas=true

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise	

# Common qcom
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

# Dalvik heap config
include frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
