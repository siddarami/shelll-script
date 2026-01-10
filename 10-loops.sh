
userid=$(id -u)
R="\e[31m"
N="\e[0m"

if [ $userid -ne 0 ];
then 
    echo -e "$R error: $N you are not a roor user,please run as root user"
    exit 1

fi
