#!/bin/sh
# A script to test sending remote commands to tmux sessions

date=$(date +A%)

tmux send-keys -t survival "say Cron Test" Enter
