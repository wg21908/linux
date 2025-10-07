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

## Making Use of the SGID Permission

    sudo yum install httpd w3m         # command line web-browser is w3m
    sudo systemctl status httpd
    ls /var/www/html/                  # where data comes from
    ls -l /var/www/html                # directory owned and group owned by root
    # as tux user
    sudo vi /var/www/html/index.html   # then put some content in this file

    w3m localhost        # shows the welcome page or the index.html page
    # Right now access is allowed cause index.html file gives access to others, the ......r-x part of the permissions on the file

    # Key part:
    grep apache /etc/group # see apache group in main group file
    sudo chgrp -R apache /var/www    # change group permission recursively

    ls -ld /var/wwww

    sudo chmod -R o= /var/www        # no permissions for others, since we earlier gave it to apache

    sudo ls -l /var/www/html

    w3m localhost                    # testing that access to index.html still exists, apache still has access to the page

    chmod g+s /var/www/html          # in /var/www/html, setting group id bit
    ls -ld .                         # in /var/www/html
    umask 027                        # others should have no access
    vi test.html                     # creating file to demonstrate what group permissions it will get
    ls -l                            # shows how new test.html file got apache group permissions

## Group Passwords

    id -Gn                                 # check my secondary groups
    id -gn                                 # my primary group

    # set password for adm group
    sudo gpasswd adm

    # add bob to sales group
    sudo gpasswd -a bob sales

    sudo gpasswd -M bob,jo,tux sales        # specifying complete membership

    sudo usermod -G sales,wheel bob         # from user perspective, bob's secondary group membership    
    
    newgrp adm

    # Lessens security if group has password, don't set passwords on a group
    
