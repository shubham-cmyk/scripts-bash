#!/bin/bash

DEF_NAME="redis-sentinel"
DEF_VERSION="0.0"
DEF_LOCATION="/home/shubham/opsTree/redis"
DEF_DOCKER_FILE="Dockerfile.sentinel"
DOCKER_REPO="shubham192001"



echo "Please Type the image name"
echo "Default is set to ${DEF_NAME}"
read NAME 
NAME=${NAME:-${DEF_NAME}}

echo "Please Type the image version"
echo "Default is set to ${DEF_VERSION}"
read VERSION
VERSION=${VERSION:-${DEF_VERSION}}

echo "Please Type the Location of Dockerfile"
echo "Default is set to ${DEF_LOCATION}"
read LOCATION 
LOCATION=${LOCATION:-${DEF_LOCATION}}

echo "Please Type the Name of Dockerfile"
echo "Default is set to ${DEF_DOCKER_FILE}"
read DOCKER_FILE
DOCKER_FILE=${DOCKER_FILE:-${DEF_DOCKER_FILE}}


echo "Building the image"
docker build  -f  ${LOCATION}/${DOCKER_FILE} -t ${DOCKER_REPO}/${NAME}:${VERSION} ${LOCATION}
sleep 1

echo "Pushing the image to docker hub"
docker push shubham192001/${NAME}:${VERSION}
