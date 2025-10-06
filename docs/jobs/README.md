# Jobs

## crond

If system is down, crond becomes useless, when system comes up, past jobs will not run.  

    systemctl status crond

    # Configuration file
    /etc/crontab
    
    /etc/cron.d
    
    crontab -l  # list cronjobs we have  
    crontab -e  # edit cronjob(s)
    crontab -r  # remove job(s)
    
## anacron

Tool that will handle running jobs if machine is shutdown for a period of time.  

    /etc/anacrontab

    systemctl status crond

    ls /etc/cron.hourly

    /usr/bin/anacron -s

## at

Run once-off jobs

    # Status, is it running?
    systemctl status atd

    at noon # opens at cli

    <CTRL-D> # to end the job

    # See what jobs are in the queue
    atq

    at wednesday # enters cli


    atrm 4 # remove this one
    atrm 3
    atq # list jobs

    at 13:23 jue 23
    ls /etc
    <CTRLL-D>

    atrm 6 # remove job 6

    # Stop someone from running jobs
    ls /etc/*.deny # /etc/at.deny /etc/cron.deny /etc/hosts.deny

    

    
