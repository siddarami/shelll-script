
#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "error::you are not a root user,please run as root user"
    exit 1
    fi 

yum install git -y 

if [ $? -ne 0 ]
then 
    echo "git installation failed"
    exit 1
else 
    echo "git installed successfully"
fi