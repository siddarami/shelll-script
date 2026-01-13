

#!/bin/bash 

log_path="/home/centos/logs"
date=$(date +%F)
script_name=$0
logfile=/home/centos/$script_name-$date.log

deleted_files=$(find $log_path -name "*.log" -type f -mmin +1)

while read file
do 
    echo "deleting file :$file" &>> $logfile
    rm -rf $file  &>> $logfile

done <<< "$deleted_files"  