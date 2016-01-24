#!/bin/bash

mkdir -p build

source /opt/poky/2.0/environment-setup-cortexa9-vfp-neon-poky-linux-gnueabi

# u-boot
git clone git://git.denx.de/u-boot.git u-boot-de1soc
cd u-boot-de1soc
git checkout fbb0c7bd92255bfcb13826a8ac81be6e2f94ba48

patch -p1 < ../files/u-boot.de1soc.diff

make socfpga_sockit_defconfig
make
mkimage -T socfpgaimage -d spl/u-boot-spl.bin preloader.bin

#cp preloader.bin ../build/de1soc.preloader.bin
cp u-boot-dtb.img ../build/de1soc.u-boot-dtb.img

cd ..
