#!/bin/bash
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar
tar zxvf ioncube_loaders_lin_x86-64.tar.gz && mkdir /usr/local/ioncube
cp ./ioncube/ioncube_loader_lin_7.0.so /usr/local/ioncube
FPM_ZEND=$(cat /etc/php/7.0/fpm/php.ini | grep 'zend_extension')
if [[ $FPM_ZEND ]]; then 
    sed -i '/zend_extension/c\zend_extension=/usr/local/ioncube/ioncube_loader_lin_7.0.so' /etc/php/7.0/fpm/php.ini
else
    echo "zend_extension=/usr/local/ioncube/ioncube_loader_lin_7.0.so" >> /etc/php/7.0/fpm/php.ini
fi
CLI_ZEND=$(cat /etc/php/7.0/cli/php.ini | grep 'zend_extension')
if [[ $CLI_ZEND ]]; then 
    sed -i '/zend_extension/c\zend_extension=/usr/local/ioncube/ioncube_loader_lin_7.0.so' /etc/php/7.0/cli/php.ini
else
    echo "zend_extension=/usr/local/ioncube/ioncube_loader_lin_7.0.so" >> /etc/php/7.0/cli/php.ini
fi
sudo systemctl restart nginx
sudo systemctl restart php7.0-fpm