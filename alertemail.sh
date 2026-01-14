
#!/bin/bash 



diskusage=$(df -hT | grep -vE 'tmpfs|Filesystem')
threshold=10

while IFS= read line 
do 
   usage=$( $line | awk '{print $6}' | cut -d '%' -f1)
   echo $usage

done <<<$diskusage 
 