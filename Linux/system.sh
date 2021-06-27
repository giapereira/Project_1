#!/bin/bash

htop >> ~/Projects/backups/freemem/free_mem.txt
lsof >> ~/Projects/backups/openlist/open_list.txt
df >> ~/Projects/backups/diskuse/disk_usage.txt
du >> ~/Projects/backups/freedisk/free_disk.txt
