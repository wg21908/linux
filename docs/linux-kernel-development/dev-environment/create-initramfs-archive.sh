#!/bin/bash

# executed as secra

cd ~/rootfs
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz
