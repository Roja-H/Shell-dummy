#!bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_FOLDER
LOG_FOLDER="/var/logs/Shell-dummy-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=/home/ec2-user/app-logs

if [ $USERID -ne 0]
then
    echo "please check and run the script in root user" 
    exit 1
else
    echo "Script is running in root user" 
fi


echo "script started running at $(date)"

log-file=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath
do
    echo "Deleting file: $filepath" | tee -a $LOG_FILE
    rm -rf $filepath
done <<< $log-file

echo "Script executed successfully"