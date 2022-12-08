#!/bin/bash

echo "Starting nethermind"

. eth2-settings.sh  

docker volume create nethermind_vol

docker run -d --restart always --name nethermind \
          --mount 'type=volume,src=nethermind_db_vol,dst=/nethermind/nethermind_db' \
          --mount 'type=volume,src=nethermind_log_vol,dst=/nethermind/logs' \
          --mount 'type=volume,src=nethermind_keystore_vol,dst=/nethermind/keystore' \
          --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
           --network host \
           $DOCKER_NETHERMIND \
           --Network.MaxActivePeers 256 \
           --HealthChecks.Enabled true \
           --JsonRpc.JwtSecretFile /secrets/jwtsecret \
           --JsonRpc.Port 8545 --JsonRpc.Host '*' \
           --JsonRpc.EnginePort 8551 --JsonRpc.EngineHost '*'

