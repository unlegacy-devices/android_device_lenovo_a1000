# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from the proprietary version
-include vendor/lenovo/a1000/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_BOARD_PLATFORM_GPU := mali-400
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7730SE
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
BOARD_VENDOR := lenovo

# Config u-boot
TARGET_NO_BOOTLOADER := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 15728640
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5073010688
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt device/lenovo/a1000/dt.img

# RIL
BOARD_RIL_CLASS := ../../../device/lenovo/a1000/ril

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/a1000/bluetooth

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := false

# Hardware rendering
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
HWUI_COMPILE_FOR_PERF := true
USE_OPENGL_RENDERER := true
COMMON_GLOBAL_CFLAGS += -DSC8830_HWC

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Audio
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_SS_VOIP := true
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# Board specific features
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Init
TARGET_NR_SVC_SUPP_GIDS := 24
TARGET_PROVIDES_INIT_RC := true

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Assert
TARGET_OTA_ASSERT_DEVICE := a1000

# Use dmalloc() for such low memory devices like us
MALLOC_IMPL := dlmalloc

# Use prebuilt webviewchromium to cut down build time
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
WITH_DEXPREOPT_COMP := false

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness


# TWRP
##RECOVERY_VARIANT := twrp
RECOVERY_GRAPHICS_USE_LINELENGTH := true
SP1_NAME := "internal_sd"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/sec-thermistor/temperature"
TWHAVE_SELINUX := true
TARGET_RECOVERY_INITRC := device/lenovo/a1000/etc/init.rc
TARGET_RECOVERY_FSTAB := device/lenovo/a1000/ramdisk/fstab.sc8830
TW_HAS_DOWNLOAD_MODE := true
DEVICE_RESOLUTION := 540x960
TW_THEME := portrait_mdpi
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

# UMS
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
