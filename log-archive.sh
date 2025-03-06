#!/bin/bash

ARCHIVE="logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz"
ARCHIVE_DIR="/var/log/logs_archived"

if [ ! -d "$ARCHIVE_DIR" ];
then
	mkdir -p "$ARCHIVE_DIR"
fi

tar -zcvf "$ARCHIVE" "$1"

if [ "$?" -eq 0 ];
then
	mv "$ARCHIVE" "$ARCHIVE_DIR"/.
	echo -e "Log file archived successfully!\nName of the file: $ARCHIVE\nLocation of the file: $ARCHIVE_DIR/$ARCHIVE"
fi



