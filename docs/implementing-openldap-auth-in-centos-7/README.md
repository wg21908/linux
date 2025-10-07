# Implementing OpenLDAP Authentication in CentOS 7

## Installing the OpenLDAP Client

    server2 will be the OpenLDAP client.  server1 is the OpenLDAP server.  
    
    echo "192.168.56.105 server1.example.com" >> /etc/hosts
    ping server1.example.com    # verify that new entry in /etc/hosts is recognized
    
    yum install oddjob oddjob oddjob-mkhomedir
    
    systemctl start oddjobd
    systemctl enable oddjobd
    systemctl status oddjobd
    
    yum -y install openldap-clients nss-pam-ldapd

    authconfig-tui

    # Use LDAP, Use Shadwo Password, Use LDAP Authentication, Local authorization is sufficient

    # ldap://server1.example.com

    authconfig --enableldap --ldapserver=server1.example.com --ldapbasedn="dc=example,dc=com" --enablemkhomedir --update

    grep passwd /etc/nsswitch.conf

    getent passwd    # see fred user 

    su - fred

## Listing Users and Groups

    



