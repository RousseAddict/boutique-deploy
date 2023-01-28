#!/bin/bash

# Install certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx -y

# Obtain a certificate
sudo certbot --nginx -d example.com

# Copy key into nginx
# Your certificate and chain have been saved at:
# /etc/letsencrypt/live/<domain>/fullchain.pem
# Your key file has been saved at:
# /etc/letsencrypt/live/<domain>/privkey.pem


# Restart nginx
sudo service nginx restart