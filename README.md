# 'ivannikovdev/bitcoin-node' Docker Image
> [ivannikovdev/bitcoin-node](https://hub.docker.com/repository/docker/ivannikovdev/bitcoin-node)

## JSON-RPC Interface
> [JSON-RPC Interface](https://github.com/bitcoin/bitcoin/blob/master/doc/JSON-RPC-interface.md).
The JSON-RPC API can be enabled with the -server option.


## Unauthenticated REST Interface
> [Unauthenticated REST Interface](https://github.com/bitcoin/bitcoin/blob/master/doc/REST-interface.md).
The REST API can be enabled with the -rest option.


## Executables
> [bitcoin-core-0.19.1](https://bitcoincore.org/bin/bitcoin-core-0.19.1)

Executables in `/usr/opt/bitcoin/0.19.1/bin/*`:
- bitcoin-cli;
- bitcoind;
- bitcoin-qt;
- bitcoin-tx;
- bitcoin-wallet;
- test_bitcoin.


## Settings file 'bitcoin.conf'
`/root/.bitcoin/bitcoin.conf`
or
`/data/bitcoin.conf`


## Usage

### Clone and building docker image
```bash
git clone https://github.com/an-ivannikov-dev/docker-image-bitcoin-node bitcoin-node

cd bitcoin-node
docker build --no-cache --tag ivannikovdev/bitcoin-node .
```

### docker run
```bash
docker run ivannikovdev/bitcoin-node bitcoind -help
```

### docker-compose.yml
```bash
#docker volume create --name=bitcoin_node_data_volume
docker-compose up -d
#ls bitcoin_node_data_volume
```


## Building Docker Image
```bash
TAG=0.19.1

docker build --no-cache --tag ivannikovdev/bitcoin-node:v$TAG .
docker tag ivannikovdev/bitcoin-node:v$TAG ivannikovdev/bitcoin-node:latest
docker push ivannikovdev/bitcoin-node:v$TAG
docker push ivannikovdev/bitcoin-node:latest
```
