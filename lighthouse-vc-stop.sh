#!/bin/bash

echo "Stopping lighthouse validation client"


docker container stop -t 300 lighthouse-vc
docker container rm lighthouse-vc




