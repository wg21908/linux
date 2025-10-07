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

    cat /etc/pam.d/system-auth             # directory pam.d holds configuration files that can use PAM, a password quality-based file

    # we will see password, .so are library files

    less /etc/security/pwquality.conf

    # check quality of pwd, 0-100, higher is better score
    pwscore

## Restricting or Limiting Access to Resources

    ulimit -a        # all restrictions are listed

    ulimit -u        # user processes, # of user processes allowed

    ulimit -u 10     # set limit

    ulimit -u        # shows 10 concurrent processes at any given time
    
    vi test.sh
        $0 in this script means that it calls itself, proof that running the script would start to error cause you reach the 10 process limit
            it says: "./test.sh: fork: retry: No child processes"
        
    sudo vi /etc/security/limits.conf

## Adding Login Time Restrictions

    # Control Access Time
    cd /etc/pam.d
    # Update 1 of 2
    sudo vi sshd
        # New line
        account required pam_time.so
    cd /etc/security
    # Update 2 of 2
    sudo vi time.conf
        *;*;tux|bob;Wk0800-1800
    



    

    
