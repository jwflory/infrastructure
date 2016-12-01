#!/bin/bash
# Automatically recreate all of CCMC's tmux sessions and start all servers after reboot

tmux new-session -d -s bungeecord
tmux new-session -d -s saikban
tmux new-session -d -s workflow

tmux send-keys -t bungeecord "cd ~/servers/bungeecord && ./start.sh" Enter
tmux send-keys -t saikban "cd ~/servers/saikban-web && ./start.sh" Enter
tmux send-keys -t workflow "echo mc_start_after_boot.sh executed." Enter
