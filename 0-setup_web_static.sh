#!/usr/bin/env bash
# Script that sets up your web servers for the deployment of web_static.
# install nginx it not already installed
sudo apt update
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'

# create a folder '/data/' if it doesn't exist
sudo mkdir -p /data/
# create a folder '/data/web_statis/' if it doesn't exist
sudo mkdir -p /data/web_static/
# create a folder '/data/releases/' if it doesn't exist
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch  /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

sudo ln -s -f  /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
sudo service nginx restart