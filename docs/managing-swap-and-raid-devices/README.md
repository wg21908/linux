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

    
    
