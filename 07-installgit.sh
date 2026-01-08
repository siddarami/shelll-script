
#!/bin/bash 

userid=$(id -u)

if [ $userid -ne o ]
then 
    echo "you are not a root user,please run as root user"
    exit 1
    fi 