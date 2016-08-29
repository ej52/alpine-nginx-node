FROM ej52/alpine-nginx
MAINTAINER Elton Renda "https://github.com/ej52"
    
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --update nodejs && \
    cd / && \
    npm install -g npm && \
    mkdir /app && \
    npm install -g grunt-cli gulp && \
    sed -i 's#/var/www#/var/www/build#g' /etc/nginx/conf.d/default.conf && \
    rm -rf /var/cache/apk/*

WORKDIR /app
