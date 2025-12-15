#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shellscript.logs"
SCRIPT_NAME=$(echo 14-colourspart3.sh | cut -d "." -f1)
LOG_FILES="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER #-p indicates create a folder if already present then do nothing
USERID=$(id -u)
echo "script execution started at $(date)" | tee -a $LOG_FILES
# here tee command is used to show the basic logs on screen too and store in log_files"
if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR: please run this is in root user $Y " | tee -a $LOG_FILES
    exit 1 #give anything other then 0 upto 127
else
    echo -e "you are running in root user $G" | tee -a $LOG_FILES
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo  -e " $G INSTALLING $2 SUCCESS " &>>$LOG_FILES
    else
        echo -e "INSTALLING $2 is failure $R" &>>$LOG_FILES
        exit 1
    fi
}

dnf list installed mysql -y
if [ $? -ne 0 ]
then
    echo -e " $Y mysql is not installed...going to install $N " | tee -a $LOG_FILES
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e " $G mysql is already installed ... nothing to do $N " | tee -a $LOG_FILES
fi

dnf list installed python3 -y
if [ $? -ne 0 ]
then
    echo -e " python3 is not installed...going to install  $Y" | tee -a $LOG_FILES
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e " python3 is already installed ... nothing to do $G" | tee -a $LOG_FILES
fi
