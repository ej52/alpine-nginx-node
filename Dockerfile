FROM ej52/alpine-nginx
MAINTAINER Elton Renda "https://github.com/ej52"

ENV NPM_VERSION=2
    
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.2/main" >> /etc/apk/repositories && \
    apk add --update nodejs=0.12.10-r0 && \
    cd / && \
    npm install -g npm@${NPM_VERSION} && \
    npm install -g grunt-cli gulp nodemon && \
    sed -i 's#/var/www#/var/www/build#g' /etc/nginx/conf.d/default.conf && \
    apk del gcc g++ linux-headers binutils-gold && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www
