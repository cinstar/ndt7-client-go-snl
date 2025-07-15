FROM golang:1.20-alpine3.18 AS ndt7-client-build
WORKDIR /go/src/github.com/m-lab/ndt7-client
ADD . ./
RUN go get ./cmd/ndt7-client
RUN go build -o /ndt7-client ./cmd/ndt7-client

FROM alpine:3.18
WORKDIR /app
COPY --from=ndt7-client-build /ndt7-client ./
ENTRYPOINT ["./ndt7-client"]