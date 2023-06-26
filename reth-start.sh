#!/bin/bash

echo "Starting reth"

. eth2-settings.sh  

docker volume create reth_vol

docker run -d --restart always --name reth \
          --mount 'type=volume,src=reth_vol,dst=/root/.local/share/reth' \
          --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
           --network host \
           $DOCKER_RETH node --http --http.addr 0.0.0.0 \
           --authrpc.addr 0.0.0.0 --authrpc.port 8551  \
           --authrpc.jwtsecret /secrets/jwtsecret

