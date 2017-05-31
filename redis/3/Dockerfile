FROM debian:jessie

RUN apt-get update && apt-get install -y \
	wget \
        --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

RUN wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
ADD dotdeb.list /etc/apt/sources.list.d/dotdeb.list

RUN apt-get update && apt-get install -y \
        redis-server \
        --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

ENTRYPOINT  ["/usr/bin/redis-server"]
