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

   tail /var/log/audit/audit.log

   ausearch -m avc     # shows access denieds

   ls -Z /etc/shadow

   chcon -t unlabeled_t /etc/shadow

   ls -Z /etc/shadow

   ausearch -m avc -ts recent

   restorecon /etc/shadow
   
   ls -Z /etc/shadow

   semanage fcontext -l         # l for list

   semanage fcontext -l | grep /etc/shadow

   cd /etc/selinux/targeted/contexts/files/
   ls

## Working w/SELinux booleans

## Working w/SELinux ports
