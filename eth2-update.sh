#!/bin/bash

. eth2-settings.sh


echo "Pulling new images:"

docker pull $DOCKER_GETH
docker pull $DOCKER_LIGHTHOUSE
docker pull $DOCKER_NETHERMIND
docker pull $DOCKER_MEV_BOOST

echo "----------------"
echo "Stopping services:"
geth-stop.sh
nether-stop.sh
lighthouse-b-stop.sh
lighthouse-vc-stop.sh
mev-boost-stop.sh

echo "----------------"
echo "Starting services:"
if [ "$MEV_ENABLED" = "true" ]
then
  mev-boost-start.sh
fi
lighthouse-vc-start.sh
lighthouse-b-start.sh
if [ $EXEC_CLIENT = "geth" ]
then
  geth-start.sh
fi
if [ $EXEC_CLIENT = "nethermind" ]
then
  nether-start.sh
fi



