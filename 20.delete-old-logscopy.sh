#!bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/logs/Shell-dummy-logs"
SCRIPT_NAME="echo $0 | cut -d "." -f1
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log
SOURCE_DIR="/home/ec2-user/app-logs"

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0]
then
    echo " please check and run the script in root user " 
    exit 1
else
    echo " Script is running in root user" 
fi


echo " script started running at : $(date)

log-file = $(find $SOURCE_DIR -name "*.log" -mtime +14)

while read -r roja
do
  echo " deleting this log files $roja "
  rm -rf $roja
done <<< $log-file

echo "all worked successfully" 