#!/bin/bash

echo "Starting lighthouse beacon"

. eth2-settings.sh

docker volume create lighthouse_b_vol

docker run -d --restart always --name lighthouse-b --network host \
  --mount 'type=volume,src=lighthouse_b_vol,dst=/root/.lighthouse' \
  $DOCKER_LIGHTHOUSE lighthouse b --network mainnet --http --metrics \
  --eth1 --eth1-endpoints http://localhost:8545,http://10.134.130.174:8545
