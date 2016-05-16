#!/bin/bash

LOG="$HOME/log/trash.log"
TRASH_STAT=$(/usr/bin/autotrash -d 90 --stat 2>&1)
TRASH_SUC=$?

printf "%s %d %q\n" $(date +%s) $TRASH_SUC "$TRASH_STAT" | tee -a "$LOG"
