#!/bin/bash

echo "Stopping mev-boost"

docker container stop -t 30 mev-boost
docker container rm mev-boost






