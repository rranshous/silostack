#!/usr/bin/env bash

RACK_ENV="${RACK_ENV:-development}"

docker kill silostack
docker rm silostack
docker run --name silostack -it \
	-p 8445:4567 \
	-e RACK_ENV=${RACK_ENV} \
	rranshous/silostack
docker rm silostack
