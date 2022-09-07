#!/bin/bash

echo "Stopping nethermind"
docker container stop -t 300 nethermind
docker container rm nethermind

