#!/bin/bash

echo "Starting grafana"

docker pull grafana/grafana

docker volume create grafana_db_vol

docker run -d --restart always --network host --name grafana \
  --mount 'type=volume,src=grafana_db_vol,dst=/var/lib/grafana' grafana/grafana
