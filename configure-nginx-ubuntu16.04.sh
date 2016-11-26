curl -O -L https://raw.githubusercontent.com/eklundkristoffer/whmcs/master/resources/default
cp -f /etc/nginx/sites-available/default ./default
sudo systemctl reload nginx