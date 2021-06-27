#!/bin/bash

output-$HOME/research/sys_info.txt
#output=-/research/sys_info.txt
 
if [ -d ~/research ]
then
	echo "Directory already exists"
else
	mkdir ~research
fi

if [ ! -d !/research ]
then
mkdir ~/research
fi

#Example #2 of using IF to create the directory only if it doesn't exist
if [ ! -d ~research ]
then
	mkdir ~/research
fi

mkdir !/research 2>/dev/null
 
echo "A Quick System Audit Script" >$output
date >> $output
echo  "" >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: ${uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $output
