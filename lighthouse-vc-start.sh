#!/bin/bash

echo "Starting lighthouse validation client"


. eth2-settings.sh

docker volume create lighthouse_vc_vol

echo "Using graffiti: $GRAFFITI"


docker run  -d --restart no --name lighthouse-vc --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  -v ~/data:/vol/data \
  $DOCKER_LIGHTHOUSE lighthouse vc --network mainnet --http --metrics \
  --graffiti-file /vol/data/graffiti.txt 
  #--graffiti="$GRAFFITI"


# $DOCKER_LIGHTHOUSE lighthouse vc --network mainnet --http --graffiti="$GRAFFITI" --metrics

