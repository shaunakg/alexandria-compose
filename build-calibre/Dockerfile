FROM ubuntu:20.04

RUN \
    echo "**** installing calibre ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration \
    libfontconfig libgl1-mesa-glx wget curl git python3-pip calibre -y
    # wget https://download.calibre-ebook.com/linux-installer.sh && \
    # chmod +x linux-installer.sh && \
    # ./linux-installer.sh

RUN mkdir -pv /srv/calibre
COPY users.sqlite /srv/calibre/users.sqlite

RUN calibre-server --version
RUN calibre --version

CMD calibre-server --enable-auth --port=8080 --userdb /srv/calibre/users.sqlite /books