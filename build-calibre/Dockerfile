FROM ubuntu:20.04

RUN \
    echo "**** installing calibre ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y calibre

COPY users.sqlite /srv/calibre/users.sqlite

CMD [ "calibre-server", "--userdb", "/srv/calibre/users.sqlite", "--enable-auth", "--port=8080", "--daemonize", "/books" ]