#!/bin/bash

set -e

NAME=$1
DOCKER_FILE=$2
DOCKER_FOLDER=$(dirname $DOCKER_FILE)
OUTPUT_FILE=$3
TEST_COMMAND=$4
TEST_VALUE=$5

DOCKER_BUILD_OUT=$(docker build -q -t $NAME:bazel -f $DOCKER_FILE $DOCKER_FOLDER)

if [ -n "$TEST_COMMAND" ]; then
	DOCKER_TEST=$(docker run -t --rm $NAME:bazel bash -c "$TEST_COMMAND")
	echo $DOCKER_TEST | grep -e "$TEST_VALUE" > /dev/null
fi

echo $NAME@$DOCKER_BUILD_OUT > $OUTPUT_FILE