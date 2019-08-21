FROM golang:1.12-alpine as build-base
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh make bzr
ENV GO111MODULE on
RUN go get github.com/liftbridge-io/liftbridge
RUN go get github.com/nats-io/nats-server/v2

FROM alpine:latest
COPY --from=build-base /go/bin/liftbridge /usr/local/bin/liftbridge
COPY --from=build-base /go/bin/nats-server /usr/local/bin/nats-server
COPY nats-server.conf nats-server.conf

# Expose Liftbridge and Nats: client and management
EXPOSE 9292 4222 8222
VOLUME "/tmp/liftbridge/liftbridge-default"

COPY script_runner.sh script_runner.sh
RUN chmod +x script_runner.sh
CMD ./script_runner.sh