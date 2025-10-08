# Create Linux File Systems

## Formatting EXT4 File System

    fdisk -l /dev/sdb

    # create filesystem
    mkfs -t ...         # one way

    mkfs.<tab tab>      # other way

    # ext2 doesn't have a journal

    mkfs.ext4 -L DATA /dev/sdb6    # -L is label, /dev/sdb6 is the partition to make the file system

    # change settings
    tune2fs -L MYDATA -c 0 -i 0 /dev/sdb6        # -L label, -c is count, -i is interval

    # view info
    dumpe2fs /dev/sdb6 | less

## Formatting XFS File Systems

    # This is the default filesystem on CentOS 7

    mkfs.xfs -b size=1k -l size=10m /dev/sdb7         # -b block size, -l is the log

    xfs_<tab tab>    # shows our options

    xfs_db -x /dev/sdb7     # -x expert mode
      xfs_db> uuid     # in the cli at this point
      xfs_db> label
      xfs_db> label DATA2
      xfs_db> label    # now shows label value
      xfs_db> quit

## Mounting File Systems

    mount -o <device> <directory>

    mount /dev/sdb6 /mnt

    ls /mnt

    umount /mnt

    mkdir -p /data/{mydata,data2}

    ls /data        # shows all the sub directories

    mount /dev/sdb6 /data/mydata

    mount | grep mydata

    # Showing mount options
    mount -o remount,noexec /dev/sdb6 /data/mydata

    mount | grep mydata            # shows the noexec option

    umount /data/mydata/

    mount | grep mydata

    cat /proc/mount

    # Persisting the mounts

    blkid /dev/sdb6        # shows unique identifier, use the partition to get the unique identifier

    vi /etc/fstab
        Paste in UUID="................." /data/mydata ext4 noexec 0 2            # last arg is filesystem check, only for ext filesystems

    # Avoid reboot
    mount -a        # try to mount all unmounted filesystems

    mount | grep mydata

## Mounting XFS File Systems

    blkid /dev/sdb7

    # Copy the UUID

    vi /etc/fstab
        UUID="......................." /data/data2 xfs defaults 0 0         # xfs, filesystem check doesn't apply or allowed

    mount -a                  # mount all unmounted

    mount | grep data2        # see it

    xfs_info /dev/sdb7        # get some info on the partition

## Investigating Mount Options

    man mount

    vi /etc/fstab
        UUID="..............." /data/mydata ext4 noatime,noexec 0 2        # example of more options        
    
    umount /data/mydata

    mount -a    # to see new mount options that were added to /etc/fstab

    mount | grep data
