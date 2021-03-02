#!/bin/bash
sudo yum update -y
sudo yum install dos2unix -y
sudo dos2unix ngnix_as_lb.sh
sudo yum install nginx -y
echo "  upstream myproject {
    server 10.0.0.147 weight=3;
     server 10.0.0.152;


  }

  server {
    listen 80;

    location / {
      proxy_pass http://myproject;
    }
  }" >> /etc/nginx/conf.d/load-balancer.conf
sudo service nginx start