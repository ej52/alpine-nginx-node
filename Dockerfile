FROM ej52/alpine-nginx
MAINTAINER Elton Renda "https://github.com/ej52"

ENV NPM_VERSION=3
    
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --update nodejs=6.3.1-r0 && \
    cd / && \
    npm install -g npm@${NPM_VERSION} && \
    mkdir /app && \
    npm install -g grunt-cli gulp nodemon && \
    apk del gcc g++ linux-headers binutils-gold && \
    rm -rf /var/cache/apk/*

WORKDIR /app
