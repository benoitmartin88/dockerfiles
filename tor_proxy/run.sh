#!/bin/bash

docker run --rm \
    -p 9050:9050 \
    --name tor_proxy \
    benoitmartin/tor_proxy

