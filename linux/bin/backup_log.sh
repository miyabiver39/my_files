#!/bin/bash

# dir name
shm_dir='/dev/shm/'
log_dir='/var/log/'
backup_dir='/mnt/hdd/LOG/'

# back up file name
backup_filename="${shm_dir}log-`date '+%Y%m%d'`.zip"

# make zip file
zip -r ${backup_filename} ${log_dir}*

# copy to backup file
mv ${backup_filename} ${backup_dir}
