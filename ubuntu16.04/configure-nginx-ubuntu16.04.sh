#!/bin/bash
curl -O -L https://raw.githubusercontent.com/eklundkristoffer/whmcs/master/ubuntu16.04/resources/default
cp -f ./default /etc/nginx/sites-available/default
IP=$(curl -4 icanhazip.com)
sed -i 's/{SERVER_NAME}/'$IP'/g' /etc/nginx/sites-available/default
rm -rf /var/www/*
echo "<?php phpinfo(); ?>" > /var/www/index.php
sudo systemctl reload nginx