#!/bin/sh

repo init -u git://github.com/aquaxis/xiltera-bsp-platform.git
repo sync

mkdir -p poky/build/conf
cp -R conf/* poky/build/conf

cd poky

source ./oe-init-build-env build

bitbake xiltera-image-dfb

bitbake xiltera-image-dfb -c populate_sdk



