FROM quay.io/utilitywarehouse/clair

RUN apk --no-cache add bash

COPY query /usr/local/bin/query

ENTRYPOINT ["query"]
