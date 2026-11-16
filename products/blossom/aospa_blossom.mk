ifeq (aospa_blossom,$(TARGET_PRODUCT))
#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/blossom/device.mk)

# Inherit common AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Use the AOSPA default allocator (Scudo).

TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_NAME := aospa_blossom
PRODUCT_DEVICE := blossom
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=google/blossom/blossom:17/CP2A.260105.004.E1/14587043:user/release-keys

endif
