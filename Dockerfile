FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

RUN \
    echo "**** install build packages ****" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration -y && \
    apt-get install -y \
    g++ \
    gcc \
    git \
    libffi-dev \
    libjpeg-dev \
    libldap2-dev \
    libsasl2-dev \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
    zlib1g-dev && \
    echo "**** install runtime packages ****" && \
    apt-get install -y \
    imagemagick \
    libldap-2.4-2 \
    libnss3 \
    libsasl2-2 \
    libxcomposite1 \
    libxi6 \
    libxrandr2 \
    libxslt1.1 \
    python3-minimal \
    python3-pkg-resources \
    calibre \
    unrar && \
    echo "**** cloning calibre-web into /app/calibre-web ****" && \
    git clone https://github.com/shaunakg/alexandria.git /app/calibre-web && \
    cd /app/calibre-web && \
    pip3 install --no-cache-dir -U \
    pip && \
    pip install --no-cache-dir -U --ignore-installed --find-links https://wheel-index.linuxserver.io/ubuntu/ -r \
    requirements.txt -r \
    optional-requirements.txt && \
    echo "**** installing kepubify ****" && \
    if [ -z ${KEPUBIFY_RELEASE+x} ]; then \
    KEPUBIFY_RELEASE=$(curl -sX GET "https://api.github.com/repos/pgaskin/kepubify/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
    fi && \
    curl -o \
    /usr/bin/kepubify -L \
    https://github.com/pgaskin/kepubify/releases/download/${KEPUBIFY_RELEASE}/kepubify-linux-arm64 && \
    echo "**** cleanup ****" && \
    apt-get -y purge \
    g++ \
    gcc \
    git \
    libffi-dev \
    libjpeg-dev \
    libldap2-dev \
    libsasl2-dev \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
    zlib1g-dev && \
    apt-get -y autoremove && \
    rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /root/.cache

# add local files
COPY root/ /
COPY calibre-patch.py /usr/lib/calibre/calibre/ebooks/pdf/html_writer.py
RUN chmod +x /usr/lib/calibre/calibre/ebooks/pdf/html_writer.py

# ports and volumes
EXPOSE 80
VOLUME /config

