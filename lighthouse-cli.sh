
mkdir -p ~/data/lighthouse

docker run -it -v ~/data/validator_keys:/root/validator_keys -v ~/data/lighthouse:/root/.lighthouse sigp/lighthouse lighthouse $*

