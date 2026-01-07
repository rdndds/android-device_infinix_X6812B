#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/infinix/X6812B/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_X6812B
PRODUCT_DEVICE := X6812B
PRODUCT_MANUFACTURER := Infinix
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := X6812B

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_x6812_h6912-user 11 RP1A.200720.011 758234 release-keys"

BUILD_FINGERPRINT := Infinix/X6812B-OP/Infinix-X6812B:11/RP1A.200720.011/241127V533:user/release-keys
