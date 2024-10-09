#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from vermeer device
$(call inherit-product, device/xiaomi/vermeer/device.mk)

# EverestOS configurations
EVEREST_BUILD_TYPE := UNOFFICIAL
EVEREST_MAINTAINER := Justin117
TARGET_SUPPORTS_BLUR := true
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
WITH_GAPPS := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_PREBUILT_BCR := true

PRODUCT_DEVICE := vermeer
PRODUCT_NAME := lineage_vermeer
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 23113RKC6G
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Boot Animation
TARGET_BOOT_ANIMATION_RES := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vermeer_global-user 14 UKQ1.230804.001 V816.0.6.0.UNKMIXM release-keys"

BUILD_FINGERPRINT := POCO/vermeer_global/vermeer:14/UKQ1.230804.001/V816.0.6.0.UNKMIXM:user/release-keys
