#!/bin/bash

curl -X GET "http://localhost:5052/eth/v1/beacon/states/head/validators" -H  "accept: application/json"|jq .

