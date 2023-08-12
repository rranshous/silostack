#!/usr/bin/env bash

RACK_ENV="${RACK_ENV:-development}"

docker kill silostack
docker rm silostack
docker run --name silostack -it \
	-p 8445:4567 \
	-v /etc/letsencrypt:/etc/letsencrypt:ro \
	-e SSL_CERT_PATH=/etc/letsencrypt/live/lookhere.shotinthegun.com/fullchain.pem \
	-e SSL_KEY_PATH=/etc/letsencrypt/live/lookhere.shotinthegun.com/privkey.pem \
	-e RACK_ENV=${RACK_ENV} \
	rranshous/silostack
docker rm silostack
