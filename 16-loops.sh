#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shellscript.logs"
SCRIPT_NAME=$(echo "14-colourspart3.sh" | cut -d "." -f1)
LOG_FILES="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER #-p indicates create a folder if already present then do nothing

echo "script execution started at $(date)" | tee -a $LOG_FILES
# here tee command is used to show the basic logs on screen too and store in log_files"

USERID=$(id -u)
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


#for package in ${PACKAGES[@]}
for package in $@  #to pass the package in arguments manually will use this else above command
do 
  dnf list installed $package 
  if [ $? -ne 0 ]
  then
      echo -e " $package is not installed...going to install $N " | tee -a $LOG_FILES
      dnf install $package -y
      VALIDATE $? "$package"
   else
       echo -e " $G $package is already installed ... nothing to do $N " | tee -a $LOG_FILES
fi
  
done

