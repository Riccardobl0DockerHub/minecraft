#!/bin/bash
set -e
export DURL="https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar"

function install {
    mkdir -p /tmp/vanilla-dl
    cd  /tmp/vanilla-dl
    curl "$DURL" -o server-vanilla.jar
    ls -l /data
    mv server-vanilla.jar "$1"
    cd /tmp 
    rm -Rf vanilla-dl
    echo eula=true > "$VOLUME/eula.txt"

}