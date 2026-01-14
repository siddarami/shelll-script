
#!/bin/bash 

date=$(date +%F)
logdir=/appdir/
scriptname=$0
logfile=$/home/centos/logs/$scriptname-$date.log
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ];
    then 
       echo -e "$2.. $R failes" &>>$logfile
       exit 1
    else
        echo -e "$2... $G success" &>>$logfile
    fi 
}

if [ $userid -ne 0 ];
then 
    echo -e "$R error: $N you are not a root user,please run as root user"
    exit 1
fi

cp mongo.repo /etc/yum.repos.d/mongo.repo
validate $? "copying mongo repo file"
yum install mongodb-org -y
validate $? "installation mongodb"
systemctl enable mongod
validate $? "enabling mongod"
systemctl start mongod
validate $? "starting mongod"
sed -i 's/127.0.0.1/0.0.0.0' /etc/mongod.conf
systemctl restart mongod
validate $? "restarting mongod"


