#!/bin/bash

set -eo pipefail

RELEASE=0.19.1
LINK=https://bitcoincore.org/bin/bitcoin-core-$RELEASE/bitcoin-$RELEASE-x86_64-linux-gnu.tar.gz

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install \
   openssl ca-certificates curl wget
rm -rf /var/lib/apt/lists/*

# /root/.bitcoin
mkdir -p ~/.bitcoin
mkdir -p /usr/opt/bitcoin/$RELEASE


wget $LINK
tar xvf bitcoin-$RELEASE-x86_64-linux-gnu.tar.gz

cd bitcoin-$RELEASE
cp -R ./* /usr/opt/bitcoin/$RELEASE
cd .. && rm -Rf bitcoin-$RELEASE


create_symlink() {
   ln -sf ../opt/bitcoin/${RELEASE}/bin/$1 usr/bin/$2 || exit 1
}
for f in $(ls "/usr/opt/bitcoin/${RELEASE}/bin"); do
   bn=$(basename $f)
   create_symlink $bn $bn
done

# /root/.bitcoin/bitcoin.conf
cat > ~/.bitcoin/bitcoin.conf << EOF
datadir=/data
EOF
