FROM debian:12

RUN apt-get update && apt-get install -y \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz \
    && tar -xzf portainer-2.19.1-linux-amd64.tar.gz \
    && rm portainer-2.19.1-linux-amd64.tar.gz
    
CMD ["/portainer/portainer"]
