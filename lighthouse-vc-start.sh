#!/bin/bash

echo "Starting lighthouse validation client"

. eth2-settings.sh

docker volume create lighthouse_vc_vol

docker run  -d --restart no --name lighthouse-vc --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  -v ~/data:/vol/data $CLOUDLOCK_SETTINGS \
  $DOCKER_LIGHTHOUSE $CLOUDLOCK_COMMAND lighthouse vc --network mainnet --http --metrics \
  $GRAFFITI_SETTINGS

