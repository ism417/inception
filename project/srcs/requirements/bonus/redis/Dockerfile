FROM debian:12

RUN apt-get update && apt-get install -y redis-server php-redis && \
    sed -i 's|bind 127.0.0.1|bind 0.0.0.0|g' /etc/redis/redis.conf \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

CMD ["redis-server","--protected-mode no"]