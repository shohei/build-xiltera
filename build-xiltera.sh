#!/bin/bash

mkdir -p build

repo init -u git://github.com/aquaxis/xiltera-bsp-platform.git
repo sync

mkdir -p poky/build/conf
cp -R conf/* poky/build/conf

cd poky

source ./oe-init-build-env build

bitbake xiltera-image-dfb

bitbake xiltera-image-dfb -c populate_sdk

cp ./tmp/deploy/images/xiltera/xiltera-image-dfb-xiltera.tar.bz2 ../../build
cp ./tmp/deploy/sdk/poky-glibc-x86_64-xiltera-image-dfb-cortexa9hf-neon-toolchain-2.1.sh ../../build

cd ../../
