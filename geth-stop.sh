#!/bin/bash

echo "Stopping geth"
docker container stop -t 300 geth
docker container rm geth

