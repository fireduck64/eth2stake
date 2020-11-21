
docker volume create geth_vol

docker run -d --restart always --name geth \
          --mount 'type=volume,src=geth_vol,dst=/root/.ethereum' \
           --network host \
           ethereum/client-go:stable --http 
