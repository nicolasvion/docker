# Dockerfile used to run mermaid
FROM node:5

# Install last working version
RUN npm install -g mermaid@7.0.11 && \
    npm install -g phantomjs && \
    mkdir /data

# Copy examples files
COPY files/ /data/
WORKDIR /data

# Generate png
# ENTRYPOINT ["/bin/bash", "/data/generate-png.sh"]
