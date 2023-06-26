#!/bin/bash

echo "Stopping reth"
docker container stop -t 300 reth
docker container rm reth

