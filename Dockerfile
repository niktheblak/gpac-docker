FROM ubuntu:latest

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y gpac \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/MP4Box"]
