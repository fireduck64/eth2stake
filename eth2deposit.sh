#!/bin/bash

set -eu


if [ ! -e ~/eth2.0-deposit-cli.git ]
then
  git clone https://github.com/ethereum/eth2.0-deposit-cli.git ~/eth2.0-deposit-cli.git
fi
cd ~/eth2.0-deposit-cli.git

mkdir -p ~/data/validator_keys

docker build . -t eth2deposit
docker run -it -v ~/data/validator_keys:/app/validator_keys eth2deposit $*

#new-mnemonic --num_validators 1 --mnemonic_language english --chain mainnet
