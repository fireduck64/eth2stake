#!/bin/bash

. eth2-settings.sh

docker run --network host --name mev-boost -d --restart always $DOCKER_MEV_BOOST \
  -mainnet -addr 0.0.0.0:18550 \
  -relays $MEV_RELAYS \
  -relay-check

