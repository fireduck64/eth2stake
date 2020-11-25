#!/bin/bash

echo "Stopping lighthouse beacon"

docker container stop -t 300 lighthouse-b
docker container rm lighthouse-b




