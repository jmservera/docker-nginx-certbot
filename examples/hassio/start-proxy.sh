#!/bin/bash

if [ !CERTBOT_EMAIL ]; then
    RED='\033[1;31m'
    NC='\033[0m' # No Color

    echo -e "${RED}CERTBOT_EMAIL environment variable undefined${NC}"
    echo -e "Usage: \t CERTBOT_EMAIL=youremail@yourdomain.com $0"
    exit 1
fi

sudo mkdir -vp /opt/nginx/conf.d
sudo mkdir -vp /opt/nginx/certs
sudo mkdir -vp /opt/nginx/html

sudo cp hassio.conf /opt/nginx/conf.d

docker-compose up
