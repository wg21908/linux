# Manage Login Scripts

## Login Scripts in CentOS 7

    System-wide environment profiles
      - /etc/profile
      - /etc/bashrc

    Template user environment
      - /etc/skel

    Difference login and non-login shell
      - su
      - su -
      - su -l
    
    Login shell (su -, su -l); full environment is set
      /etc/profile
      ~/.bash_profile
      ~/.bashrc
      /etc/bashrc

    Non-login shell (mising whole profile structure)
       ~/.bashrc
       /etc/bashrc
    
## Investigating the Executive Order

    su -l        # to root account, - and -l are the same, no usersname defaults to root acct    

    echo $USER    # root user

    id        # user and group id are root values

    exit        # runs logout script

    su        # switch to root acct, non-login shell, home directory will still be user changing from

    echo $USER        # still shows user changed from

    su -l        # now root user

    
     
## System Login Scripts

## Home Directory Templates
