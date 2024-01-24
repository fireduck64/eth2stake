#!/bin/sh

lighthouse-b-stop.sh

docker volume rm lighthouse_b_vol

lighthouse-b-start.sh
