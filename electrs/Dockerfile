FROM iangregsondev/electrs:0.9

ARG UID
ARG GID

RUN useradd -u "$UID" -ms /bin/bash electrs
USER electrs
WORKDIR /electrs
