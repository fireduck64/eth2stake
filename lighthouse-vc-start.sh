
mkdir -p ~/data/lighthouse

docker run  -d --restart always --name lighthouse-vc --network host -v ~/data/lighthouse:/root/.lighthouse sigp/lighthouse lighthouse vc --testnet mainnet --http --graffiti="Fireduck"


