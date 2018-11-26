#!/usr/bin/env bash
docker run -it --privileged=true \
  --cap-add=SYS_ADMIN \
  --name doctorai -p 2222:22 -p 9530:9530 \
  -v $(pwd)/../data:/mnt/data \
  doctorai /bin/bash


