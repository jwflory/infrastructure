#!/bin/bash
# Simple script to just change the names of JARs because I'm lazy and this is just going to make it so much CLEANER

cd ~/servers/GLOBAL
mv paperspigot.jar paperspigot.jar.194
mv paperspigot.jar.110 paperspigot.jar
cd ~/servers/survival
rm survival-spigot.jar
ln -s ~/servers/GLOBAL/paperspigot.jar.194 ~/servers/survival/survival-spigot.jar