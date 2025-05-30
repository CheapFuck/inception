#!/bin/bash
set -e

if [ "$(echo "$1" | cut -c1)" = "-" ]; then
  echo "$0: assuming arguments for peercoind"
  set -- peercoind "$@"
fi
adduser -D peercoin
if [ "$(echo "$1" | cut -c1)" = "-" ] || [ "$1" = "peercoind" ]; then

  echo "Creating directory: $PPC_DATA"
  mkdir -p "$PPC_DATA"
  echo "Directory created: $PPC_DATA"
  chmod 700 "$PPC_DATA"
  chown -R peercoin "$PPC_DATA"

	if [[ ! -s "$PPC_DATA/peercoin.conf" ]]; then
    cat <<-EOF > "$PPC_DATA/peercoin.conf"
    test.rpcbind=0.0.0.0
    main.rpcbind=0.0.0.0
    rpcallowip=0.0.0.0/0
    rpcpassword=${RPC_PASSWORD}
    rpcuser=${RPC_USER}
		EOF
    chown peercoin "$PPC_DATA/peercoin.conf"
	fi

  set -- "$@" -datadir="$PPC_DATA"
fi
export PATH="/peercoin:$PATH"
if [ "$1" = "peercoind" ] || [ "$1" = "peercoin-cli" ] || [ "$1" = "peercoin-tx" ]; then
  echo
  exec su-exec peercoin "$@"
fi
# cd peercoin
# export PATH="/peercoin:$PATH"
exec "$@"


# ./peercoind -daemon -datadir=/data/peercoin
# ./peercoin-cli -datadir=/data/peercoin -getinfo
