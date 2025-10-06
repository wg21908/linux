# Managing Software

## w/RPM

    dnf  install --downloadonly httpd

    tree /var/cache/dnf    

    cd /var/cache/dnf/appstream-<random chars>/packages/

    rpm -qa    # see all packages currently installed

    rpm -qa | grep http    # already installed

    rpm -qa | wc -l        

    rpm -qi nmap    # i for info on a package

    rpm -qi nmap     # what is i or included with it

    rpm -qpi httpd-
    
    rpm -qpl <package name ending w/.rpm>        # query, ?, list

    rpm -i <package name ending in .rpm>        # install

    rpm -e nmap    # removing a package

    rpm -qf /etc/hosts   # q or query and f or file to get a package name

    rpm -qi setup or rpm -qi <package name>

    rpm -V setup    # V is verify, what we think is installed is actually installed

## w/DNF

    sudo  dnf -y install bash-completion

    dnf info bash-completion<tab tab>

    dnf --version

    dnf install http<tab tab>

    dnf deplist nmap    # see dependencies for nmap

    dnf list installed | more

    dnf list available | more

    dnf remove bash-completion        # remove it

## Configure Software Repo(s)

    cd /etc/yum.repos.d/

    dnf info epel-release.noarch

    rpm -ql epel-release

    less rocky.repo

    dnf repolist        # To list my enabled repos

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

## DNF Cache

    /var/cache/yum

    cd /etc/yum.repos.d

    yum makecache                    # Download metadata from repositor

    dnf clean all

## Kernel Updates

    uname -r                         # Kernel details

    dnf update kernel                # Installs new kernel, doesn't update

    vi /etc/dnf.conf
        Add `exclude=kernel*`        # dnf update wouldn't update kernal

    # Recommendation is to not update/install kerel in normal update of Linux packages

## Using Source RPMs

    cd /etc/yum.repos.d

    yum repolist

    yum repolist all                 # see disabled ones

    grep ^enabled CentOS-Sources.repo

    sed -i 's/^enabled=0/enabled=1/' CentOS-Sources.repo

    yum repolist                     # Now shows bigger number of repos that are enabled

    yum install -y yum-utils         # Program to use yum downloader

    yumdownloader --source zsh       # Get source rpm for zsh

    yum install ncurses-devel

    rpm -i zsh-<.....>

    cd ~/rpmbuild/SOURCES

    tar -xjf zsh..tar.bz2

    cd zsh... ; ./configure

    make ; make install

## Managing Services

    yum install httpd

    nmap localhost        # dont' see webserver, not yet listening on port 80

    systemctl status httpd.service

    systemctl enable httpd.service

    systemctl status httpd.service

    systemctl start httpd.service

    systemctl status httpd.service

    namp localhost        # now listening on port 80

    # Will enable and start the service, all in one shot, better than above
    systemctl enable httpd --now

    # Disable and stop it in one shot
    systemctl disable httpd --now

    
