#!/bin/bash
# Script that restarts a Minecraft server automatically.
#
# There's a few things to understand how this works. Load a config
# file from ~/.minecraftrc. This config file should have two arrays:
#
#   * tmux_minecraft_all: ALL Minecraft servers with tmux sessions
#   * tmux_minecraft_sp: Minecraft servers that are run locally on
#                        the machine (i.e. no BungeeCord)
#
# The benefit of doing this is that it lets you use BungeeCord to
# broadcast restart notifications across a network, but if you have
# standalone servers, you can use the notifications below.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Source the local config file
source ~/.minecraftrc

# Standalone servers: Broadcast notification for 1 hour
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cThe server will restart in one hour." Enter
done
sleep 30m

# Standalone servers: Broadcast notification for 30 minutes
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cThe server will restart in thirty minutes." Enter
done
sleep 15m

# Standalone servers: Broadcast notification for 15 minutes
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cThe server will restart in fifteen minutes." Enter
done
sleep 10m

# Standalone servers: Broadcast notification for 5 minutes
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cThe server will restart in five minutes." Enter
done
sleep 4m

# Standalone servers: Broadcast notification for 1 minute
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cThe server will restart in one minute." Enter
done
sleep 50s

# All servers: Run a hard `save-all` to be safe
for i in "${tmux_minecraft_all[@]}"
do
    tmux send-keys -t $i "save-all" Enter
done

# Standalone servers: Broadcast notification for server restart
for i in "${tmux_minecraft_sp[@]}"
do
    tmux send-keys -t $i "bc &cServer is restarting..." Enter
done
sleep 2s

# Stop all the Minecraft servers
for i in "${tmux_minecraft_all[@]}"
do
    tmux send-keys -t $i "stop" Enter
done
sleep 20s

# Restart all the Minecraft servers
for i in "${tmux_minecraft_all[@]}"
do
    tmux send-keys -t $i "./start.sh" Enter
done
