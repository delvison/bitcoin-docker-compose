#!/bin/bash

trap "bitcoin-cli stop ; exit" SIGTERM
trap "bitcoin-cli stop ; exit" SIGKILL

bitcoind --printtoconsole -conf=/home/bitcoin/bitcoin.conf
