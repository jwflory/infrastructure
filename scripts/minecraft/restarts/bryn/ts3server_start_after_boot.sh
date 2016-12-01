#!/bin/bash
# Automatically start a TeamSpeak3 server in a new tmux session after hard reboot

tmux new-session -d -s teamspeak
tmux send-keys -t teamspeak "cd ~/servers/teamspeak3 && ./ts3server_minimal_runscript.sh" Enter
