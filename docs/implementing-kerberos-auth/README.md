# Implementing Kerberos Authentication

## Configuring NTP

    yum -y  install ntp

    vi /etc/ntp.conf

    systemctl enable ntpd
    systemctl start ntpd
    systemctl status ntpd

    ntpq -p # for peers

    firewall-cmd --add-service=ntp --permanent

    firewall-cmd --reload

    vi /etc/hosts
      
## Configuring the Kerberos Services

    yum -y install rng-tools

    systemctl start rngd
    systemctl enable rngd
    systemctl status rngd

    # fails to start, buggy

    vi /usr/lib/systemd/system/rngd.service
        # Change to ExecStart=/sbin/rngd -f -r /dev/urandom

    systemctl daemon-reload
    systemctl start rngd
    systemctl status rngd

    # Kerberos install

    yum -y install krb5-server krb5-workstation pam_krb5

    cd /var/kerberos/krb5kdc/

    cat kadm5.acl

    vi kdc.conf

    vi /etc/krbn5.conf

    kdb5_util create -s -r EXAMPLE.COM

    systemctl start krb5kdc kadmin         # key distribution server
    systemctl enable krb5kdc kadmin

## Adding Kerberos Principles

## Enabling Kerberos Authentication

## Adding Additional Hosts

