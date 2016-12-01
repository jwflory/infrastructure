#!/bin/sh
# An auto-update script for EssentialsX

rm EssentialsX.jar && wget -O EssentialsX.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-2.0.1.jar
rm EssentialsXChat.jar && wget -O EssentialsXChat.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsXChat-2.0.1.jar
rm EssentialsXSpawn.jar && wget -O EssentialsXSpawn.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsXSpawn-2.0.1.jar
rm EssentialsXGeoIP.jar && wget -O EssentialsXGeoIP.jar https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsXGeoIP-2.0.1.jar
