#!/bin/bash

. eth2-settings.sh


echo "Pulling new images:"

docker pull $DOCKER_GETH
docker pull $DOCKER_LIGHTHOUSE

echo "----------------"


