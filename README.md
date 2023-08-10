# bitcoin-docker-compose

A docker compose stack consisting of
- [tor](https://www.torproject.org/)
- [bitcoin core](https://bitcoin.org/en/bitcoin-core/)
- [electrs](https://github.com/romanz/electrs)

## usage

Always use the `bitcoin-stack` wrapper script to ensure correct file
permissions.

**start stack**

```sh
./bitcoin-stack up
```

**other command**
```sh
./bitcoin-stack
commands:
up        -> spin up the environment
down      -> spins down the environment
build     -> builds docker images
hostname  -> prints .onion address
logs      -> tail docker compose logs
clean     -> deletes all files in data directories
```
