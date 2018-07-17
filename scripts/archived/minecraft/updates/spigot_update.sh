#!/bin/bash
# Script to automatically update PaperSpigot servers to the latest
# version of PaperSpigot and optionally apply it to all servers.
#
# Important details to note:
#  * Must have a .minecraftrc in home directory
#     * ps_install_dir: Directory to install PaperSpigot
#     * tmux_minecraft_all: Array of all tmux session names
#  * Argument: "restart"
#     * If passed, will restart all Minecraft servers to apply update
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Source the local config file
source ~/.minecraftrc

# Download the newest version of PaperSpigot
wget -O $ps_install_dir/paperspigot-tmp.jar https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar

# See if a older backup JAR exists; if so, delete it
if [ -f $ps_install_dir/paperspigot-last.jar ]; then
    rm $ps_install_dir/paperspigot-last.jar
fi

# Rename the current JAR to a different name (as a backup)
if [ -f $ps_install_dir/paperspigot.jar ]; then
    mv $ps_install_dir/paperspigot.jar $ps_install_dir/paperspigot-last.jar
fi

# Drop in the new version of PaperSpigot
mv $ps_install_dir/paperspigot-tmp.jar $ps_install_dir/paperspigot.jar

# If "restart" argument passed, restart all servers after updating
if [ "$1" = "restart" ]; then

    # Send out quick update alert
    for i in "${tmux_minecraft_all[@]}"; do
        tmux send-keys -t $i "bc &6Server update is ready to be applied! &cServer is restarting in 30 seconds..." Enter
    done
    sleep 30s

    # Save all data on the server just in case
    for i in "${tmux_minecraft_all[@]}"; do
        tmux send-keys -t $i "save-all" Enter
    done

    # Stop all Minecraft servers
    for i in "${tmux_minecraft_all[@]}"; do
        tmux send-keys -t $i "stop" Enter
    done
    sleep 20s

    # Restart all the Minecraft servers
    for i in "${tmux_minecraft_all[@]}"; do
        tmux send-keys -t $i "./start.sh" Enter
    done

fi
