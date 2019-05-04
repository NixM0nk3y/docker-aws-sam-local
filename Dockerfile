FROM alpine:3.9

LABEL maintainer="Nick Gregory <docker@openenterprise.co.uk>"

RUN apk add --no-cache --virtual .build-deps \
        gcc \
        python-dev \
        musl-dev \
    && apk add --no-cache \
        py-pip \
    && pip install awscli \
    && pip install aws-sam-cli \
    && apk del .build-deps \
&& rm -rf /var/cache/apk/*

WORKDIR /var/opt

EXPOSE 3000

ENTRYPOINT ["/usr/bin/sam"]
