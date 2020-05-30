#!/usr/bin/env bash

echo NOTE: Invoke registry_setup.sh before running test

export registry=localhost:5000

# clear images from local cache
docker rmi $registry/myimage
docker rmi $registry/base 

echo Building base images
docker build base1 -t $registry/base:1
docker build base2 -t $registry/base:2
docker tag $registry/base:1 $registry/base:latest
docker push $registry/base  
