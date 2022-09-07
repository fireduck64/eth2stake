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
nether-stop.sh

if [ $EXEC_CLIENT = "geth" ]
then
  geth-start.sh
fi
if [ $EXEC_CLIENT = "nethermind" ]
then
  nether-start.sh
fi

lighthouse-b-start.sh
lighthouse-vc-start.sh


