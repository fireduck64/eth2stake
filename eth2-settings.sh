
# If you want to change these do
# touch eth2-settings.local.sh
# chmod 755 eth2-settings.local.sh
# and put your overrides there

export GRAFFITI_SETTINGS="--graffiti ShrimpHand"


export EXEC_CLIENT=geth

export DOCKER_GETH=ethereum/client-go:stable
export DOCKER_RETH=1209k/reth
export DOCKER_LIGHTHOUSE=sigp/lighthouse:latest
export DOCKER_NETHERMIND=nethermind/nethermind
export DOCKER_MEV_BOOST=flashbots/mev-boost:latest

export EXEC_ENDPOINTS=http://localhost:8551
export BEACON_ENDPOINTS=http://localhost:8052

export CLOUDLOCK_SETTINGS=""
export CLOUDLOCK_COMMAND=""

export VC_ENABLED="true"
export BEACON_OPTS=""

# see https://lighthouse-book.sigmaprime.io/suggested-fee-recipient.html
export FEE_RECIPIENT="0x36dae7c539d699afd646b5c973c73a3e8fcedd6d"

# Should be replaced with your own
export JWT_SECRET="0x4183fc805f9384a632b2ff4a5d54c8920ce8f9190bd0211260062444b3d236ed"

export MEV_ENABLED="true"
export MEV_RELAYS="https://0xac6e77dfe25ecd6110b8e780608cce0dab71fdd5ebea22a16c0205200f2f8e2e3ad3b71d3499c54ad14d6c21b41a37ae@boost-relay.flashbots.net,https://0xa1559ace749633b997cb3fdacffb890aeebdb0f5a3b6aaa7eeeaf1a38af0a8fe88b9e4b1f61f236d2e64d95733327a62@relay.ultrasound.money"

if which eth2-settings.local.sh >> /dev/null
then
  . eth2-settings.local.sh
fi



