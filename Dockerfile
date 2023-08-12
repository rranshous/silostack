FROM ubuntu:22.04

RUN apt update && apt install uuid-runtime openssl -y

COPY ./ /app
WORKDIR /app
ENTRYPOINT ["./bin/entrypoint"]
