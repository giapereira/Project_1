#!/bin/bash

echo "Quick System Information Script"
date
echo "Machine Type Info: $MACHTYPE"
echo -e "Uname info: $(uname -a) \n"

echo "Hostname: $HOSTNAME"
echo -e "IP Information:  $(ip addr | head -n 9 | tail -n 1) \n"
echo -e "find / -type f -perm 777 >> ~/research/sys_info.txt"
echo "\n777 Files:" >> ~/research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m --sort=-%mem | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt






