#!/bin/bash

rm -rf .repo/local_manifests/
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs

# build
/opt/crave/resync.sh

sudo apt update
sudo apt install python3-pip
sudo apt install protobuf-compiler

pip3 install protobuf
pip install protobuf==3.20.*
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python



git clone https://github.com/smiley9000/android_device_motorola_fogo device/motorola/fogo
git clone https://github.com/LineageOS/android_kernel_motorola_sm6375 kernel/motorola/sm6375
git clone https://github.com/LineageOS/android_device_motorola_sm6375-common device/motorola/sm6375-common 
git clone https://github.com/smiley9000/hm vendor/lineage-priv/keys
git clone https://github.com/smiley9000/vendor_motorola_fogo-motcamera vendor/motorola/fogo-motcamera

git clone https://github.com/LineageOS/android_hardware_motorola hardware/motorola

wget https://mirrorbits.lineageos.org/full/fogo/20250619/lineage-22.2-20250619-nightly-fogo-signed.zip
mv lineage-22.2-20250619-nightly-fogo-signed.zip ./device/motorola/fogo

./device/motorola/fogo/extract-files.py lineage-22.2-20250619-nightly-fogo-signed.zip

. build/envsetup.sh
riseup fogo userdebug 
rise b
