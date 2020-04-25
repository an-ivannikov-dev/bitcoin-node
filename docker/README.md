# Build `ivannikovdev/bitcoin-node` Docker image

## Building Docker Image

```bash
VERSION=0.19.1

docker build --no-cache --tag ivannikovdev/bitcoin-node:v$VERSION .
docker tag ivannikovdev/bitcoin-node:v$VERSION ivannikovdev/bitcoin-node:latest
docker push ivannikovdev/bitcoin-node:v$VERSION
docker push ivannikovdev/bitcoin-node:latest
```
