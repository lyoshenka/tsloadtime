# tsloadtime
Page load time script for topscore

## Install

just clone this repo

## Run

To run once:

    ./loadtime.sh http://ultimatecentral.com
    
To run regularly, add this to your crontab:

    * * * * * /home/grin/bin/cronic /home/grin/code/tsloadtime/loadtime_uc_cron.sh

To get stats on e.g. total load times:

    cat *.csv | cut -d',' -f14 | ./stat.sh
