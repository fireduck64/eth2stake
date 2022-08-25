#!/bin/bash

echo "Starting lighthouse beacon"

. eth2-settings.sh

docker volume create lighthouse_b_vol

docker run -d --restart always --name lighthouse-b --network host \
  --mount 'type=volume,src=lighthouse_b_vol,dst=/root/.lighthouse' \
  --mount 'type=volume,src=eth_secret_vol,dst=/secrets' \
  $DOCKER_LIGHTHOUSE lighthouse b --network mainnet --http --metrics \
  --http-address :: \
  --validator-monitor-auto \
  $BEACON_OPTS \
  --suggested-fee-recipient $FEE_RECIPIENT \
  --execution-endpoint $EXEC_ENDPOINTS \
  --execution-jwt /secrets/jwtsecret 
