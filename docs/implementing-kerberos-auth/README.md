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

## Adding Kerberos Principles

## Enabling Kerberos Authentication

## Adding Additional Hosts

