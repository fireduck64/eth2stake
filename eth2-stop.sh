#!/bin/bash

. eth2-settings.sh


geth-stop.sh
nether-stop.sh
reth-stop.sh
besu-stop.sh
lighthouse-b-stop.sh
lighthouse-vc-stop.sh
mev-boost-stop.sh


