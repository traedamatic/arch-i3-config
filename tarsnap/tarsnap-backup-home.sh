#!/bin/bash

echo "Tarsnap backup start of home folder at $(date +%Y-%m-%d_%H-%M-%S)" >> /var/log/weekly-backup.log

/usr/bin/tarsnap -c \
  -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
	--exclude "/home/matic/.cache" \
	--exclude "node_modules/*" \
	--exclude "/home/matic/Downloads" \
  /root &> /var/log/weekly-backup.log

#/usr/bin/tarsnap --print-stats --dry-run --no-default-config -c /root &> /var/log/weekly-backup.log

echo "Tarsnap backup end of home folder at $(date +%Y-%m-%d_%H-%M-%S)" >> /var/log/weekly-backup.log
