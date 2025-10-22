#!/bin/bash

# qemu-system-x86_64  -kernel /home/secra/git/linux/arch/x86/boot/bzImage -append "console=ttyS0" -serial mon:stdio -s -S

qemu-system-x86_64 \
  -kernel /home/secra/git/linux/arch/x86/boot/bzImage \
  -initrd /home/secra/initramfs.cpio.gz \
  -append "console=ttyS0 rdinit=/init" \
  -serial mon:stdio -s -S
