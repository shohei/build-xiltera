#!/bin/bash

mkdir -p build

source /opt/poky/2.0/environment-setup-cortexa9-vfp-neon-poky-linux-gnueabi

# u-boot
git clone git://git.denx.de/u-boot.git
cd u-boot
git checkout fbb0c7bd92255bfcb13826a8ac81be6e2f94ba48

patch -p1 < ../files/u-boot.de1soc.diff
patch -p1 < ../files/u-boot.zybo.diff

make socfpga_sockit_defconfig
make

cp spl/u-boot-spl.bin ../build/de1soc.u-boot-spl.bin
cp u-boot-dtb.img ../build/de1soc.u-boot-dtb.img

make clean

make zynq_zybo_defconfig
make

../zynq-boot-bin.py -o boot.bin -u spl/u-boot-spl.bin

cp boot.bin ../build/zybo.boot.bin
cp u-boot.img ../build/zybo.u-boot.img

cd ..
