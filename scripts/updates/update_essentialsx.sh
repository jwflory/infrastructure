#!/bin/bash
# Script to automatically update EssentialsX suite for Spigot servers
#
# Depends on having a ~/.minecraftrc config file with plugin_dir
# variable pointing towards wherever your plugins are
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Source the local config file
source ~/.minecraftrc

# Download all the EssentialsX JARs
wget -O ~/EssentialsX.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-2.0.1.jar
wget -O ~/EssentialsXChat.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsXChat-2.0.1.jar
wget -O ~/EssentialsXSpawn.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsXSpawn-2.0.1.jar
wget -O ~/EssentialsXGeoIP.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsXGeoIP-2.0.1.jar

# Delete any existing EssentialsX JARs
if [ -f $plugin_dir/EssentialsX.jar ]; then
    rm $plugin_dir/EssentialsX.jar
fi

if [ -f $plugin_dir/EssentialsXChat.jar ]; then
    rm $plugin_dir/EssentialsXChat.jar
fi

if [ -f $plugin_dir/EssentialsXSpawn.jar ]; then
    rm $plugin_dir/EssentialsXSpawn.jar
fi

if [ -f $plugin_dir/EssentialsXGeoIP.jar ]; then
    rm $plugin_dir/EssentialsXGeoIP.jar
fi

# Drop in the new JARs to replace the old ones
mv ~/EssentialsX.jar $plugin_dir
mv ~/EssentialsXChat.jar $plugin_dir
mv ~/EssentialsXSpawn.jar $plugin_dir
mv ~/EssentialsXGeoIP.jar $plugin_dir
