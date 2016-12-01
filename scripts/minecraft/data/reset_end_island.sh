#!/bin/sh
# Quick script to reset the region files for the End Island

SERVERDIR=/home/minecraft/servers
SURVIVAL=/home/minecraft/servers/survival
THEEND=/home/minecraft/servers/survival/world_the_end/DIM1/region

echo "Reset The End Island (v0.1)"
echo "Author: Justin W. Flory (justinwflory.com)"

echo "Removing End region files..."
rm $THEEND/r.0.0.mca $THEEND/r.0.1.mca $THEEND/r.1.0.mca $THEEND/r.0.-1.mca $THEEND/r.-1.0.mca $THEEND/r.-1.-1.mca $THEEND/r.1.-1.mca $THEEND/r.1.1.mca
echo "End reset complete! Please restart the server."
