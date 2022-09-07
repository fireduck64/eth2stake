#!/bin/bash

. eth2-settings.sh


echo "Pulling new images:"

docker pull $DOCKER_GETH
docker pull $DOCKER_LIGHTHOUSE
docker pull $DOCKER_NETHERMIND

echo "----------------"
lighthouse-vc-stop.sh
lighthouse-b-stop.sh
geth-stop.sh

geth-start.sh
lighthouse-b-start.sh
lighthouse-vc-start.sh


