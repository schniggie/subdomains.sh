#!/bin/bash
if [ $# -eq 0 ]; then
        docker run --rm -it subdomains.sh
elif [ $1 = "build" ]; then
        docker build . -t subdomains.sh
elif [ $1 = "destroy" ]; then
        docker rmi -f subdomains.sh:latest
else
        docker run --rm -it -v $PWD/resolvers.txt:/home/subdomains/resolvers.txt -v $PWD/subdomains.txt:/home/subdomains/subdomains.txt subdomains.sh $@
fi
