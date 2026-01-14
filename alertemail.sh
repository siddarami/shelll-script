
#!/bin/bash 



diskusage=$(df -hT | grep -vE 'tmpfs|Filesystem')
threshold=10

while IFS= read line 
do 
   usage=$( echo $line | awk '{print $6}' | cut -d '%' -f1)
   echo $usage
   partition=$( echo $line | awk '{print $1}')
   if [ $usage -gt $threshold ];
   then 
         message="alert: high disk usage on partition $partition with usage at $usage"
    fi

done <<<$diskusage 

echo "$message" 
 