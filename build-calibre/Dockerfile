FROM ubuntu:20.04

RUN \
    echo "**** install build packages ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration -y && \
    apt-get install -y calibre

COPY users.sqlite /srv/calibre/users.sqlite

CMD [ "calibre-server", "--userdb /srv/calibre/users.sqlite", "--enable-auth", "--port=8080", "--daemonize", "/books" ]