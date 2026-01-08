
#!/bin/bash 


date=$(date)
script_name=$0
logfile=/tmp/$script_name-$date.log
userid=$(id -u)
if [ $userid -ne 0 ]
then 
    ehco "error::you are not a root user,please run as root user"
    exit 1
fi

r="\e[31m"
g="\e[32m"
n="\e[0m"
validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2... \e[31m failed"
        exit 1
    else 
        echo -e "$2.... \e[32m succeeded"
    fi
}

yum install git -y &>> $logfile
validate $? "installtaion git"
yum install mysql -y &>> $logfile
validate $? "installation mysql"