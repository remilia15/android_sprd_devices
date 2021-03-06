#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

-include device/sprd/scx35/BoardConfigCommon.mk
-include device/sprd/scx35/emmc/BoardConfigEmmc.mk

# board configs
TARGET_BOOTLOADER_BOARD_NAME := sp9630ea
UBOOT_DEFCONFIG := sp9630ea_a2800
ifeq ($(strip $(BOARD_KERNEL_SEPARATED_DT)),true)
KERNEL_DEFCONFIG := $(TARGET_BOARD)_dt_defconfig
else
KERNEL_DEFCONFIG := sp9630ea_defconfig
endif

TARGET_GPU_DFS_MAX_FREQ := 256000
TARGET_GPU_DFS_MIN_FREQ := 256000

# select camera 2M,3M,5M,8M
CAMERA_SUPPORT_SIZE := 2M
TARGET_BOARD_NO_FRONT_SENSOR := false
TARGET_BOARD_FRONT_CAMERA_ROTATION := false
TARGET_BOARD_BACK_CAMERA_ROTATION := false
TARGET_BOARD_CAMERA_FLASH_CTRL := true

#face detect
TARGET_BOARD_CAMERA_FACE_DETECT := false
#uvdenoise
TARGET_BOARD_CAMERA_CAPTURE_DENOISE := true

#snesor interface
TARGET_BOARD_BACK_CAMERA_INTERFACE := mipi
TARGET_BOARD_FRONT_CAMERA_INTERFACE := mipi

#select camera zsl cap mode
TARGET_BOARD_CAMERA_CAPTURE_MODE := true

#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := true

#select camera not support autofocus
TARGET_BOARD_CAMERA_NO_AUTOFOCUS_DEV := true

#select continuous auto focus
TARGET_BOARD_CAMERA_CAF := false

TARGET_BOARD_CAMERA_NO_FLASH_DEV := false

#image angle in different project
TARGET_BOARD_CAMERA_ADAPTER_IMAGE := 180

#pre_allocate capture memory
TARGET_BOARD_CAMERA_PRE_ALLOC_CAPTURE_MEM := true

#low capture memory
TARGET_BOARD_LOW_CAPTURE_MEM := true

#select mipi d-phy mode(none, phya, phyb, phyab)
TARGET_BOARD_FRONT_CAMERA_MIPI := phyb
TARGET_BOARD_BACK_CAMERA_MIPI := phya

#select ccir pclk src(source0, source1)
TARGET_BOARD_FRONT_CAMERA_CCIR_PCLK := source0
TARGET_BOARD_BACK_CAMERA_CCIR_PCLK := source0

# select WCN
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_SPRD := false
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_FM_TROUT := false
BOARD_USE_SPRD_FMAPP := true

#2351 GPS
BOARD_USE_SPRD_4IN1_GPS := true

# WIFI configs
ifeq ($(strip $(PRODUCT_WIFI_DEVICE)),sprd)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sprdwl
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"
endif
ifeq ($(strip $(PRODUCT_WIFI_DEVICE)),bcm)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   :="sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_MFG      := "system/vendor/firmware/fw_bcmdhd_mfg.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=system/vendor/firmware/fw_bcmdhd.bin nvram_path=system/etc/wifi/bcmdhd.cal"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
endif

# select sensor,liwei delete 20141108,start
#USE_INVENSENSE_LIB := true
#USE_SPRD_SENSOR_LIB := true
#BOARD_HAVE_ACC := Lis3dh
#BOARD_ACC_INSTALL := 6
#BOARD_HAVE_ORI := NULL
#BOARD_ORI_INSTALL := NULL
#BOARD_HAVE_PLS := LTR558ALS
#liwei delete 20141108,end
BOARD_PLS_COMPATIBLE := NULL

##zhangyuan modify 20141127 start
BOARD_GPS := false
##zhangyuan modify 20141127 end

# ext4 partition layout
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 700000000 #1000000000  modified by lidan
ifeq ($(STORAGE_INTERNAL), physical)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1300000000
else
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550000000
endif
BOARD_CACHEIMAGE_PARTITION_SIZE := 150000000
BOARD_PRODNVIMAGE_PARTITION_SIZE := 5242880
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODNVIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_SYSTEMIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_CACHEIMAGES_SPARSE_EXT_DISABLED := false
TARGET_PRODNVIMAGES_SPARSE_EXT_DISABLED := true

USE_SPRD_HWCOMPOSER  := true
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
