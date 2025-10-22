#!/bin/bash

sudo chown secra:secra /home/secra/git/linux/arch/x86/boot/bzImage

qemu-system-x86_64 \
  -kernel /home/secra/git/linux/arch/x86/boot/bzImage \
  -initrd /home/secra/initramfs.cpio.gz \
  -append "console=ttyS0 rdinit=/init" \
  -serial mon:stdio -s -S \
  -nographic
