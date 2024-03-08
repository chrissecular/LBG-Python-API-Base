#!/bin/bash
set -e

export DOCKER_IMAGE=lbg
export VERSION=1.1

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

cleanup
build_docker
modify_app
run_docker