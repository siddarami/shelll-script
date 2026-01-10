
userid=$(id -u)
R="\e[31m"
]

if [ $userid -ne 0 ];
then 
    echo -e " $R error:you are not a roor user,please run as root user"
    exit 1

fi
