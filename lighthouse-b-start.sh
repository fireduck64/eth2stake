
mkdir -p ~/data/lighthouse


docker run -d --restart always --name lighthouse-b --network host -v ~/data/lighthouse:/root/.lighthouse sigp/lighthouse lighthouse b --testnet mainnet --http --eth1 --eth1-endpoint http://localhost:8545

