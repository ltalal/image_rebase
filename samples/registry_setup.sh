#!/usr/bin/env bash

export registry=localhost:5000

docker run -d -p 5000:5000 --name registry registry:2
docker pull centos:6 && docker pull centos:7
docker tag centos:6 $registry/centos:6 && docker tag centos:7 $registry/centos:7
docker push $registry/centos