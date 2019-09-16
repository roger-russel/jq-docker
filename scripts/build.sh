#!/bin/bash
set -e 

ROOT=$( dirname `readlink -f $0` )
ROOT_BIN=$(dirname "$ROOT")/jq
BUSYBOX=busybox:ubuntu-14.04
ALPINE=alpine:3.10.2
LATEST=1.6
IMAGE_NAME="rogerrussel/jq"

function build(){
    LABEL=$1
    TAG=$2

    docker build -t "${IMAGE_NAME}:${LABEL}" \
    --build-arg JQ_VERSION=$TAG \
    --build-arg FROM_IMG=scratch .
    
    echo "TESTING: ${IMAGE_NAME}:${LABEL}"
    test_scratch ${LABEL}
    echo "IT WORKS"

    docker build -t "${IMAGE_NAME}:${LABEL}-sh" \
    --build-arg JQ_VERSION=$TAG \
    --build-arg FROM_IMG=$BUSYBOX .

    echo "TESTING: ${IMAGE_NAME}:${LABEL}-sh"
    test_bash "${LABEL}-sh"
    echo "IT WORKS"

    docker build -t "${IMAGE_NAME}:${LABEL}-alpine" \
    --build-arg JQ_VERSION=$TAG \
    --build-arg FROM_IMG=$ALPINE .

    echo "TESTING: ${IMAGE_NAME}:${LABEL}-alpine"
    test_bash "${LABEL}-alpine"
    echo "IT WORKS"

    docker push ${IMAGE_NAME}:${LABEL}
    docker push ${IMAGE_NAME}:${LABEL}-sh
    docker push ${IMAGE_NAME}:${LABEL}-alpine

}

function test_scratch(){
    docker run "${IMAGE_NAME}:$1" jq --version

    # ToDo put tasts mounting volumes and seen output
}

function test_bash(){
    test_scratch $1

    # ToDo put more tests for images with bash
}

for file in $ROOT_BIN/*
do
    TAG=`echo $file | sed 's/.*jq-\([0-9.-]\+\)$/\1/'`
    build $TAG $TAG
done

build "latest" $LATEST
