#!/usr/bin/env bash

if [[ -z "$GPAC_VERSION" ]]; then
	GPAC_VERSION=2.0.0
fi

docker build \
  -t "niktheblak/gpac:$GPAC_VERSION" \
  -t niktheblak/gpac:latest \
  .
