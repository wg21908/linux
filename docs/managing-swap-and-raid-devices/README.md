# Managing Swap and RAID Devices

## Creating Swap Space

    fdisk -l /dev/sdb    # -l is for list

    mkswap /dev/sdb5

    swapon -s    # summary of swap space in use

    swapon /dev/sdb5

    swapon -s

    # Remove swap space
    swapoff /dev/sdb5

    # Turn back on
    swapon -s

    # See space
    free -m

    swapoff /dev/sdb5
    !f    # last command starting with f
