#!/bin/bash

docker volume create geth_vol
docker volume create lighthouse_b_vol
docker volume create lighthouse_vc_vol

echo "Your volumes will be mounted in /vol"

docker run -it --rm \
  -v ~/data:/vol/data \
  --mount 'type=volume,src=geth_vol,dst=/vol/geth' \
  --mount 'type=volume,src=lighthouse_b_vol,dst=/vol/lighthouse_b' \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/vol/lighthouse_vc' \
  1209k/util


