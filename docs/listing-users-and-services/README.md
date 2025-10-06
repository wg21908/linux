# Listing Users and Services

    cat /etc/passwd    # Users and sometimes passwords, these are local users

    # Integrated with remote repo of users; if integrated w/Active Directory we'd see those defined users
    getent passwd

    grep passwd /etc/nsswitch.conf   
    # files sss

    getent group    # Show me local or domain based groups

    getent network

    getent services
