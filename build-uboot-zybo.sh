#!/bin/bash

mkdir -p build

source /opt/poky/2.2.1/environment-setup-cortexa9hf-neon-poky-linux-gnueabi

# u-boot
git clone git://git.denx.de/u-boot.git u-boot-zybo
cd u-boot-zybo
#git checkout 5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d
git checkout v2016.05

patch -p1 < ../files/u-boot.zybo.diff

cp ../files/ps7_init* board/xilinx/zynq/custom_hw_platform/

make mrproper
make zynq_zybo_defconfig
make

../zynq-boot-bin.py -o boot.bin -u spl/u-boot-spl.bin

cp boot.bin ../build/zybo.boot.bin
cp u-boot-dtb.img ../build/zybo.u-boot-dtb.img

cd ..
