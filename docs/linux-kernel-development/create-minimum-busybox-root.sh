#!/bin/bash

sudo chown -R secra:secra /home/secra/rootfs

mkdir -p ~/rootfs/{bin,sbin,etc,proc,sys,usr/bin,usr/sbin}
cp ~/rootfs/bin/busybox ~/rootfs/bin/

if [ ! -L "/home/secra/rootfs/bin/sh" ] && [ ! -e "/home/secra/rootfs/bin/sh" ]; then
  ln -s "/home/secra/rootfs/bin/busybox" "/home/secra/rootfs/bin/sh"
else
  echo "Link or file '/home/secra/rootfs/bin/sh' already exists, skipping."
fi

cat <<'EOF' > ~/rootfs/init
#!/bin/sh
mount -t proc proc /proc
mount -t sysfs sysfs /sys
echo "Welcome to QEMU test shell!"
exec /bin/sh
EOF
chmod +x ~/rootfs/init
