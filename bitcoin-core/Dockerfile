FROM debian:trixie-slim as builder

# configure bitcoin core version here
ENV VERSION=25.0

WORKDIR /tmp
ADD https://bitcoin.org/bin/bitcoin-core-${VERSION}/bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz bitcoin.tar.gz
RUN tar -xvf bitcoin.tar.gz &&\
  rm bitcoin.tar.gz &&\
  mv bitcoin-${VERSION} bitcoin

FROM debian:trixie-slim
RUN useradd -ms /bin/bash bitcoin
USER bitcoin
WORKDIR /home/bitcoin
COPY --from=builder /tmp/bitcoin ./bitcoin
ENV PATH=$PATH:/home/bitcoin/bitcoin/bin

EXPOSE 8332/tcp

CMD ["bitcoind", "--printtoconsole"]
