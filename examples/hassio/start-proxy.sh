#!/bin/bash
RED='\033[1;31m'
NC='\033[0m' # No Color
USAGE="Usage: \t $0 [your email] [your domain name]"

export CERTBOT_EMAIL=$1
DOMAIN_NAME=$2

if [ -z "${CERTBOT_EMAIL}" ]; then
    echo -e "${RED}Email parameter undefined${NC}"
    echo -e ${USAGE}
    exit 1
fi

if [ -z "${DOMAIN_NAME}" ]; then
    echo -e "${RED}Domain name parameter undefined${NC}"
    echo -e ${USAGE}
    exit 1
fi

sudo mkdir -vp /opt/nginx/conf.d
sudo mkdir -vp /opt/nginx/certs
sudo mkdir -vp /opt/nginx/html

# generate a localhost certificate to allow us create a sink for all the requests without a proper domain name
sudo openssl req -newkey rsa:2048 -x509 -days 36500 -nodes  -out /opt/nginx/certs/localhost.crt   -keyout /opt/nginx/certs/localhost.pem  -subj "/C=WA/ST=Wakanda/L=Wakanda/O=IT/CN=localhost.local"

# TODO: Use sed modify the conf.d/hassio.conf file
sudo cp hassio.conf /opt/nginx/conf.d

docker-compose up