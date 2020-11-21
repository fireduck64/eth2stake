
mkdir -p ~/data/geth

docker run -d --restart always --name geth -v ~/data/geth:/root \
           --network host \
           ethereum/client-go:stable --http  
