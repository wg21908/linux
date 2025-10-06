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

    sudo lastb # read b "for bad" temp file, failed login attemps

# Audting su and sudo access

    cd /var/log
    ls

    ls secure*                # secure-<date> shows log rottation files

    less secure

    # 
    grep sudo seceure*

    # See when su command was used for files starting with secure
    grep su: secure*
