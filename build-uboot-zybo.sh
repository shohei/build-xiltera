#!/bin/bash

mkdir -p build

source /opt/poky/2.0/environment-setup-cortexa9-vfp-neon-poky-linux-gnueabi

# u-boot
git clone git://git.denx.de/u-boot.git u-boot-zybo
cd u-boot-zybo
git checkout fbb0c7bd92255bfcb13826a8ac81be6e2f94ba48

patch -p1 < ../files/u-boot.zybo.diff

cp ../files/ps7_init* board/xilinx/zynq/custom_hw_platform/

make mrproper
make zynq_zybo_defconfig
make

../zynq-boot-bin.py -o boot.bin -u spl/u-boot-spl.bin

cp boot.bin ../build/zybo.boot.bin
cp u-boot.img ../build/zybo.u-boot.img

cd ..
