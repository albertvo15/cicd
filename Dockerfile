FROM golang:1.8-alpine
#ADD . /go/src/hello-app
#ADD . /go/src/github.com/albertvo15/cicd/hello-app
#ADD . /go/src/hello-app
#RUN go install hello-app
#RUN go install github.com/albertvo15/cicd/hello-app



# Create the proper directory.
RUN mkdir -p $GOPATH/src/hello-app

# Copy app to the proper directory for building.
ADD . $GOPATH/src/hello-app

# Set the work directory.
WORKDIR $GOPATH/src/hello-app

# Run CMD commands.
RUN go get -d -v ./...
RUN go install -v ./...


FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
ENV PORT 8080
CMD ["./hello-app"]
