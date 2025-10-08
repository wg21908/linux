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

   
