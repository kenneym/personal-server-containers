#!/bin/bash

#Author: Matt Kenney, February 2019
# usage: ./all-compose.sh [up | down]
# Convenience script to docker compose up or docker compose down all
# Docker services contained in this repository

usage="usage: ./all-compose.sh [up | down]"

# Ensure correct num arguments were passed:
if [ "$#" -lt 1 ]; then
    echo 1>&2 "$usage"
    exit 1
fi

option=$1 # Option passed to command line

if [[ $option == "up" ]] || [[ $option == "u" ]] ; then
    docker-compose -f ./proxy/docker-compose.yml up -d 
    docker-compose -f ./nextcloud/compose/docker-compose.yml up -d
    docker-compose -f ./rocketchat/docker-compose.yml up -d 
    docker-compose -f ./gitlab/docker-compose.yml up -d 

elif [[ $option == "down" ]] || [[ $option == "d" ]] ; then
    docker-compose -f ./rocketchat/docker-compose.yml down
    docker-compose -f ./nextcloud/compose/docker-compose.yml down
    docker-compose -f ./gitlab/docker-compose.yml down 
    docker-compose -f ./proxy/docker-compose.yml down
else 
    echo 1>&2 "$usage"
    exit 1
fi
