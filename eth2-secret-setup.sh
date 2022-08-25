#!/bin/bash

echo "Configuring secret volume"

. eth2-settings.sh

docker volume create eth_secret_vol

cd secret-volume
docker build . -t eth2-secret-setup


docker run -it --rm --mount 'type=volume,src=eth_secret_vol,dst=/secrets' -e JWT_SECRET=$JWT_SECRET eth2-secret-setup



