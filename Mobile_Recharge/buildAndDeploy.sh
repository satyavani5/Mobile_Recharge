#!/usr/bin/env bash
#deploy="false"
deploy="true"

image=Mobile_Recharge
version=1.0-SNAPSHOT
latest=true

#OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"
OPTIONS=""

docker build ${OPTIONS} -t service/${image}:1.0-SNAPSHOT .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push service/${image}:1.0-SNAPSHOT
    if [ "$latest" == "true" ]; then
        docker tag service/${image}:1.0-SNAPSHOT service/${image}:latest
        docker push service/${image}:latest
    fi
fi