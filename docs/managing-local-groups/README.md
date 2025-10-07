# Managing Local Groups

## Creating Groups

    # Group file
    grep tux /etc/group
    # Group name is displayed in the first column

    id # shows id of <user> in column 1, then primary group id in column 2, secondary groups in 3rd column

    newgrp # does not create a new group, it switches my group id 
    # changes my primary group id

    touch g1
    ls -l g1
    # this will be group owned by my primary group

    # doing the newgrp action above jsut makes it for things I create to have that group ownership details, it does not play into what I have access too

    sudo groupadd sales # now this creates a new group
    grep sales /etc/group # to see the new sales group

    # Groups also have a shadow file, similar to users, shown below
    sudo grep sales /etc/gshadow
    # ! means an invalid password when shown in the 2 column of delimited line, yes group passwords is a thing

## Manage Group Membership

    id -G       # show me my secondary groups
    id -Gn      # show me name too
    id -gn      # show me my primary group

    # Modify my group
    sudo usermod -G sales,wheel tux # -G secondary, need to include existing groups unless they will be lost
    id -Gn <user>

    sudo usermod -G <secondary group name> <user>

    # Add users to a group
    sudo gpasswd -a <user> <group name>

    # Add bunch of users to a group
    sudo gpasswd -M <user1,user2,user3> <group name>

    gpasswd --help     # see my options

    grep <user> /etc/group    # to see which users belong to a group
    id  # to see user details

    su - <user>    # full login shell
    id -Gn          # to refresh group membership, due to previos command
    
    
