FROM lachlanevenson/k8s-kubectl:v1.20.1 as kubectl-image
FROM alpine/helm:3.4.2 as helm-image

FROM alpine:3.4

RUN apk add --no-cache --update ca-certificates \
    && apk add --no-cache  --update -t deps wget git openssh bash curl \
    && rm /var/cache/apk/*

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=helm-image    /usr/bin/helm          /usr/local/bin/helm
