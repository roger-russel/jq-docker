#!/bin/bash
set -e 

ROOT=$( dirname `readlink -f $0` )
ROOT_BIN=$(dirname "$ROOT")/jq
BUSYBOX=busybox:ubuntu-14.04
LATEST=1.6

function build(){
    LABEL=$1
    TAG=$2

    docker build -t "rogerrussel/jq:${LABEL}" \
    --build-arg JQ_VERSION=$TAG \
    --build-arg FROM_IMG=scratch .

    docker build -t "rogerrussel/jq:${LABEL}-sh" \
    --build-arg JQ_VERSION=$TAG \
    --build-arg FROM_IMG=$BUSYBOX .

    docker push rogerrussel/jq:${LABEL}
    docker push rogerrussel/jq:${LABEL}-sh
}

for file in $ROOT_BIN/*
do
    TAG=`echo $file | sed 's/.*jq-\([0-9.-]\+\)$/\1/'`
    build $TAG $TAG
done

build "latest" $LATEST
