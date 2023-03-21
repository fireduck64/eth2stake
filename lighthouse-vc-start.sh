#!/bin/bash

echo "Starting lighthouse validation client"

. eth2-settings.sh

if [ ! "$VC_ENABLED" = "true" ]
then
  echo "Not starting lighthouse_vc, disabled by VC_ENABLED setting"
  exit 0
fi

MEV_OPTS=""
if [ "$MEV_ENABLED" = "true" ]
then
  MEV_OPTS="--builder-proposals"
fi

docker volume create lighthouse_vc_vol

docker run  -d --restart always --name lighthouse-vc --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  -v ~/data:/vol/data $CLOUDLOCK_SETTINGS \
  $DOCKER_LIGHTHOUSE $CLOUDLOCK_COMMAND lighthouse vc --network mainnet --metrics \
  --beacon-nodes $BEACON_ENDPOINTS \
  --suggested-fee-recipient $FEE_RECIPIENT \
  $MEV_OPTS $GRAFFITI_SETTINGS

