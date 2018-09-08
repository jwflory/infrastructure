#!/usr/bin/bash
#
# Renew LetsEncrypt certificates and restart nginx systemd service if config
# successfully validates.
#

certbot renew
nginx -t -c /etc/nginx/nginx.conf
EXIT_STATUS=$?
if [ $EXIT_STATUS -eq 0 ]; then
    systemctl restart nginx
    logger -p info -t renew_ssl_certs.sh 'nginx service restarted'
elif [ $EXIT_STATUS -ne 0 ]; then
    logger -s -p err -t renew_ssl_certs.sh 'nginx config validation failed - nginx service did NOT restart'
fi
