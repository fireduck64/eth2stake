#!/bin/bash

echo "Starting nethermind"

. eth2-settings.sh  

docker volume create nethermind_vol

docker run -d --restart always --name nethermind \
          --mount 'type=volume,src=nethermind_vol,dst=/nethermind/data' \
          --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
           --network host \
           $DOCKER_NETHERMIND \
           --JsonRpc.JwtSecretFile /secrets/jwtsecret \
           --HealthChecks.Enabled true \
           --JsonRpc.Port 8545 --JsonRpc.Host '*' \
           --JsonRpc.EnginePort 8551 --JsonRpc.EngineHost '*'
