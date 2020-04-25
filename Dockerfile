FROM ubuntu:18.04

LABEL name="ivannikovdev/bitcoin-node" version="0.19.1" \
    description="bitcoin-v0.19.1 node" \
    maintainer="Aleksandr Ivannikov <dev@an-ivannikov.com>" \
    url="https://github.com/an-ivannikov-dev/bitcoin-node"

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
