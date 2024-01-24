#!/bin/bash

. eth2-settings.sh



eth2-pull.sh


echo "Stopping services:"
geth-stop.sh
nether-stop.sh
reth-stop.sh
besu-stop.sh
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
if [ $EXEC_CLIENT = "reth" ]
then
  reth-start.sh
fi
if [ $EXEC_CLIENT = "besu" ]
then
  besu-start.sh
fi

