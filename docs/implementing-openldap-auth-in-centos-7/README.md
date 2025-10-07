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

    getent passwd        # see users

    getent group         # see groups

    grep ldap /etc/nsswitch.conf        

    # key config file: /etc/nsswitch.conf

    ssh tux@192.168.56.105

## Searching LDAP Users

    # Searching the directory

    ldapsearch -x -H ldap://server1.example.com -b dc=example,dc=com

    ldapsearch -x -LLL -H ldap://server1.example.com -b dc=example,dc=com

    ldapsearch -x -LLL -H ldap://server1.example.com -b dc=example,dc=com "(objectclass=account)"

    ldapsearch -x -LLL -H ldap://server1.example.com -b dc=example,dc=com "(&(objectclass=account)(uid=fred))"

    ldapsearch -x -LLL -H ldap://server1.example.com -b dc=example,dc=com "(&(objectclass=account)(uid=fred))" uidNumber uid            # return just 2 fields for fred

    ldapsearch -x -LLL -H ldap://server1.example.com -b dc=example,dc=com "(&(objectclass=account)(uid=fred))" > newuser.ldif
    ldapadd -x -W -D cn=Manager,dc=example,dc=com -f newuser.ldif

    getent passwd

    
    
    
    
    

