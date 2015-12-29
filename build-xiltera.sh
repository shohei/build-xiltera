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

cp poky/build/tmp/deploy/images/xiltera/xiltera-image-dfb-xiltera.tar.bz2 ./build
cp poky/build/tmp/deploy/sdk/poky-glibc-x86_64-xiltera-image-dfb-cortexa9-vfp-neon-toolchain-2.0.sh ./build

