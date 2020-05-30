#!/usr/bin/env bash

# base:latest is auto-detected

source prepare_images.sh

echo Building myimage
docker build auto -t $registry/myimage:1
docker push $registry/myimage:1

echo Running image:
docker run --rm $registry/myimage:1   

echo taging base:2 as latest
docker tag $registry/base:2 $registry/base:latest
docker push $registry/base:latest  

echo
echo taging base:2 as latest
docker tag $registry/base:2 $registry/base:latest
docker push $registry/base:latest  

echo
echo Rebasing image
../image_rebase $registry myimage:1
# repull from repository
docker pull $registry/myimage:1 

echo
echo Running rebased image with centos7+base2 layers:
docker run --rm  $registry/myimage:1    

