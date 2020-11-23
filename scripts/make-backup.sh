#!/usr/bin/env bash

current_date_time=$(date '+%Y-%m-%d-%H-%M-%S')
backup_name=trello-backup-$current_date_time.tar.gz

print_log () {
	echo
    echo $(date '+%Y-%m-%dT%H:%M:%SZ') "|" $1
}

cd ${0%/*}

print_log "Run Trello backup app ..."
/usr/local/bin/php trello-backup.php

print_log "Compress trello backup"
tar -zcvf $backup_name backup/
mv $backup_name /usr/src/output/
rm backup/*

print_log Done
