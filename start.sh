#!/bin/sh
set -e

if [ "$1" = "sh" ];
then
    sh
    exit 0
fi

if [ "$VOLUME" = "" ];
then
    export VOLUME="/data"
fi

if [ "$TYPE" = "" ];
then
    export TYPE="vanilla"
fi

if [ "$TYPE" = "" ];
then
    export TYPE="vanilla"
fi


if [ "$XMX" = "" ];
then
    export XMX="1024M"
fi

if [ "$XMS" = "" ];
then
    export XMS="1024M"
fi

if [ "$SERVER_FILE" = "" ];
then
    export SERVER_FILE="$VOLUME/server-$TYPE.jar"
fi

cd "$VOLUME"

if [ ! -f "$SERVER_FILE" ];
then
    source /installers/$TYPE.sh
    cdir="$PWD"
    install "$SERVER_FILE"
    cd "$PWD"
fi
cd "$VOLUME"
java -jar -Xmx$XMX -Xms$XMS $@ -jar "$SERVER_FILE" nogui 




