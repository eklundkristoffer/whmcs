#!/bin/bash
sudo apt-get update
sudo apt-get install php-fpm php-mysql
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm