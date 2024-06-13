FROM ubuntu:latest

ARG GPAC_VERSION=2.4.0
ENV GPAC_VERSION=${GPAC_VERSION}

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q build-essential pkg-config g++ git cmake yasm zlib1g-dev \
    && rm -r /var/cache/apt \
    && rm -r /var/lib/apt/lists

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
