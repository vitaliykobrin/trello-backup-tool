#!/usr/bin/env bash

print_log () {
	echo
    echo $(date '+%Y-%m-%dT%H:%M:%SZ') "|" $1
}

print_log "Prepare config.php ..."
envsubst '$TRELLO_API_KEY $TRELLO_APP_TOKEN' < "trello-backup-config.php.sample" > "config.php"
