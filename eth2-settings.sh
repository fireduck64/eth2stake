
# If you want to change these do
# touch eth2-settings.local.sh
# chmod 755 eth2-settings.local.sh
# and put your overrides there

export GRAFFITI_SETTINGS="--graffiti ShrimpHand"


export DOCKER_GETH=ethereum/client-go:stable
export DOCKER_LIGHTHOUSE=sigp/lighthouse:latest
export ETH1_ENDPOINTS=http://localhost:8545
export BEACON_ENDPOINTS=http://localhost:8052

export CLOUDLOCK_SETTINGS=""
export CLOUDLOCK_COMMAND=""

export VC_ENABLED="true"
export BEACON_OPTS=""

if which eth2-settings.local.sh >> /dev/null
then
  . eth2-settings.local.sh
fi



