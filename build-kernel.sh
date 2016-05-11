#!/bin/bash

mkdir -p build

source /opt/poky/2.0.1/environment-setup-cortexa9-vfp-neon-poky-linux-gnueabi

# Kernel
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
git checkout 4.4.7

patch -p1 < ../files/linux-kernel.4.4.diff

make xiltera_defconfig
make zImage
make zynq-zybo.dtb
make socfpga_cyclone5_sockit.dtb

cp arch/arm/boot/zImage ../build/
cp arch/arm/boot/dts/zynq-zybo.dtb ../build/
cp arch/arm/boot/dts/socfpga_cyclone5_sockit.dtb ../build/socfpga.dtb

cd ..
