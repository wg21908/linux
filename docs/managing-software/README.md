# 

## Software management w/RPM

    dnf  install --downloadonly httpd

    tree /var/cache/dnf    

    cd /var/cache/dnf/appstream-<random chars>/packages/

    rpm -qa    # see all packages currently installed

    rpm -qa | grep http    # already installed

    rpm -qa | wc -l        

    rpm -qi nmap    # i for info on a package

    rpm -qi nmap     # what is i or included with it

    rpm -qpi httpd-
    
    rpm -qpl <package name ending w/.rpm>

    rpm -i <package name ending in .rpm>

    rpm -e nmap    # removing a package

    rpm -qf /etc/hosts   # q or query and f or file to get a package name

    rpm -qi setup or rpm -qi <package name>

    rpm -V setup    # V is verify

## w/DNF

    sudo  dnf -y install bash-completion

    dnf info bash-completion<tab tab>

    dnf --version

    dnf install http<tab tab>

    dnf deplist nmap    # see dependencies for nmap

    dnf list installed | more

    dnf list available | more

## Configure Software Repo(s)

    cd /etc/yum.repos.d/

    dnf info epel-release.noarch

    rpm -ql epel-release

    less rocky.repo

    dnf repolist        # To list my repos

    dnf repolist all      # All repos, even disabled

    vi local.repo
        [CentOS7]
        name=CentOS 7.2 Local Network
        baseurl=http://192.168.56.220/centos7/
        enabled=1
        gpgcheck=0

    yum repolist        # to see new local repo

    dnf remove nmap

    dnf install -y nmap        # Will install from local server created above

    




    
    
    




    
