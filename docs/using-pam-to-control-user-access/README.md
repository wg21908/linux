# Using Pluggable Authentication Modules (PAM) to Control User Access

## Automate Home Directory Creation at User Login

    ls /etc/pam.d/

    ls /lib64/security/

    ls /etc/security/

    sudo vi /etc/login.defs
      CREATE_HOME yes # no will not automatically create home directory

    sudo useradd bob # as no, won't have a /home/bob directory

    grep bob /etc/passwd  # will show bob's home directory path despite it not yet existing

    sudo passwd bob       # to setup bob's password

    rpm -qa | grep oddjob

    systemctl enable oddjobd
    systemctl start oddjobd
    systemctl status oddjobd

    sudo authconfig --enablemkhomedir --update

    sudo -i

    cd /etc/pam.d

    grep mkhomedir *

    su - bob # will cause home directory creation

    pwd # shows bob's home directory

## Configure Password Policies



    
