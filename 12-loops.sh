#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0]
then 
    echo -e "$R ERROR: Please run the code with sudo access $N"
    exit 1
fi

for i in $@
do 
    yum install $i -y
done