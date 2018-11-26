#!/usr/bin/env bash
docker run -d --privileged=true \
  --cap-add=SYS_ADMIN \
  --name doctorai -p 2222:22 -p 9530:9530 \
  -v $(pwd)/../data:/mnt/data \
  doctorai sh -c "/usr/bin/sudo -i -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh start"
