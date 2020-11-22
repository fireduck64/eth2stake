#!/bin/bash


. eth2-settings.sh

docker volume create lighthouse_vc_vol

docker run  -d --restart always --name lighthouse-vc --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  $DOCKER_LIGHTHOUSE lighthouse vc --testnet mainnet --http --graffiti="Fireduck"


