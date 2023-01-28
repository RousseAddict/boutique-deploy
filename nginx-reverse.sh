#!/bin/bash

# Install nginx
sudo apt-get update
sudo apt-get install -y nginx

# Create a new nginx configuration file for your application
sudo tee /etc/nginx/sites-available/nginx.conf <<EOF
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Enable the new configuration file
sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# Remove the default nginx configuration file
sudo rm /etc/nginx/sites-enabled/default

# Start nginx
sudo systemctl start nginx
