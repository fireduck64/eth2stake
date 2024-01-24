#!/bin/bash

. eth2-settings.sh


echo "Pulling new images:"

docker pull $DOCKER_LIGHTHOUSE

if [ "$MEV_ENABLED" = "true" ]
then
  docker pull $DOCKER_MEV_BOOST
fi

if [ $EXEC_CLIENT = "geth" ]
then
  docker pull $DOCKER_GETH
fi

if [ $EXEC_CLIENT = "nethermind" ]
then
  docker pull $DOCKER_NETHERMIND
fi

if [ $EXEC_CLIENT = "reth" ]
then
  docker pull $DOCKER_RETH
fi

if [ $EXEC_CLIENT = "besu" ]
then
  docker pull $DOCKER_BESU
fi

echo "----------------"

