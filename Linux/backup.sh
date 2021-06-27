#!/bin/bash

#Create /var/backup if it doesn't exist
mkdir -p /var/backup

#Create backup
tar cvf /var/backup/home.tar /home

#Move the file to a 
mv /var/backup/home.tar /var/backup/home.20210412.tar

tar cvf /var/backup/system.tar /home


ls -lh /var/backup > /var/backup/file_report.txt

free -h  > /var/backup/disk_report.txt
