FROM quay.io/utilitywarehouse/clair:4.0.5-uw.patch

RUN apk --no-cache add bash

COPY query /usr/local/bin/query

ENTRYPOINT ["query"]
