#!/bin/bash

#define variable for log file location
LOGFILE="logs"
MAXSIZE=100
: << 'COMMENT' 
#To roatate a file 
if [[ $(wc -c < "$LOGFILE") -gt "$MAXSIZE" ]];then
    mv "$LOGFILE" "$LOGFILE.old"
    touch "$LOGFILE"
fi
#to rotate a folder
COMMENT
DIR_SIZE=$(du -sb "$LOGFILE" | awk '{print $1}')
TIMESTAMP=$(date +"%Y-%m-%d")
if [[ "$DIR_SIZE" -gt "$MAXSIZE" ]];then
    mv "$LOGFILE" "${LOGFILE}_backup_$TIMESTAMP"
    mkdir "$LOGFILE"
    echo "Log Rotation Done: $LOGFILE --> ${LOGFILE}_backup_$TIMESTAMP"
else
    echo "Size not exceeded"
fi

