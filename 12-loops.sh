#!/bin/bash


USERID=$(id -u)
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscripts-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR: Please run the code with sudo access $N"
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $Y installing $2....$R FAILURE $N"
        exit 1
    else 
        echo -e " $Y installing $2.....$G SUCCESS $N"
    fi
}

for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo "let's install the $i package"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y the package $i is already installed $N"
    fi
done