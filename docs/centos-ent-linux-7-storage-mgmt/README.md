# CentOS Enterprise Linux 7 Storage Management

## Listing Block Storage

    lsblk

## Partitioning Disks

    # Partitioning Tools
    - fdisk
    - gdisk
    - parted

    # Types of Disks
    - Physical
    - Virtual

    # Partition Tables
    - MBR Partition Table 2TB Limitation
      - Max of 4 primary partitions
      
    - GUID Partition Table (GPT) 8ZB Limitation
      - Max of 128 partitions
    
    File Systems
      - ext2
      - ext3
      - ext4
      - ReiserFS
      - XFS
      - Btfrs

## Partitioning with fdisks

    fdisk -l /dev/sdb    # list partitions

    fdisk /dev/sdb       # starting doing partitions
      > m    # list options
      > p    # print partition table
      > n    # new table
        >    # default
        >    # default
        > +200M    
      > w

    dd if=/dev/zero of=/dev/sdb count=1 bs=512    # this will overwrite partition table created by previous fdisk command

    fdisk -l /dev/sdb    # previous command deleted the partition table

## Using gdisk

    lsblk

    # shows new sdb disk w/no partitions

    # will create a gui partition table

    gdisk /dev/sdb

    gdisk -l /dev/sdb

    # Doing same demo as fdisk, how to overwrite the partition table, when partition table was created by gdisk

      # fyi: partition table is more than just the 512 size that was in place via fdisk, it is actually size of all of below
        - First 512 Bytes Protective MBR
        - Second 512 Bytes GPT Headers
        - Next 16KiB Primary GPT
        - Last 16KiB Backup GPT

        dd if=/dev/zero of=/dev/sdb count=2 bs=16K

        gdisk -l /dev/sdb

        # No count
        dd if=/dev/zero of=/dev/sdb bs=16K
        # above command wiped the complete disk

## Partitioning with parted

    parted /dev/sdb print
    # above prints disk information

    parted
      > select /dev/sdb
      > print
      > p    # also print
      > mklabel msdos
      > p
      > mklabel gpt
      > p
      > mkpart primary 1 200
      > print
      > mkpart extended 201 -1    # -1 last MB of the disk
      > p
      > mkpart logical 202 300
      
    # Do some wiping

      dd if=/dev/zero of=/dev/sdb count=1 bs=512
        
## Scripting Partition Creation

    Showed script that used parted to create partitions

    # Backup the master boot record

    dd if=/dev/sda count=1 bs=512 of=/root/sdb.mbr
