FROM alpine:3.11

MAINTAINER  Charles Sibbald <charles@georgiapipeline.io>


#install deps and install gsutil
RUN apk add --update \
    python \
    py-pip \
    py-cffi \
    py-cryptography \
  && pip install --upgrade pip \
  && apk add --virtual build-deps \
    gcc \
    libffi-dev \
    python-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
  && pip install gsutil \
  && apk del build-deps \
  && rm -rf /var/cache/apk/*

CMD ["gsutil"]
