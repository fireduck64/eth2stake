#!/bin/bash

. eth2-settings.sh


docker pull $DOCKER_GETH
docker pull $DOCKER_LIGHTHOUSE

geth-stop.sh
geth-start.sh

lighthouse-b-stop.sh
lighthouse-b-start.sh

lighthouse-vc-stop.sh
lighthouse-vc-start.sh

