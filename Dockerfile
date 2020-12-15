FROM alpine:latest
LABEL description="alpine with go and statuscake community library" \
      maintainer="Sergey Bryzgalov <sergey.bryzgalov@jetbrains.com>" \
      source="https://jetbrains.team/p/im/code/statuscake-exporter"
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    groupadd --gid 1024 statuscake-exporter && \
    useradd \
        --uid 1024 \
        --gid 1024 \
        --create-home \
        --shell /bin/bash \
        statuscake-exporter

COPY bin/statuscake-exporter /statuscake-exporter

USER 1024
ENTRYPOINT ["/statuscake-exporter"]
