# Extending Permissions with ACLs

## List ACL support in the filesystem and kernel

    # Will system suport ACLs?
    ls /boot/config-<tab>*    # will see 3 configuration files, which kernel we using, identify with `uname -r`
    grep ACL /boot/config-$(uname -r)    # Will show kernel settings currently in play

    mount | grep data

    sudo tune2fs -l /dev/sdb6 | grep -i default   # -l is for list

    Support exists for ext4 and xfs

## Display ACLs

    cd ~
    ls -l
    drwxr-xr-x.        # the dot at the end, indicates suport for ACL, if see +, its supported and in play/being-used
    getfacl df.sh      

## Configure default ACLs for a directory

    mkdir test-acl
    ls -ld test-acl/
    # see ., supported but not set
    getfacl test-acl/
    umask    # shows 0002
    setfacl -m d:0:--- test-acl/        # -m is for modify
    !get

    touch test-acl/file1
    # file1 has no permissions for others, since the default acl we set on the directory

    ls -ld test-acl/
    # shows the + sign at the end of the permission block

    setfacl -d -m  u:bob:rw test-acl/       # or can do -dm 
    getfacl test-acl/

    touch test-acl/file2
    ls -l test-acl/file*
    # file1 has no ACL, file2 does have the ACL
    getfacl test-acl/file2
    # user bob has r+w privs

## Add Additional ACE

    

    
