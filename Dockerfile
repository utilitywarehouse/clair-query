FROM quay.io/projectquay/clair:4.1.1

USER root

COPY query /usr/local/bin/query

ENTRYPOINT ["query"]
