

docker volume create lighthouse_vc_vol

docker run  -d --restart always --name lighthouse-vc --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  sigp/lighthouse lighthouse vc --testnet mainnet --http --graffiti="Fireduck"


