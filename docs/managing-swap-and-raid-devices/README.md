# Managing Swap and RAID Devices

## Creating Swap Space

    fdisk -l /dev/sdb    # -l is for list

    mkswap /dev/sdb5

    swapon -s            # summary of swap space in use

    swapon /dev/sdb5

    swapon -s

    # Remove swap space
    swapoff /dev/sdb5

    # Turn back on
    swapon -s

    # See space
    free -m

    swapoff /dev/sdb5
    !f                    # last command starting with f

## Configure Priority and Mounting at Boot

    swapoff -a
    swapon -s        # summary
    free -m          # shows Mem and Swap

    vi /etc/fstab
        # shows existing swap file
        <ESCAPE>, r!blkid /dev/sdb5            # run command in vi, to read in content to file

        # Added entry
        UUID="................" swap swap sw,pri=5 0 0

    # Higher priority number runs first....

    swapon -a    # turn on

    swapon -s    # summary

## Managing RAID

    Redundant Array of Inexpensive Disks (RAID)

    RAID Levels
        - Linear
        - RAID0
        - RAID1
        - RAID4, RAID5, RAID6

    fdisk -l /dev/sdb
        /dev/sdb13    Linux raid autodetect
        /dev/sdb14    Linux raid autodetect

    # Suport raid?  presence of file shows we support raid
    cat /proc/mdstat

    mdadm --create --verbose /dev/md0 --level=mirror --raid-devices=2 /dev/sdb13 /dev/sdb14       # this is the dev mapper
        
    ls -l /dev/md0        # shows block device

    !cat        # ran last cat command, /proc/mdstat now has different output

    mkfs.xfs /dev/md0

    # Now we could mount this new fileysystem

    mdadm --detail --scan

    mdadm --detail --scan >> /etc/mdadm.conf

    mdadm --stop /dev/md0          # stop it

    mdadm --assemble --scan        # read in info from configuration file at /etc/mdadm.conf
