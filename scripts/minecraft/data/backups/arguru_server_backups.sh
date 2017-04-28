#!/bin/bash
# A script to backup all servers using duply
#

echo "Beginning backups..."

echo "Backing up global plugin directory..."
duply plugindir backup
echo "Success!"

echo "Backing up survival... (this could take a while)"
duply survival backup
echo "Success!"

echo "Backing up lobby..."
duply lobby backup
echo "Success!"

echo "Backing up creative..."
duply creative backup
echo "Success!"

echo "Backing up space..."
duply space backup
echo "Success!"

echo "Backing up development..."
duply development backup
echo "Success!"

echo "Backing up RITcraft Survival..."
duply rit-survival backup
echo "Success!"

echo "All done! Please double-check file integrity."
