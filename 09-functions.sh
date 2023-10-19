#!/bin/bash

USERID=$(id -u)
VALIDATE(){

if [ $1 -ne 0 ]
 then
    echo "$2 .... FAILURE"
    exit 1
else 
    echo "$2 ..... SUCCESS"
fi

}

if [ $USERID -ne 0 ]
then
    echo "Error: run the code with root access"
    exit 1
fi


yum install mysql -y

VALIDATE $? "INSTALLING MYSQL"
#VALIDATE ARGUMENT 1 AS $1 ARGUMENT 2  $2

yum install postfix -y

VALIDATE $? "INSTALLING POSTFIX"
#VALIDATE ARGUMENT 1 AS $1   ARGUMENT 2  $2