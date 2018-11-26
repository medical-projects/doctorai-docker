#!/usr/bin/env bash
DOCKER_TAG_NAME=${1:-doctorai}
docker build -t $DOCKER_TAG_NAME .

