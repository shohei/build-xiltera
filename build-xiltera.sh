#!/bin/sh

repo init -u git://github.com/aquaxis/xiltera-bsp-platform.git
repo sync

mkdir -p poky/buld
cp -R conf poky/build

cd poky

source ./oe-init-build-env build

bitbake xiltera-image-dfb

bitbake xiltera-image-dfb -c populate_sdk



