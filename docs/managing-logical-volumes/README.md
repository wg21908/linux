# Managing Logical Volumes

## Creating LLVMs

    pvscan    # show physical volumes
    vgscal
    lvscan

    fdisk -l /dev/sdb

    pvcreate /dev/sdb10
    pvcreate /dev/sdb11
    pvcreate /dev/sdb12

    vgcreate vg1 /dev/sdb10 /dev/sdb11

    vgscan

    vgs    # see info

    # Create logical volume
    lvcreate -n lv1 -L 184m vg1

    lvscan

    mkfs.xfs /dev/vg1/lv1

    mkdir /lvm

    vi /etc/fstab
      # /dev/vg1/lv1 /lvm xfs defaults 0 0

    mount -a     # mount if not currently mounted

    find /usr/share/doc -name '*.pdf' -exec cp {} /lvm/ \;
    ls /lvm

    df -h    # check if we are running out of space

## Resizing LLVMs

    df -h
    pvscan
    vgextend vg1 /dev/sdb12
    vgs
    lvextend -L +50m /dev/vg1/lv1

    xfs_<tab tab>
    xfs_growfs /lvm

## LVM Snapshots

## Migrating PVs to New Storage

