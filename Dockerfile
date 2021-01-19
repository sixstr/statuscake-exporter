FROM golang:1.12 AS builder
WORKDIR /bin
ADD . .
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build .

FROM alpine:3.9
LABEL maintainer="sergey.bryzgalov@jetbrains.com"
EXPOSE 9190
RUN apk add ca-certificates && mkdir /app
WORKDIR /app
COPY --from=builder /bin/statuscake_exporter /app
ENTRYPOINT ["/app/statuscake_exporter"]
