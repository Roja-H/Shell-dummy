#!/bin/bash
#red = 31
#green = 32
#yellow = 33
 #soo on upto 38

#here we have to end the colour at hello by (\e [0m) if not colour continues to next line as well
echo -e "\e[31m hello \e[0m"
echo "how are you"