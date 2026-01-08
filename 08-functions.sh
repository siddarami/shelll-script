
#!/bin/bash 


date=$(date)
script_name=$0
mkdir reddy 
logfile=/reddy/$script_name-$date.log
userid=$(id -u)
if [ $userid -ne 0 ]
then 
    ehco "error::you are not a root user,please run as root user"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2... failed"
        exit 1
    else 
        echo "$2.... succeeded"
    fi
}

yum install git -y &>> $logfile
validate $? "installtaion git"
yum install mysql -y &>> $logfile
validate $? "installation mysql"