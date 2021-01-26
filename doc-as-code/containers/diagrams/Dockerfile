FROM python:alpine3.12

RUN apk update && apk add --no-cache \
    graphviz python3 py3-pip terminus-font ttf-opensans\
  && pip3 install diagrams \
  && rm -rf /var/cache/*

WORKDIR /mnt/images

ENTRYPOINT ["python3"]
