#!/usr/bin/env bash
# script that set up yuor web servers for the deployment
sudo apt update
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "
<html>
  <head>
  </head>
  <body>
   Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html
ln -s -f /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '/listen 80 default server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
sudo service nginx restart