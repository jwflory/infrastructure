#!/bin/bash
#
# This script is a really simple way to update to the latest version
# of BungeeCord. It can be automated easily with cron. To use it
# effectively, create a .minecraftrc file in your home directory with
# the $bungeecord_dir variable set to the full path of wherever your
# BungeeCord install lives.
# 
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

source ~/.minecraftrc
if [ ! -f  BungeeCord.jar ]; then
    wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
fi
rm $bungeecord_dir/BungeeCord.jar
mv BungeeCord.jar $bungeecord_dir
