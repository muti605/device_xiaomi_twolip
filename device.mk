#
# Copyright (C) 2018-2019 The LineageOS Project
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
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

DEVICE_PATH := device/xiaomi/twolip

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Consumerir
BOARD_HAVE_IR := true

# Display calibration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/display/qdcm_calib_data_boe_ft8719_fhdplus_video_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_boe_ft8719_fhdplus_video_mode_dsi_panel.xml \
    $(DEVICE_PATH)/configs/display/qdcm_calib_data_shenchao_nt36672a_fhdplus_video_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_shenchao_nt36672a_fhdplus_video_mode_dsi_panel.xml \
    $(DEVICE_PATH)/configs/display/qdcm_calib_data_tianma_nt36672a_fhdplus_video_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_tianma_nt36672a_fhdplus_video_mode_dsi_panel.xml

# FM
BOARD_HAVE_QCOM_FM := true

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# Google camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/GoogleCameraGo/permissions/com.google.android.GoogleCameraGo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.GoogleCameraGo.xml \
    $(LOCAL_PATH)/GoogleCameraGo/configs/hiddenapi-package-whitelist-GoogleCameraGo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist-GoogleCameraGo.xml

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0.vendor
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-pe

# Powerhint
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc

# Shims
PRODUCT_PACKAGES += \
    libcamera_sdm660_shim \
    libmiwatermark_shim

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Wifi
PRODUCT_PACKAGES += \
    TulipWifiOverlay

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/twolip/twolip-vendor.mk)
