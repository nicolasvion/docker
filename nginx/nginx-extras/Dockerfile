FROM debian:jessie

RUN apt-get update && apt-get install -y \
        wget \
        ca-certificates \
        --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

RUN wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
ADD nginx-extras/dotdeb.list /etc/apt/sources.list.d/dotdeb.list

RUN apt-get update && apt-get install -y \
        lua-cjson \
        lua-iconv \
        nginx-extras \
        --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

ADD nginx-extras/nginx.conf nginx-extras/prometheus.lua /etc/nginx/
ADD nginx-extras/metrics.conf /etc/nginx/conf.d

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
        && ln -sf /dev/sdterr /var/log/nginx/error.log

EXPOSE 80 9913 443

CMD ["nginx", "-g", "daemon off;"]
