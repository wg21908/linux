#!/bin/bash

#
# Script should be run as secra, not w/a sudo
#

#
# Since I build Linux kernel as root, we need to give secra user and 
#   and group ownership so that qemu will have proper access to it
#
sudo chown secra:secra /home/secra/git/linux/arch/x86/boot/bzImage

qemu-system-x86_64 \
  -kernel /home/secra/git/linux/arch/x86/boot/bzImage \
  -initrd /home/secra/git/linux/initramfs.cpio.gz \
  -append "console=ttyS0 rdinit=/init" \
  -serial mon:stdio -s -S \
  -nographic
