#!/usr/bin/bash
#
# Sync IRC logs from ZNC service into jflory's home directory
#
# This script is a helper script to actually move the desired log files over
# from my personal log directory in ZNC to my home directory. There, I can
# generate new statistics with pisg on the logs and then place the generated
# HTML into the web server directory.
#
# Intended to be used by root user's crontab.
#

SCRIPT='/home/jflory/git/infrastructure/scripts/cortana/irc_logs_sync.sh'
MONTH=$(date -d "$D" '+%m')
YEAR=$(date -d "$D" '+%Y')

$SCRIPT -i /var/lib/znc/.znc/users/jflory7/moddata/log/freenode/\#fedora-commops/ -o /home/jflory/logs/fedora-commops/ -u "jflory"
$SCRIPT -i /var/lib/znc/.znc/users/jflory7/moddata/log/freenode/\#fedora-diversity/ -o /home/jflory/logs/fedora-diversity/ -u "jflory"
$SCRIPT -i /var/lib/znc/.znc/users/jflory7/moddata/log/freenode/\#\#jwf/ -o /home/jflory/logs/jflory7/ -u "jflory"
$SCRIPT -i /var/lib/znc/.znc/users/jflory7/moddata/log/freenode/\#rit-foss/ -o /home/jflory/logs/rit-foss/ -u "jflory"
$SCRIPT -i /var/lib/znc/.znc/users/jflory7/moddata/log/freenode/\#ritlug/ -o /home/jflory/logs/ritlug/ -u "jflory"
