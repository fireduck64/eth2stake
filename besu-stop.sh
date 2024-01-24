#!/bin/bash

echo "Stopping besu"
docker container stop -t 300 besu
docker container rm besu


