#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR: please run this is in root user $Y "
    exit 1 #give anything other then 0 upto 127
else
    echo -e "you are running in root user $G" 
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo  -e " $G INSTALLING $2 SUCCESS "
    else
        echo -e "INSTALLING $2 is failure $R"
        exit 1
    fi
}

dnf list installed mysql -y
if [ $? -ne 0 ]
then
    echo -e " $Y mysql is not installed...going to install "
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e " $G mysql is already installed ... nothing to do "
fi

nf list installed python3 -y
if [ $? -ne 0 ]
then
    echo -e " python3 is not installed...going to install  $Y"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e " python3 is already installed ... nothing to do $G"
fi
