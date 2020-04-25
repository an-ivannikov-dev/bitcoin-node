#!/bin/bash

set -eo pipefail

VERSION=${VERSION:-0.19.1}
LINK=https://bitcoincore.org/bin/bitcoin-core-$VERSION/bitcoin-$VERSION-x86_64-linux-gnu.tar.gz

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install \
   openssl ca-certificates curl wget
rm -rf /var/lib/apt/lists/*

# /root/.bitcoin
mkdir -p ~/.bitcoin
mkdir -p /usr/opt/bitcoin/$VERSION


wget $LINK
tar xvf bitcoin-$VERSION-x86_64-linux-gnu.tar.gz

cd bitcoin-$VERSION
cp -R ./* /usr/opt/bitcoin/$VERSION
cd .. && rm -Rf bitcoin-$VERSION


create_symlink() {
   ln -sf ../opt/bitcoin/${VERSION}/bin/$1 usr/bin/$2 || exit 1
}
for f in $(ls "/usr/opt/bitcoin/${VERSION}/bin"); do
   bn=$(basename $f)
   create_symlink $bn $bn
done

# /root/.bitcoin/bitcoin.conf
cat > ~/.bitcoin/bitcoin.conf << EOF
datadir=/data
EOF
