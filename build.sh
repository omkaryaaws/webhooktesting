#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t omkaryacool/testingbuild:${VERSION} .
docker push omkaryacool/testingbuild:${VERSION}
docker -H tcp://172.31.9.244:2375 stop nginx
docker -H tcp://172.31.9.244:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx omkaryacool/testingbuild:${VERSION}
echo "---------------------"
