#!/bin/bash

echo "Starting prometheus"

docker pull prom/prometheus

docker volume create prometheus_db_vol

docker run --name prometheus --rm --network host -v ~/eth2stake.git/configs:/etc/prometheus \
  --mount 'type=volume,src=prometheus_db_vol,dst=/prometheus' prom/prometheus

