FROM golang:alpine
MAINTAINER dochang@gmail.com

ENV HOME /

RUN set -ex && \
    build_deps='git' && \
    apk add --update-cache --virtual build-dependencies ${build_deps} && \
    pkgroot=github.com/cyfdecyf/cow && \
    git clone --branch 0.9.6 https://${pkgroot}.git src/${pkgroot} && \
    CGO_ENABLED=0 go get -a -installsuffix nocgo ${pkgroot} && \
    rm -rf src/* pkg /usr/local/go/pkg/linux_amd64_nocgo && \
    apk del --purge build-dependencies && \
    rm -rf /var/cache/apk/*

EXPOSE 7777

CMD ["cow"]
