#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

ifeq (aospa_porsche,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
# Keep the booting A17 Porsche reference's 64-bit primary / 32-bit secondary
# zygotes and app support; this is supported by calcite's core product files.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/realme/porsche/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

PRODUCT_BRAND := realme
PRODUCT_DEVICE := porsche
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := RMX3312
PRODUCT_NAME := aospa_porsche

PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Override device name for Play Store.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="RMX3312-user 15 AP3A.240617.008 S.242fe81-7fc3-7fc2 release-keys" \
    BuildFingerprint=realme/RMX3312/RE58B2L1:15/AP3A.240617.008/S.242fe81-7fc3-7fc2:user/release-keys \
    DeviceName=RE58B2L1 \
    DeviceProduct=RMX3312 \
    SystemDevice=RE58B2L1 \
    SystemName=RMX3312

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 1080

endif
