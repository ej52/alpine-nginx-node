FROM ej52/alpine-nginx
MAINTAINER Elton Renda "https://github.com/ej52"

ENV NPM_VERSION=2
    
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.2/main" >> /etc/apk/repositories && \
    apk add --update nodejs=0.12.10-r0 && \
    cd / && \
    npm install -g npm@${NPM_VERSION} && \
    mkdir /app && \
    npm install -g grunt-cli gulp nodemon && \
    apk del gcc g++ linux-headers binutils-gold && \
    rm -rf /var/cache/apk/*

WORKDIR /app
