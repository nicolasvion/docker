FROM jagregory/pandoc
COPY scripts/install-fonts /usr/local/bin/install-fonts
RUN apt-get update && \
    apt-get install -y unzip curl && \
    curl -sLo /tmp/muli.zip https://fonts.google.com/download?family=Muli && \
    mkdir -p /usr/share/fonts/truetype/muli && \
    cd /usr/share/fonts/truetype/muli && \
    unzip /tmp/muli.zip && \
    rm -f /tmp/muli.zip && \
    apt-get remove --purge -y unzip curl && \
    rm -rf /var/cache/apt/*

WORKDIR /mnt/src
COPY scripts/entrypoint_pandoc /bin/entrypoint_pandoc
COPY templates /templates
ENTRYPOINT ["/bin/entrypoint_pandoc"]
