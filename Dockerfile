FROM openjdk:21-slim

COPY FLIX_* /tmp/
RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p /opt/flix && \
    cd /opt/flix && \
    wget https://github.com/flix/flix/releases/download/v$(cat /tmp/FLIX_VERSION)/flix.jar && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
