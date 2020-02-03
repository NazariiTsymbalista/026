#!/bin/bash
# Write a simple script called 'backup.sh' to backup (i.e. copy) only files and directories which has changed within the last 24 hours.
# Backups should be stored in a backup_dir/YYYYMMDD/, where YYYY-year, MM-month, DD-day_of_month. The script should take 2 parameters. 
# For example backup.sh $source_dir and $backup_dir

#$1=source_dir
#$2=backup_dir
mkdir -p $2`date +%Y%m%d`
find $1 -mtime -1 -type f,d  -exec rsync -r {} $2`date +%Y%m%d` \;
# only works with files, directory skips