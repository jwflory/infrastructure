#!/bin/sh
# An auto-update script for Spigot

SERVERDIR=/home/minecraft/servers
BACKUPDIR=/home/minecraft/backups
PROXY=/home/minecraft/servers/proxy
LOBBY=/home/minecraft/servers/lobby
SURVIVAL=/home/minecraft/servers/survival
CREATIVE=/home/minecraft/servers/creative
SPACE=/home/minecraft/servers/space
CCB=/home/minecraft/servers/ccb
DEVELOPMENT=/home/minecraft/servers/development
RIT_PROXY=/home/minecraft/servers/rit-proxy
RIT_SURVIVAL=/home/minecraft/servers/rit-survival
RIT_CREATIVE=/home/minecraft/servers/rit-creative

echo "Beginning auto-update!"

cd /home/minecraft/buildtools/
java -jar BuildTools.jar
cd paperspigot/
java -jar PaperTools.jar
cd /home/minecraft/
cp buildtools/spigot-*.jar servers/GLOBAL/spigot-update.jar
rm buildtools/spigot-*.jar
cp buildtools/paperspigot/paperspigot-*.jar servers/GLOBAL/paperspigot-update.jar
rm buildtools/paperspigot/paperspigot-*.jar

tmux send-keys -t proxy "alert &cServer update is ready to be applied. The network will restart in 30 seconds!" Enter
tmux send-keys -t rit-proxy "alert &cServer update is ready to be applied. The network will restart in 30 seconds!" Enter

sleep 30s

echo "Executing save-alls on the servers..."
tmux send-keys -t lobby "save-all" Enter
tmux send-keys -t survival "save-all" Enter
tmux send-keys -t creative "save-all" Enter
tmux send-keys -t space "save-all" Enter
tmux send-keys -t ccb "save-all" Enter
tmux send-keys -t development "save-all" Enter
tmux send-keys -t rit-survival "save-all" Enter
tmux send-keys -t rit-creative "save-all" Enter

sleep 2s

echo "Stopping servers..."
tmux send-keys -t proxy "alert &cServer is restarting..." Enter
tmux send-keys -t rit-proxy "alert &cServer is restarting..." Enter

tmux send-keys -t lobby "stop" Enter
tmux send-keys -t survival "stop" Enter
tmux send-keys -t creative "stop" Enter
tmux send-keys -t space "stop" Enter
tmux send-keys -t ccb "stop" Enter
tmux send-keys -t development "stop" Enter
tmux send-keys -t rit-survival "stop" Enter
tmux send-keys -t rit-creative "stop" Enter

sleep 10s

echo "Moving those JARs around!"
rm /home/minecraft/servers/GLOBAL/spigot.jar
rm /home/minecraft/servers/GLOBAL/paperspigot.jar
mv /home/minecraft/servers/GLOBAL/spigot-update.jar /home/minecraft/servers/GLOBAL/spigot.jar
mv /home/minecraft/servers/GLOBAL/paperspigot-update.jar /home/minecraft/servers/GLOBAL/paperspigot.jar

echo "Let's bring these suckers back to life."
tmux send-keys -t lobby "./start.sh" Enter
tmux send-keys -t survival "./start.sh" Enter
tmux send-keys -t creative "./start.sh" Enter
tmux send-keys -t space "./start.sh" Enter
tmux send-keys -t ccb "./start.sh" Enter
tmux send-keys -t development "./start.sh" Enter
tmux send-keys -t rit-survival "./start.sh" Enter
tmux send-keys -t rit-creative "./start.sh" Enter

echo "Auto-update complete!"
