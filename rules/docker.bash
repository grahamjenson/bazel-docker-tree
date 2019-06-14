#!/bin/bash
output=$1
shift
echo "docker $@"
docker $@ > $output