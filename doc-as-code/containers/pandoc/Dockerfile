FROM pandoc/latex:2.11.4

RUN apk update && \
    apk add --no-cache curl unzip && \
    curl -sLo /tmp/muli.zip https://fonts.google.com/download?family=Muli && \
    mkdir -p /usr/share/fonts/truetype/muli && \
    cd /usr/share/fonts/truetype/muli && \
    unzip /tmp/muli.zip && \
    rm -f /tmp/muli.zip && \
    apk del curl unzip && \
    rm -rf /var/cache/*

COPY scripts/install-fonts /usr/local/bin/install-fonts
COPY scripts/entrypoint_pandoc /bin/entrypoint_pandoc
COPY templates /templates

RUN tlmgr install footnotebackref pagecolor mdframed zref needspace titling \
    fontinst ttfutils xetex sourcesanspro ly1 sourcecodepro

WORKDIR /mnt/src

ENTRYPOINT ["/bin/entrypoint_pandoc"]
