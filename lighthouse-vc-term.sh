#!/bin/bash

# run lighthouse vc in ther terminal so you can see it

. eth2-settings.sh

echo $GRAFFITI

docker volume create lighthouse_vc_vol

docker run --rm --name lighthouse-v --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  $DOCKER_LIGHTHOUSE lighthouse vc --testnet mainnet --http --graffiti="$GRAFFITI"

