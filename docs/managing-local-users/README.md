# Managing Local Users

## Accounts and the id command

    # User identification
    id            # my current user
    id <user>     # other user account

    id -g         # my primary group id
    id -G         # my secondary group memberships, group id numbers
    id -Gn        # user and group, cap G is secondary group, n is account name, cap G is group account name

## Create local user account(s)

    /etc/passwd, users acct information tracked here
    
    sudo useradd -m user1        # -m is to create a home directory
    tail -n 1 /etc/passwd        # see new account just created
    # username, x is pwd, user id, group id, comments field, user home dir, default shell

    username and password are case sensitive

    ls /home                    # shows user1
    sudo ls -a /home/user1      

    tail -n 1 /etc/passwd

    sudo useradd -N user2 -g users -G adm
    !t        # run last command that started with the letter t, which would be tail

    sudo useradd user3 -G adm -s /bin/sh

    sudo useradd -N -g users -G adm sally        # creating user sally, primary group is users, secondary group is adm

    man useradd        # to see useradd options

    ls -l /sbin/adduser

## Managing User Passwords

    Passwords stored in shadow file at /etc/shadow

    sudo passwd user1

    tail -n 1 /etc/shadow        # this is the password "or shadow" file

    sudo grep user1 /etc/shadow

    # Show records for users named user with one character after user
    sudo grep user. /etc/shadow

    echo 'user2:Password1' | sudo chpasswd

    sudo grep user. /etc/shadow

    echo Password1 | sudo passwd user3 --stdin

    sudo grep user. /etc/shadow
    # Shows all 3 users w/usernames of user*, where password was recently updated

## Password Age Data

    chage -l <username>            # Details about user password

    grep user1 /etc/password       # 2nd field is password, but has x, meaning it is instead shadow data

    sudo pwunconv                  # unconvert password, meaning move away from shadow to storing password in /etc/passwd file

    sudo pwconv                    # back to storing in shadow file, if you look at /etc/passwd you'll see 2nd field is a value of x again

    passwd --help                  # seeing options

    chage --help                   # seeing options, manage password aging

    sudo chage -M 40 user1         # max number of days before password change required
    
    sudo grep user1 /etc/shadow    # Shows the 40 days

    sudo passwd -l user1           # lock account

    sudo grep user1 /etc/shadow    # starts with two !! to indicate lockage

    sudo passwd -u user1           # unlock account

    sudo grep user1 /etc/shadow    # no more !!

## Account Defaults

    less /etc/login.defs               

    # to see defaults
    sudo useradd -D

    sudo useradd -Ds /bin/sh           # Change default shell, -D set default, s is for setting

    sudo useradd -D                    # Review the default, changed shell

    # Review defaults for useradd
    sudo cat /etc/default/useradd

    # Revert shell back to /bin/bash
    sudo vi /etc/default/useradd
        SHELL=/bin/bash

## Modifying and Deleting User Accounts

    sudo usermod -c "User One" user1
    grep user1 /etc/passwd                    # See the new comment for user1

    chsh -l        # list available shells
    chsh -s /bin/sh <username>                # to update the shell
    grep <username> /etc/passwd               # to see new shell

    sudo usermod -s /bin/bash <username>
    grep <username> /etc/passwd               # see updated shell

    sudo userdel -r <username>
    ls /home                                  # to see removed user

    sudo userdel <username>
    ls -l                                     # username directory will still exist casue didn't user -r option

    sudo find /home -uid 1002 -delete         # cleanup to get reosources related to removed user
    ls -l                                     # home dir now gone

    sudo userdel -r user3
    
