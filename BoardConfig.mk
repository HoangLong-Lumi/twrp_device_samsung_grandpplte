#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/grandpplte

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Assert
TARGET_OTA_ASSERT_DEVICE := grandpplte

# Bootloader"
TARGET_BOOTLOADER_BOARD_NAME := SRPPI01A000RU

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

BOARD_BOOTIMAGE_PARTITION_SIZE        := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 3229614080
BOARD_CACHEIMAGE_PARTITION_SIZE       := 419430400
BOARD_FLASH_BLOCK_SIZE                := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 3900702720

# Kernel
TARGET_PREBUILT_KERNEL  := $(DEVICE_PATH)/prebuilt/zImage
BOARD_KERNEL_CMDLINE    := bootopt=64S3,32N2,32N2
BOARD_KERNEL_BASE       := 0x3fffc000
BOARD_KERNEL_PAGESIZE   := 2048
BOARD_RAMDISK_OFFSET    := 0x04004000
BOARD_SECOND_OFFSET     := 0x00f04000
BOARD_TAGS_OFFSET       := 0x0e004000
BOARD_KERNEL_OFFSET     := 0x00008000
BOARD_FLASH_BLOCK_SIZE  := 131072
BOARD_KERNEL_IMAGE_NAME := zImage

TARGET_KERNEL_ARCH        := arm
TARGET_KERNEL_HEADER_ARCH := arm

BOARD_MKBOOTIMG_ARGS += \
	--board $(TARGET_BOOTLOADER_BOARD_NAME) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--second_offset $(BOARD_SECOND_OFFSET) \
	--tags_offset $(BOARD_TAGS_OFFSET)

BOARD_CUSTOM_BOOTIMG_MK :=  device/samsung/grandpplte/bootimg.mk

# Platform
TARGET_BOARD_PLATFORM := mt6737t
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_SUPPRESS_SECURE_ERASE := true

# Ramdisk
BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery

# TWRP
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := "/sys/devices/ktd3102-bl/lcd-backlight/brightness"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_USE_NEW_MINADBD := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_TWRPAPP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

TW_EXTRA_LANGUAGES := false
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_EXCLUDE_TZDATA := true
