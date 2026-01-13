

#!/bin/bash 

log_path="/home/centos/logs"
date=$(/usr/bin/date +%F)
script_name=$(basename "$0")
audit_path="/home/centos/audit-logs"
mkdir -p "$audit_path"

logfile=$audit_path/${script_name}-${date}.log

deleted_files=$(/usr/bin/find $log_path -name "*.log"  -type f -mmin +1)

while read file
do 
    echo "deleting file :$file" &>> $logfile
    /bin/rm -rf $file  &>> $logfile

done <<< "$deleted_files"  