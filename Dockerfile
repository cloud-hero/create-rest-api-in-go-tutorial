FROM golang:alpine

COPY . /code
RUN cd /code && go build main.go

FROM alpine

COPY --from=0 /code/main /go-rest
RUN chmod u+x /go-rest
RUN apk add ca-certificates curl busybox-extras --no-cache
RUN update-ca-certificates
CMD ["./go-rest"]
