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

CI_URL="https://ci.ender.zone/job/EssentialsX"

# Source the local config file
source $HOME/.minecraftrc

# Download all the EssentialsX JARs
wget -O $HOME/EssentialsX.jar       $CI_URL/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-2.0.1.jar
wget -O $HOME/EssentialsXChat.jar   $CI_URL/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsXChat-2.0.1.jar
wget -O $HOME/EssentialsXSpawn.jar  $CI_URL/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsXSpawn-2.0.1.jar
wget -O $HOME/EssentialsXGeoIP.jar  $CI_URL/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsXGeoIP-2.0.1.jar

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
mv $HOME/EssentialsX.jar        $plugin_dir
mv $HOME/EssentialsXChat.jar    $plugin_dir
mv $HOME/EssentialsXSpawn.jar   $plugin_dir
mv $HOME/EssentialsXGeoIP.jar   $plugin_dir
