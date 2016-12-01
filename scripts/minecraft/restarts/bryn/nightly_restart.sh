#!/bin/bash
# A simple script that restarts the servers nightly

tmux send-keys -t bungeecord "alert &cThe server will restart in one hour." Enter

sleep 30m

tmux send-keys -t bungeecord "alert &cThe server will restart in thirty minutes." Enter

sleep 15m

tmux send-keys -t bungeecord "alert &cThe server will restart in fifteen minutes." Enter

sleep 10m

tmux send-keys -t bungeecord "alert &cThe server will restart in five minutes." Enter

sleep 4m

tmux send-keys -t bungeecord "alert &cThe server will restart in one minute." Enter

sleep 50s

tmux send-keys -t bungeecord "alert &cServer is restarting..." Enter

sleep 2s

tmux send-keys -t bungeecord "end" Enter

sleep 20s

tmux send-keys -t bungeecord "./start.sh" Enter
