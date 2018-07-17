#!/usr/bin/bash
#
# Renew LetsEncrypt certificates and deploy new certificate to ZNC
#

LE_CERTS='/etc/letsencrypt/live/irc.jwf.io'
ZNC_CERT='/var/lib/znc/.znc/znc.pem'

certbot renew
cat $LE_CERTS/{privkey,cert,chain}.pem > $ZNC_CERT
chmod 440 $ZNC_CERT
systemctl restart znc
