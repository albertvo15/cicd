FROM golang:1.8-alpine
#ADD . /go/src/hello-app
ADD . /go/src/github.com/albertvo15/cicd/hello-app
RUN go install github.com/albertvo15/cicd/hello-app

FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
ENV PORT 8080
CMD ["./hello-app"]
