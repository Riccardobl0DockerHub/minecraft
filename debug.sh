#!/bin/bash
# VOLUME="/srv/test" ./debug.sh [-Xmx1024M ... ]
if [ "$VOLUME" = "" ];
then
    export VOLUME="/tmp/mctest0029"
fi
mkdir -p "$VOLUME"
chown 1000:1000 -Rvf "$VOLUME"
docker stop mctest0029debug || true
docker rm mctest0029debug || true
docker rmi mctest0029 || true
docker build -t mctest0029 .
docker run --name="mctest0029debug"  -eTYPE="spigot"  -v $VOLUME:/data --rm -it mctest0029 $@