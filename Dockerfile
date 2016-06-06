FROM golang:1.6-wheezy
MAINTAINER Máximo Cuadros <mcuadros@gmail.com>

ENV DOCKER_HOST unix:///var/run/docker.sock

ENV GCE_DOCKER_PATH /go/src/github.com/mcuadros/gce-docker/

RUN go get github.com/Masterminds/glide
RUN mkdir -p $GCE_DOCKER_PATH
ADD . $GCE_DOCKER_PATH
ENV GOPATH /go
WORKDIR $GCE_DOCKER_PATH

RUN glide install

RUN go build -o /bin/gce-docker .

CMD ["gce-docker"]
