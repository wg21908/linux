# Implementing OpenLDAP and Firewall Configuration

## Install OpenLDAP

    hostname
      server1.example.com

    ip a s

    echo "192.168.56.105 server1.example.com" >> /etc/hosts

    ping server1.example.com

    netstat -ltn

    firewall-cmd --permanent  --add-service=ldap

    firewall-cmd --reload

    yum install -y openldap openldap-clients openldap-servers migrationtools

## Configure OpenLDAP

    cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG

    ls -l /var/lib/ldap/

    slaptest

    ls -l /var/lib/ldap/

    # Now shows DB files

    chown ldap.ldap /var/lib/ldap/*

    systemctl start slapd
    systemctl enable slapd
    systemctl status slapd

    netstat -ltn

    # Port 389 is LDAP port

    netstat -lt

    cd /etc/openldap/schema/

    ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f consine.ldif

    ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f nis.ldif

    # Create encrypted pwd for administrator
    slappasswd -s Password1 -n > rootpwd

    cat rootpwd # show encrypted password

    vi config.ldif
      # Modify olcRootPW: <value from rootpwd file

    ldapmodify -Y EXTERNAL -H ldapi:/// -f config.ldif

## Create the Directory Tree

    cat structure.ldfif

    ldapadd -x -W -D "cn=Manager,dc=example,dc=com" -f structure.ldif

    ldapsearch -x -W -D "cn=Manager,dc=example,dc=com" -b "dc=example,dc=com" -s sub "(objectclass=organizationalUnit)

## Adding Users and Groups

    
    
    
