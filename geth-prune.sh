#!/bin/bash

echo "THIS THING TAKES A LONG TIME, LIKE HOURS AND GETH WILL BE DOWN."
echo "If you not into that, ctrl+c now."
echo "Sleeping for 30 seconds"

sleep 30

echo "We are doing this thing."

. eth2-settings.sh

geth-stop.sh

docker run --rm --mount 'type=volume,src=geth_vol,dst=/root/.ethereum'  $DOCKER_GETH snapshot prune-state

geth-start.sh



