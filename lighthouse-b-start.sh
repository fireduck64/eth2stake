
docker volume create lighthouse_b_vol

docker run -d --restart always --name lighthouse-b --network host \
  --mount 'type=volume,src=lighthouse_b_vol,dst=/root/.lighthouse' \
  sigp/lighthouse lighthouse b --testnet mainnet --http --eth1 --eth1-endpoint http://localhost:8545

