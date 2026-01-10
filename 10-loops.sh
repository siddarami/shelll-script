
date=$(date +%F)
logdir=/home/centos/shellscriptlogs
script_name=$0
logfile=$logdir/$script_name-$date.log


userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ];
then 
    echo -e "$R error: $N you are not a roor user,please run as root user"
    exit 1

fi

validate(){
    if [ $1 -ne 0 ];
    then 
        echo -e "$2... $R failes"
        exit 1
    else 
        echo -e "$2... $G success"
    fi
}


for i in $@
do 
    yum list installed $i &>> $logfile 
    if [ $? -ne o ];
    then 
        echo -e "$Y $i is not installed ,$N installing now.."
        yum install $i -y &>> $logfile
        validate $? "$i installation"
    else
        echo -e "$Y $i  is already installed $N"
    fi
done



