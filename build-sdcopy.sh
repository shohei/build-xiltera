#!/bin/bash

sudo mkdir -p /tmp/mnt/boot
sudo mkdir -p /tmp/mnt/root

sudo mount ${1}1 /tmp/mnt/boot
sudo mount ${1}2 /tmp/mnt/root

sudo dd if=./build/de1soc.preloader.bin of=${1}3 bs=64k seek=0
sudo dd if=./build/de1soc.u-boot-dtb.img of=${1}3 bs=64k seek=4

sudo cp ./build/zImage /tmp/mnt/boot
sudo cp ./build/socfpga.dtb /tmp/mnt/boot
sudo cp ./build/zynq-zybo.dtb /tmp/mnt/boot
sudo cp ./build/zybo.u-boot.img /tmp/mnt/boot/u-boot.img
sudo cp ./build/zybo.boot.bin /tmp/mnt/boot/boot.bin

sudo tar xjvf ./build/xiltera-image-dfb-xiltera.tar.bz2 -C /tmp/mnt/root
sudo chmod 777 /tmp/mnt/root/etc/init.d/psplash.sh
sudo echo "ln -s /dev/ttyS0 /dev/ttyPS0" >> /tmp/mnt/root/etc/init.d/psplash.sh
sudo chmod 755 /tmp/mnt/root/etc/init.d/psplash.sh

sudo cp soc_system.rbf /tmp/mnt/boot
sudo cp ZYBO_wrapper.bit /tmp/mnt/boot

sync;sync;sync;

sudo umount ${1}?

sudo rm -rf /tmp/mnt

