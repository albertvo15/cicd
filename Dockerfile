FROM alpine

MAINTAINER Balazs Nadasdi <yitsushi@cheppers.com>

# Update package index and install go + git
RUN apk add --update go git

# Set up GOPATH
RUN mkdir /go
ENV GOPATH /go

# Get dependencies
RUN go get gopkg.in/mgo.v2 && \
    go get github.com/go-martini/martini && \
    go get gopkg.in/redis.v3

# Add current working directory
#ADD . /go/src/github.com/Yitsushi/livetogether

# Build it :)
#RUN go install github.com/Yitsushi/livetogether

# Every time I start the container I want to rebuild
# because I mount it when I use it for development
#ENTRYPOINT go install github.com/Yitsushi/livetogether && \
#           /go/bin/livetogether --config=/go/src/github.com/Yitsushi/livetogether/config.json

# Expose where the application wants to listen
EXPOSE 80
