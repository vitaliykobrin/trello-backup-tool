#!/usr/bin/env bash

trello_backup_tool_image_name=vitaliikobrin/trello-backup-tool

docker build -t $trello_backup_tool_image_name .
docker push $trello_backup_tool_image_name
