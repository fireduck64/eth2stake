#!/bin/bash

. eth2-settings.sh

docker volume create lighthouse_vc_vol

docker run -it --rm -v ~/data/validator_keys:/root/validator_keys \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  $DOCKER_LIGHTHOUSE lighthouse $*

