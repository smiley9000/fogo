#!/bin/bash

rm -rf .repo/local_manifests/
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs

# build
/opt/crave/resync.sh

rm -rf vendor/motorola
rm -rf device/motorola
rm -rf kernel/motorola

git clone https://github.com/smiley9000/android_device_motorola_fogo device/motorola/fogo
git clone https://github.com/smiley9000/vendor_fogo vendor/motorola
git clone https://github.com/LineageOS/android_kernel_motorola_sm6375 kernel/motorola/sm6375
git clone https://github.com/LineageOS/android_device_motorola_sm6375-common device/motorola/sm6375-common 
git clone https://github.com/smiley9000/hm vendor/lineage-priv/keys
git clone https://github.com/smiley9000/vendor_motorola_fogo-motcamera vendor/motorola/fogo-motcamera

git clone https://github.com/LineageOS/android_hardware_motorola hardware/motorola

. build/envsetup.sh
riseup fogo userdebug 
rise b
