#!/bin/bash

docker pull ethereum/client-go:stable
docker pull sigp/lighthouse

geth-stop.sh
geth-start.sh

lighthouse-b-stop.sh
lighthouse-b-start.sh

lighthouse-vc-stop.sh
lighthouse-vc-start.sh

