#!/bin/bash

echo "All variables passed to the script : $@"
echo "Number of variables : $#"
echo "Script name : $0"
echo "present working directory : $pwd"
echo "home directory of user : $home"
echo "which user is running script : $user
echo "PID of the script : $$
sleep 10 &
echo "PID of last command in background : $!"
echo "number : $n"
