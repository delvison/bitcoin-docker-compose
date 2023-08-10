FROM debian:trixie-slim as builder

ARG BITCOIN_CORE_VERSION

WORKDIR /tmp
ADD https://bitcoin.org/bin/bitcoin-core-${BITCOIN_CORE_VERSION}/bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz bitcoin.tar.gz
RUN tar -xvf bitcoin.tar.gz &&\
  rm bitcoin.tar.gz &&\
  mv bitcoin-${BITCOIN_CORE_VERSION} bitcoin

FROM debian:trixie-slim

ARG UID
ARG GID

RUN useradd -u "$UID" -ms /bin/bash bitcoin
COPY --from=builder --chown=bitcoin:bitcoin /tmp/bitcoin /home/bitcoin/binaries

USER bitcoin
WORKDIR /home/bitcoin
COPY --chown=bitcoin:bitcoin ./bitcoin.conf /home/bitcoin/bitcoin.conf
COPY --chown=bitcoin:bitcoin ./start.sh /usr/bin/start
RUN chmod +x /usr/bin/start

ENV PATH=$PATH:/home/bitcoin/binaries/bin

EXPOSE 8332/tcp

CMD ["/usr/bin/start"]
