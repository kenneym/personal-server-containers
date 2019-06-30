FROM nextcloud:15.0.4

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update && apt-get install -y \
        supervisor \
        ffmpeg \
        libbz2-dev \
        libgmp3-dev \
        libc-client-dev \
        libkrb5-dev \
    & rm -rf /var/lib/apt/lists/*

COPY redis.config.php /usr/src/nextcloud/config/redis.config.php
