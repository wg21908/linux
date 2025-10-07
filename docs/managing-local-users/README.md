# Managing Local Users

## Accounts and the id command

    # User identification
    id            # my current user
    id <user>     # other user account

    id -g         # my primary group id
    id -G         # my secondary group memberships
    id -Gn        # user and group, cap G is secondary group, n is account name

## Create local user account(s)
 
    sudo useradd -m user1        # -m is to create a home directory
    tail -n 1 /etc/passwd        # see new account just created
    # username, x is pwd, user id, group id, comments field, user home dir, default shell

    ls /home                    # shows user1
    sudo ls -a /home/user1      

    sudo useradd -N user2 -g users -G adm
    !t        # run last command that started with the letter t, which would be tail

    sudo useradd user3 -G adm -s /bin/sh

    man useradd        # to see useradd options

    ls -l /sbin/adduser

## Managing User Passwords

    sudo passwd user1

    tail -n 1 /etc/shadow        # this is the password file

    sudo grep user1 /etc/shadow

    # Show records for users named user with one character after user
    sudo grep user. /etc/shadow

    echo 'user2:Password1' | sudo chpasswd

    sudo grep user. /etc/shadow

    echo Password1 | sudo passwd user3 --stdin

    sudo grep user. /etc/shadow
    # Shows all 3 users w/usernames of user*, where password was recently updated

## Password Age Data

    chage -l <username>        # Details about user password

    grep user1 /etc/password        # 2nd field is password, but has x, meaning it is instead shadow data

    sudo pwunconv        # unconvert password, meaning move away from shadow to storing password in /etc/passwd file

    sudo pwconv          # back to storing in shadow file, if you look at /etc/passwd you'll see 2nd field is a value of x again

    passwd --help        # seeing options

    chage --help         # seeing options

    sudo chage -M 40 user1    # max number of days before password change required
    
    sudo grep user1 /etc/shadow    # Shows the 40 days

    sudo passwd -l user1           # lock account

    sudo grep user1 /etc/shadow    # starts with two !! to indicate lockage

    sudo passwd -u user1           # unlock account

    sudo grep user1 /etc/shadow    # no more !!

## Account Defaults

    
    
    

    

    

    
    
