FROM ubuntu:22.04

RUN apt update && apt install uuid-runtime openssl ruby ruby-dev -y
RUN gem install sinatra

COPY ./ /app
WORKDIR /app
ENTRYPOINT ["./bin/entrypoint"]
