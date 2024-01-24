#!/bin/bash

echo "Starting besu"

. eth2-settings.sh  

docker volume create besu_vol

docker run -it --rm --mount 'type=volume,src=besu_vol,dst=/data/besu' \
  1209k/util chown -R 1000:1000 /data/besu

docker run -d --restart always --name besu \
          --mount 'type=volume,src=besu_vol,dst=/data/besu' \
          --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
           --network host \
           $DOCKER_BESU --rpc-http-enabled --rpc-ws-enabled \
           --data-path=/data/besu \
           --engine-jwt-secret=/secrets/jwtsecret \
           --data-storage-format=BONSAI \
           --sync-mode=X_SNAP \
           --engine-rpc-enabled \
           --engine-host-allowlist=localhost,127.0.0.1

