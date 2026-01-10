

#!/bin/bash

date=$(date)
script_name=$0
logfile=/tmp/$script_name-$date.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

#validate function 

/*
validate(){
     if [ $1 -ne 0 ];
     then 
            echo -e "$2... $R failes"
            exit 1
        else 
            echo -e "$2... $G success"
     fi
} 
*/



userid=$(id -u)
if [ $userid -ne 0 ];
then 
    echo "error:you are nor a root user,please run as root user"
    exit 1
fi

while read line 
do 
    yum list installed $line &>> $logfile 
    if [ $? -ne 0 ]
    then 
        echo -e "$line is not installed,$G installing now.."
        yum install $line -y &>> $logfile
        #validate $? "installation $line"
        if [ $? -ne 0 ];
        then 
            echo -e "$line installation $R failes"
            exit 1
        else 
            echo -e "$line installation $G success"
        fi
    else
        echo -e " $G $line is alredy installed  $N"
    fi
done 

# done <<< input file for while loop
 
