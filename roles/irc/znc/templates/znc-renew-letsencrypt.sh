#!/bin/bash
ZNC_FQDN="{{ znc_fqdn }}"
ZNC_CERT="/var/lib/znc/.znc/znc.pem"

if [ -d "/etc/letsencrypt/live/$ZNC_FQDN" ]; then
    echo -e "Updating ZNC certificate for $ZNC_FQDN"
    cat /etc/letsencrypt/live/$ZNC_FQDN/{privkey,fullchain}.pem > $ZNC_CERT
    chown znc:znc $ZNC_CERT
    chmod 600 $ZNC_CERT
fi
