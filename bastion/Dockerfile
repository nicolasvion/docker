FROM alpine:latest

# Adding missing repository
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories

# Install required packages
RUN apk add --no-cache openssh mysql-client postgresql-client zsh git nfs-utils\
    rpcbind mongodb-tools mongodb jq curl vim shadow netcat-openbsd && \
    cd /usr/local/bin && \
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -L https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz | tar xvz && \
    mv /usr/local/bin/linux-amd64/helm /usr/local/bin/helm && \
    rm -rf /usr/local/bin/linux-amd64 && \
    chmod +x /usr/local/bin/kubectl /usr/local/bin/helm

RUN ssh-keygen -A && \
    mkdir -p /root/.ssh && \
    sed -i s/root:!/"root:*"/g /etc/shadow && \
    sed -i s/ash/zsh/g /etc/passwd

# Set a zshrc
ADD etc/zshrc /root/.zshrc

# Set a motd
ADD etc/motd.txt /etc/motd

# Copy sshd config
ADD etc/ssh/sshd_config /etc/ssh/sshd_config

# Add update-keys daemon
ADD update-keys.sh /root/update-keys.sh

# Copy run script
ADD run.sh /run.sh

# Expose SSH
EXPOSE 22

# CMD
CMD ["/run.sh"]
