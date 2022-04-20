FROM ubuntu:20.04

RUN \
    echo "**** installing calibre ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y calibre

RUN mkdir -pv /srv/calibre
COPY users.sqlite /srv/calibre/users.sqlite

CMD calibre-server --enable-auth --port=8080 --userdb /srv/calibre/users.sqlite --daemonize /books