#!/bin/bash

echo "Starting prometheus"

docker pull prom/prometheus

docker volume create prometheus_db_vol

docker run -d --name prometheus --restart always --network host -v /home/nerd/eth2stake.git/configs:/etc/prometheus \
  --mount 'type=volume,src=prometheus_db_vol,dst=/prometheus' prom/prometheus 
  
  #/etc/prometheus/prometheus.yml
