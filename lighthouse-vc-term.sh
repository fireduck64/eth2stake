
# run lighthouse vc in ther terminal so you can see it

docker volume create lighthouse_vc_vol

docker run --rm --name lighthouse-v --network host \
  --mount 'type=volume,src=lighthouse_vc_vol,dst=/root/.lighthouse' \
  sigp/lighthouse lighthouse vc --testnet mainnet --http --graffiti="Fireduck"

