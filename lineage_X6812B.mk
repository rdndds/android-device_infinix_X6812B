#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
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

PRODUCT_SYSTEM_NAME := X6812B
PRODUCT_SYSTEM_DEVICE := X6812B

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="X6812B-user 13 TP1A.220624.014 eng.root.20240101.000000 release-keys" \
    BuildFingerprint=Infinix/X6812B_global/X6812B:13/TP1A.220624.014/240101V0000:user/release-keys \
    SystemModel=$(PRODUCT_SYSTEM_DEVICE) \
    SystemName=$(PRODUCT_SYSTEM_NAME) \
    ProductModel=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
