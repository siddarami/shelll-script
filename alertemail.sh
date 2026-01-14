
#!/bin/bash 



diskusage=$(df -hT | grep -vE 'tmpfs|Filesystem')
threshold=10

while IFS= read line 
do 
   uage=$( echo $line | awk '{print $6}' | cut -d '%' -f1)

done <<<$diskusage 