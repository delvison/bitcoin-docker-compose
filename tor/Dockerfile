# set alpine as the base image of the Dockerfile
FROM alpine:latest

ARG UID
ARG GID

RUN addgroup -g "$GID" -S tor && adduser -u "$UID" -S tor -G tor

# update the package repository and install Tor
RUN apk update && apk add tor

RUN mkdir -p /tor/data/bitcoin && chown -R tor:tor /tor
COPY --chown=tor:tor torrc /etc/tor/torrc

USER tor
WORKDIR /tor

# Set `tor` as the entrypoint for the image
ENTRYPOINT ["tor"]

# Set the default container command
# This can be overridden later when running a container
CMD ["-f", "/etc/tor/torrc"]
