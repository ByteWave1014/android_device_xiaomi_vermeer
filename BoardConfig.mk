#
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/vermeer
KERNEL_PATH := device/xiaomi/vermeer-kernel

# Inherit from sm8550-common
include device/xiaomi/sm8550-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 530

# DTB
BOARD_USES_DT := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbs/dtbo.img

# Kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true

TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_KERNEL_CMDLINE := \
    kasan=off \
    disable_dma32=on \
    rcu_nocbs=all \
    rcutree.enable_rcu_lazy=1 \
    mtdoops.fingerprint=$(DERP_VERSION)

BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    androidboot.init_fatal_reboot_target=recovery

BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# Kill kernel build task while preserving kernel
TARGET_NO_KERNEL_OVERRIDE := true

# Workaround to make soong generator work
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers

TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/Image
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

# Kernel Modules
device_second_stage_modules := \
    goodix_ts.ko \
    xiaomi_touch.ko

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD += $(device_second_stage_modules)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD += $(device_second_stage_modules)

# OTA
TARGET_OTA_ASSERT_DEVICE := vermeer

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/properties/odm.prop
