#!/bin/bash

###############################################################################
# Please provide execute permissions for the script and run it with elevated  #
# priviliges, or you might permission issues while creating directory for the #
# archives                                                                    #
###############################################################################

ARCHIVE="logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz"
ARCHIVE_DIR="/var/log/logs_archived"

if [ -z "$1" ]; then
    echo "Error: No file specified to archive."
    exit 1
fi

if [ ! -d "$ARCHIVE_DIR" ];
then
	mkdir -p "$ARCHIVE_DIR"
fi

tar -zcvf "$ARCHIVE" "$1"

if [ "$?" -eq 0 ];
then
	mv "$ARCHIVE" "$ARCHIVE_DIR"/.
	echo -e "Log file archived successfully!\nName of the file: $ARCHIVE\nLocation of the file: $ARCHIVE_DIR/$ARCHIVE"
else
	echo "There was an error!"
	exit 1
fi
