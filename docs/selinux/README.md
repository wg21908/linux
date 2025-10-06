# SELinux

Is-a: Mandatory access control list  

FYI: Apparmor is the same thing as above  

## View SELinux status & Contexts

    ls -Z /etc/shadow

    getenforce   # get mode

    sestatus     # overall SELinux status

    cat /etc/selinux/config

    setenforce 0

    geten # Shows getenforce and getent files

    getenforce # shows Permissive

    setenforce 1

    id -Z # shows unconfined

    ps -Z # see type unconfined_t

    ps -Zp $(pgrep sshd)    # type is: sshd_t
    
## View SELinux logs

## Working w/SELinux booleans

## Working w/SELinux ports
