#!/bin/bash

wget -qO- "http://localhost:1337" --header 'Content-Type: application/json' --post-data '{"jsonrpc":"2.0","method":"admin_prune","params":[],"id":1}' | jq .

