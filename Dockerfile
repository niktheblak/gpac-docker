FROM ubuntu:latest

ARG GPAC_VERSION=2.4.0
ENV GPAC_VERSION=${GPAC_VERSION}

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y build-essential pkg-config g++ git cmake yasm zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/gpac/gpac/archive/refs/tags/v${GPAC_VERSION}.tar.gz /root/gpac.tar.gz

RUN cd ~ \
    && tar xf gpac.tar.gz \
    && cd gpac-${GPAC_VERSION} \
    && ./configure --static-bin \
    && make \
    && make install \
    && cd ~ \
    && rm -r gpac-${GPAC_VERSION} \
    && rm gpac.tar.gz

ENTRYPOINT ["/usr/local/bin/MP4Box"]
