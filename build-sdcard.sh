#!/bin/bash

sudo umount ${1}?

sudo fdisk ${1} << EOF
d

d

d

w
EOF

sudo fdisk ${1} <<EOF
o
n
p
3
2048
+8M
t
a2
a
n
p
1

+20M
t
1
b
n
p
2

+768M
w
EOF

sudo mkfs.vfat -n BOOT ${1}1 
sudo mkfs.ext4 -L ROOT ${1}2
