
mkdir -p ~/data/lighthouse

docker run --rm --name lighthouse-v --network host -v ~/data/lighthouse:/root/.lighthouse sigp/lighthouse lighthouse vc --testnet mainnet --http --graffiti="Fireduck"


