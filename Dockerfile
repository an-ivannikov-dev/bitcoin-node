FROM ubuntu:18.04

ENV VERSION=${VERSION:-0.19.1}

LABEL name="ivannikovdev/bitcoin-node:v$VERSION" version="$VERSION" \
    description="bitcoin-v$VERSION node" \
    maintainer="Aleksandr Ivannikov <dev@an-ivannikov.com>" \
    url="https://github.com/an-ivannikov-dev/docker-image-bitcoin-node"

ADD ./install.sh /
RUN chmod +x /install.sh && ./install.sh && rm /install.sh

# mainnet <port, rpcport>
EXPOSE 8333 8332
# testnet
EXPOSE 18333 18332
# regtest
EXPOSE 18444 18443

VOLUME ["/data"]

CMD ["bitcoind", "-datadir=/data"]
