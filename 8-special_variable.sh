#!/bin/bash

echo "All variables passed to the script : $@"
echo "Number of variables : $#"
echo "Script name : $0"
echo "present working directory : $PWD"
echo "home directory of user : $HOME"
echo "which user is running script : $USER
echo "PID of the script : $$
sleep 10 &
echo "PID of last command in background : $!"
echo "exit status in shell scripting : $?"
