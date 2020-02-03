#!/bin/bash

#Write a script 'auto_update.sh' which will install updates for your Linux system every week.
# The updated log file should be stored in /var/log/update-YYYYMMDD.log, where YYYY-year, MM-month, DD-day_of_month.
# ***Extra task: configure log rotation to update-YYYYMMDD.log every month and keep the last 3 log files compressed.
work_dir=$(pwd)
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
cat > cron.txt <<EOF 
0 5 * * 1 $work_dir/auto_update.sh 2>&1 >> /var/log/update-`date +%Y%m%d`.log
EOF
crontab -l | cat - cron.txt >crontab.txt && crontab crontab.txt
