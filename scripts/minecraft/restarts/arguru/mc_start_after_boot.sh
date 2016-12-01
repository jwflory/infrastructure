#!/bin/bash
# Automatically recreate all of CCMC's tmux sessions and start all servers after reboot

tmux new-session -d -s creative
tmux new-session -d -s development
tmux new-session -d -s lobby
tmux new-session -d -s space
tmux new-session -d -s survival
tmux new-session -d -s rit-survival
tmux new-session -d -s workflow

tmux send-keys -t creative "cd ~/servers/creative && ./start.sh" Enter
tmux send-keys -t development "cd ~/servers/development && ./start.sh" Enter
tmux send-keys -t lobby "cd ~/servers/lobby && ./start.sh" Enter
tmux send-keys -t space "cd ~/servers/space && ./start.sh" Enter
tmux send-keys -t survival "cd ~/servers/survival && ./start.sh" Enter
tmux send-keys -t rit-survival "cd ~/servers/rit-survival && ./start.sh" Enter
tmux send-keys -t workflow "echo mc_start_after_boot.sh executed." Enter
