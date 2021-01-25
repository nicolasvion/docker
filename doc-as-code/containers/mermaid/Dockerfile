# Dockerfile used to run mermaid
FROM node:5

# Install last working version
RUN npm install -g mermaid@7.0.11 && \
    npm install -g phantomjs

# Copy examples files
WORKDIR /mnt/src
COPY scripts/entrypoint_mermaid /bin/entrypoint_mermaid

# Generate png
ENTRYPOINT ["/bin/entrypoint_mermaid"]
