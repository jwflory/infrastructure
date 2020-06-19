#!/bin/sh
#
# Fix file and SELinux permissions for certain WordPress blog content. This
# allows you tp upload images via the WordPress interface.
#
# Must be run as root.

sudo find /var/www/blog.jwf.io/html/ -type d -exec chmod 775 {} \;
sudo find /var/www/blog.jwf.io/html/ -type f -exec chmod 664 {} \;
sudo chcon -t httpd_sys_rw_content_t /var/www/blog.jwf.io/html/wp-content/ -R
