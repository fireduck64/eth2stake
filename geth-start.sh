#!/bin/bash

echo "Starting geth"

. eth2-settings.sh  

docker volume create geth_vol

docker run -d --restart always --name geth \
          --mount 'type=volume,src=geth_vol,dst=/root/.ethereum' \
          --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
           --network host \
           $DOCKER_GETH --http --http.addr 0.0.0.0 --http.vhosts '*' \
           --authrpc.addr 0.0.0.0 --authrpc.port 8551 --authrpc.vhosts '*' \
           --authrpc.jwtsecret /secrets/jwtsecret 

