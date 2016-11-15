$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/fortunave3g/fortunave3g-common-vendor.mk)

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/fortuna-common/overlay



# Common qcom
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk
include frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
