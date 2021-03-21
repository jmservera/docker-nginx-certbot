#!/bin/bash
# copy certbot and redirector configuration from opt to shared nginx conf.d
cp -r /opt/nginx/conf.d/ /etc/nginx/conf.d/