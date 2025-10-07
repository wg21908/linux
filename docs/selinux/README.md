# SELinux

Is-a: Mandatory access control list  

FYI: Apparmor is the same thing as above  

## View SELinux status & Contexts

    ls -Z <file>

    # tell me whether SELinux is enforcing or permissive
    getenforce                   # get mode

    sestatus                     # overall SELinux status

    cat /etc/selinux/config

    # Set to permissive, allow to happen but log errors
    setenforce 0

    geten                         # Shows getenforce and getent files

    getenforce # shows Permissive

    # Enforce and log it
    setenforce 1

    /etc/selinux/config         # is file

    # Look at users
    id -Z # shows unconfined

    # look at processes
    ps -Z <pid>                 # see type unconfined_t

    ps -Zp $(pgrep sshd)        # type is: sshd_t
    
## View SELinux logs

    tail /var/log/audit/audit.log                    # SELinux logs to this file

    ausearch -m avc                                 # shows access denieds, this allows us to search

    ausearch -m avc -ts recent

    ls -Z <file>

    chcon -t unlabeled_t /etc/shadow

    ls -Z /etc/shadow
   
    # Restore file to its original
    restorecon /etc/shadow
   
    ls -Z /etc/shadow

    semanage fcontext -l         # l for list

    semanage fcontext -l | grep /etc/shadow

    cd /etc/selinux/targeted/contexts/files/
    ls

## Working w/SELinux booleans

    getsebool -a | wc -l               # See all booleans

    semanage boolean -l                # viewing booleans

    getsebool httpd_read_user_content        # seeing value of something

    setsebool !$ on        # not persistent, only for current session

    ls -l /etc/selinux/targeted/policy        # policy last updated, won't change for non-persistent

    # make permanent
    setsebool -P httpd_read_user_content on        # -P means permanent

    !ls     # show policy last  updated, this time, will see date difference since it is a permanent/persistent change
    
## Working w/SELinux ports

    semanage port -l        # list all selinux ports types being listed

    semanage port -l | grep ssh        # allowed to use port 22, shows ssh_port_t in output

    semanage port -a -at ssh_port_t -p tcp 2222

    !ls # run last command that begain with ls, which was ls -l /etc/selinux/targeted/policy/
