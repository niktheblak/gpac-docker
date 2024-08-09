FROM ubuntu:24.04

WORKDIR /app

ARG GPAC_VERSION=2.4.0
ENV GPAC_VERSION=${GPAC_VERSION}
ENV GPAC_ARCHIVE=gpac-${GPAC_VERSION}.tar.gz

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q build-essential pkg-config g++ git cmake yasm zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/gpac/gpac/archive/refs/tags/v${GPAC_VERSION}.tar.gz /root/${GPAC_ARCHIVE}

RUN cd /root \
    && tar xzf ${GPAC_ARCHIVE} \
    && cd gpac-${GPAC_VERSION} \
    && ./configure --static-bin \
    && make \
    && make install \
    && cd .. \
    && rm -r gpac-${GPAC_VERSION} \
    && rm ${GPAC_ARCHIVE}

ENTRYPOINT ["/usr/local/bin/MP4Box"]
