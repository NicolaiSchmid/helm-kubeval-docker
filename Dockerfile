FROM alpine:latest

RUN apk add --update --no-cache curl openssl

RUN curl -LO https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
RUN tar xf kubeval-linux-amd64.tar.gz

FROM nicolaischmid/helm-docker:3.5.4

COPY --from=0 /kubeval /usr/bin

