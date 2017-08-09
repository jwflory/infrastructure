#!/bin/bash
# Automatically restart all tmux sessions on a reboot and restart
# whatever process was running inside them.
# 
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Start the tmux sessions
tmux new-session -d -s creative
tmux new-session -d -s development
tmux new-session -d -s lobby
tmux new-session -d -s survival
tmux new-session -d -s rit-survival
tmux new-session -d -s workflow

# Restart the processes
tmux send-keys -t creative "cd ~/servers/creative && ./start.sh" Enter
tmux send-keys -t development "cd ~/servers/development && ./start.sh" Enter
tmux send-keys -t lobby "cd ~/servers/lobby && ./start.sh" Enter
tmux send-keys -t survival "cd ~/servers/survival && ./start.sh" Enter
tmux send-keys -t rit-survival "cd ~/servers/rit-survival && ./start.sh" Enter
tmux send-keys -t workflow "echo Hello there! And welcome back!" Enter
