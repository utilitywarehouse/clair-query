FROM alpine

ENV CLAIR_VERSION="4.0.5"

RUN apk --no-cache add bash libc6-compat &&\
    wget -O /usr/local/bin/clairctl https://github.com/quay/clair/releases/download/v${CLAIR_VERSION}/clairctl-linux-amd64 &&\
    chmod +x /usr/local/bin/clairctl

COPY query /usr/local/bin/query

ENTRYPOINT ["query"]
