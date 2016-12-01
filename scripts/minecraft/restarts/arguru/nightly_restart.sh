#!/bin/bash
# A simple script that restarts the servers nightly

tmux send-keys -t rit-survival "bc &cThe server will restart in one hour." Enter

sleep 30m

tmux send-keys -t rit-survival "bc &cThe server will restart in thirty minutes." Enter

sleep 15m

tmux send-keys -t rit-survival "bc &cThe server will restart in fifteen minutes." Enter

sleep 10m

tmux send-keys -t rit-survival "bc &cThe server will restart in five minutes." Enter

sleep 4m

tmux send-keys -t rit-survival "bc &cThe server will restart in one minute." Enter

sleep 50s

tmux send-keys -t lobby "save-all" Enter
tmux send-keys -t survival "save-all" Enter
tmux send-keys -t creative "save-all" Enter
tmux send-keys -t space "save-all" Enter
tmux send-keys -t development "save-all" Enter
tmux send-keys -t rit-survival "save-all" Enter

tmux send-keys -t rit-survival "bc &cServer is restarting..." Enter

sleep 2s

tmux send-keys -t lobby "stop" Enter
tmux send-keys -t survival "stop" Enter
tmux send-keys -t creative "stop" Enter
tmux send-keys -t space "stop" Enter
tmux send-keys -t development "stop" Enter
tmux send-keys -t rit-survival "stop" Enter

sleep 20s

tmux send-keys -t lobby "./start.sh" Enter
tmux send-keys -t survival "./start.sh" Enter
tmux send-keys -t creative "./start.sh" Enter
tmux send-keys -t space "./start.sh" Enter
tmux send-keys -t development "./start.sh" Enter
tmux send-keys -t rit-survival "./start.sh" Enter
