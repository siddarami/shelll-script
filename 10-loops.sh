
userid=$(id -u)

if [ $userid -ne 0 ];
then 
    echo -e "error:you are not a roor user,please run as root user"
    exit 1

fi
