#!/usr/bin/env bash

if [[ -z "$GPAC_VERSION" ]]; then
	GPAC_VERSION=2.4.0
fi

docker build \
  --build-arg GPAC_VERSION=$GPAC_VERSION \
  -t "niktheblak/gpac:$GPAC_VERSION" \
  -t niktheblak/gpac:latest \
  .
