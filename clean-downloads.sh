#!/bin/bash
(
    printf "%s\t%s\n" `date -Im` "Removing files older than 100 days from ~/Downloads"
    find "$HOME/Downloads/" -mtime +100 -printf 'Deleting\t%p\t%s\t%T@\n' -delete
) | tee -a ~/log/clean-downloads.log
