# Auditing 

## Auditing Login Events / Auditing User Logins

    lastlog                       # every user account, whether logged in or not
    lastlog | grep -v "Never"     # only users who've logged in

    last # logged in users

    last -n 10 # restrict to 10 lines

    last | grep "still"           # list users still logged in

    last reboot

    last <user>

    last -n 10 <user>

    sudo lastb # read b "for bad" temp file, failed login attempts

## Audting su and sudo access

    cd /var/log
    ls

    ls secure*                # secure-<date> shows log rottation files

    less secure

    # 
    grep sudo seceure*

    # See when su command was used for files starting with secure
    grep su: secure*

## Scripting with AWK

    # Search for sudo, print 5, 6, and 7 on file called secure
    awk '/sudo/ { print $5, $6, $14 } ' secure


    # While in script, need variables to expand
    awk "/$1/ { print \$5, \$6, \$14 }" $2

## rsyslog

    cd /etc
    ls rsyslog*  # has rsyslog.conf rsyslog.d; rsyslog.conf is the main configuration file
    /etc/rsyslog.conf

    vi /etc/rsyslog.conf

    # Add line
    local1.info /var/log/andrew

    systemctl restart rsyslogd
    systemctl status rsyslogd

    logger -p local1.warn "Test message"    
    tail /var/log/messages
    tail /var/log/andrew
    
## Rotate Log files with logrotate

    cd /etc/cron.daily/

    pwd
    ls

    # logrotate is in this location

    cd /etc/
    less logrotate.conf

    # no restart of service needed

    ls /var/log/andrew*

    logrotate /etc/logrotate.conf

    ls  /var/log/andrew*

## Maintain logs with journalctl

    journalctl           # no switches, complete log, can page through
    
    journalctl -n        # last 10 entries
    journalctl -n 15     # last 15 entries
    
    journalctl -f        # follow end of journal log
    
    journalctl -b        # since last boot

    # Main configuration file
    vi /etc/systemd/journald.conf

    # reboot required for journald.conf updates

    # by service
    journalctl -u sshd.service        # sshd service

    # By dates
    journalctl --since "2026-01-21 12:00:00"
    journalctl --since "10 minutes ago"
    journalctl --since "5 minutes ago"

    # see journal log files being written too 
    journalctl --list-boots        # 0 is current log, -1 last log...

    journalctl -b -1               # look at previous log  
