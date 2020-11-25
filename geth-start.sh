#!/bin/bash

echo "Starting geth"

. eth2-settings.sh  

docker volume create geth_vol

docker run -d --restart always --name geth \
          --mount 'type=volume,src=geth_vol,dst=/root/.ethereum' \
           --network host \
           $DOCKER_GETH --http 
