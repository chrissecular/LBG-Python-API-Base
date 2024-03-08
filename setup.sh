#!/bin/bash
set -e

cleanup () {
    docker stop $(docker ps -q) || true
    docker rm $(docker ps -aq) || true
    docker rmi $(docker images -q) || true
}

build_docker (){
    docker build -t $DOCKER_IMAGE:$VERSION .
}

modify_app () {
    export PORT=8000
}
run_docker (){
    docker run  -d -p 80:$PORT -e PORT=$PORT $DOCKER_IMAGE:$VERSION 
}
