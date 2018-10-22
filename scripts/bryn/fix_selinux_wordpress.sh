#!/bin/sh
#
# Fix file and SELinux permissions for certain WordPress blog content. This lets
# you upload images via the WordPress interface.
#
# To be run as root only.
#

find /var/www/blog.justinwflory.com/public_html/ -type d -exec chmod 775 {} \;
find /var/www/blog.justinwflory.com/public_html/ -type f -exec chmod 664 {} \;
chcon -t httpd_sys_rw_content_t /var/www/blog.justinwflory.com/public_html/wp-content/ -R
