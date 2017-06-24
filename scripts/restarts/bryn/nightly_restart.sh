#!/bin/bash
# Script that restarts a BungeeCord server automatically.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

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
