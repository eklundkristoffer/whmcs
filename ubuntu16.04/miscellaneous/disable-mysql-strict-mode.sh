#!/bin/bash
echo $'[mysqld]\nsql_mode=""' > /etc/mysql/conf.d/disable_strict_mode.cnf
sudo systemctl restart mysql