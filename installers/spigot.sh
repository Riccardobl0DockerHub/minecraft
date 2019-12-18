#!/bin/bash
set -e
export DURL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

function install {
    mkdir -p /tmp/spigot-dl
    cd  /tmp/spigot-dl
    curl "$DURL" -o BuildTools.jar
    java -jar BuildTools.jar
    mv spigot-*.jar "$1"
    cd /tmp 
    rm -Rf spigot-dl

    mkdir -p  "$VOLUME/config/"
    echo eula=true > "$VOLUME/config/eula.txt"
}