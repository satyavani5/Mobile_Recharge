#!/usr/bin/env bash
mvn clean package && docker build -t service/Mobile_Recharge .
docker rm -f Mobile_Recharge || true && docker run -d -p 8080:8080 -p 9990:9990 --name Mobile_Recharge service/Mobile_Recharge
