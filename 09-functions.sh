#!/bin/bash

USERID=$(id -u)
VALIDATE(){

if [ $? -ne 0 ]
 then
    echo "installation .... SUCCESS"
    exit 1
else 
    echo "installation ..... FAILURE"
fi

}

if [ $USERID -ne 0 ]
then
    echo "Error: run the code with root access"
    exit 1
fi


yum install mysql -y

VALIDATE $?


yum install postfix -y

VALIDATE $?