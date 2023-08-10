FROM debian:trixie-slim as builder

# configure bitcoin core version here
ENV VERSION=25.0

WORKDIR /tmp
ADD https://bitcoin.org/bin/bitcoin-core-${VERSION}/bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz bitcoin.tar.gz
RUN tar -xvf bitcoin.tar.gz &&\
  rm bitcoin.tar.gz &&\
  mv bitcoin-${VERSION} bitcoin

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
