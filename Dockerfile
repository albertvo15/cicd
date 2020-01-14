FROM golang:1.8-alpine
#ADD . /go/src/hello-app
ADD . /go/src/github.com/albertvo15/cicd
RUN go install cicd

FROM alpine:latest
COPY --from=0 /go/bin/cicd .
ENV PORT 8080
CMD ["./cicd"]
