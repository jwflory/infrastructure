#!/usr/bin/bash
#
# Update the SSL certificates from LetsEncrypt and create a copy for InfluxDB
#
# Note: Script must be run as root.
#

INFLUX_SSL_DIR=/etc/ssl/certs/influxdb

if [ ! -d "$INFLUX_SSL_DIR" ]; then
    mkdir $INFLUX_SSL_DIR
fi

rm $INFLUX_SSL_DIR/{fullchain,privkey}.pem
cp /etc/letsencrypt/live/bryn.justinwflory.com/{fullchain,privkey}.pem $INFLUX_SSL_DIR
chown -R influxdb:influxdb $INFLUX_SSL_DIR
