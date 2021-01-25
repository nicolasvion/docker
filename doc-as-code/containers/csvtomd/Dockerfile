FROM alpine
RUN apk upgrade --no-cache \
  && apk add --no-cache \
    musl \
    build-base \
    python3 py3-pip \
    bash \
    git \
  && pip3 install --no-cache-dir --upgrade pip \
  && pip3 install csvtomd \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/* \
  && mkdir /mnt/src

WORKDIR /mnt/src
COPY scripts/entrypoint_csvtomd /bin/entrypoint_csvtomd

# Generate md
ENTRYPOINT ["/bin/entrypoint_csvtomd"]
