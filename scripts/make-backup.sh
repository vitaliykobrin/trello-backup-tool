#!/usr/bin/env bash

current_date_time=$(date '+%Y-%m-%d-%H-%M-%S')
backup_name=trello-backup-$current_date_time.tar.gz

print_log () {
	echo
    echo $(date '+%Y-%m-%dT%H:%M:%SZ') "|" $1
}

print_log "Prepare config.php ..."
envsubst '$TRELLO_API_KEY $TRELLO_APP_TOKEN' < "trello-backup-config.php.sample" > "config.php"

print_log "Run Trello backup app ..."
php trello-backup.php

print_log "Compress trello backup"
tar -zcvf $backup_name backup/
mv $backup_name ../output/

print_log Done
