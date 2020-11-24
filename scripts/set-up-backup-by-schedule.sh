#!/usr/bin/env bash

if [[ -z $TRELLO_BACKUP_CRON ]]; then
	echo No schedule found for backup script
	exit 0
fi

cron_dir=/etc/cron.d
cron_file=$cron_dir/backup-cron
log_file=/var/log/cron.log

echo Set up scheduled Trello backup

mkdir -p $cron_dir
touch $cron_file
echo "$TRELLO_BACKUP_CRON /usr/src/script/make-backup.sh >> $log_file 2>&1" > $cron_file
echo >> $cron_file
cat $cron_file

chmod 0644 $cron_file
crontab $cron_file
touch $log_file
/usr/sbin/cron
