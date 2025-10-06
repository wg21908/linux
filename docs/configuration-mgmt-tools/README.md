# Configuration Management Tools

## Install Puppet

    yum install puppet

    # puppet comes from epel repo

    puppet --version

## Extracting Data w/Facter

    # Check hostname and domain

    hostnamectl # display hostname

    facter
    facter | grep hostname
    facter | grep domain
    facter | grep virtual

        
## Using amd Applying Puppet Manifests

    # Manifest or .pp file

    cd /etc/puppet/

    ls

    mkdir manifests && cd manifests

    pwd

    vi site.pp
       node "server1.example.com" {
           file { '/etc/yum.repos.d/local.repo': 
               ensure => "file", 
               owned => "root",
               group => "wheel",
               mode => "644",
               content => "[localc7]
                name=CentOS 7 Local
                baseurl=http://192.168.56.220/centos7
                gpgcheck=0
                enabled=1
                "}
                       }

    cd /etc/yum.repos.d/
    rm -f local.repos
    cd /etc/puppet/manifests
    puppet apply site.pp
    cd /etc/yum.repo.s/
    cat local.repo
    
    
