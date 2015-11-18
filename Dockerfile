FROM golang:alpine
MAINTAINER dochang@gmail.com

ENV HOME /

RUN set -ex && \
    buildDeps='git' && \
    apk add --update-cache ${buildDeps} && \
    pkgroot=github.com/cyfdecyf/cow && \
    git clone --branch 0.9.6 https://${pkgroot}.git src/${pkgroot} && \
    CGO_ENABLED=0 go get -a -installsuffix nocgo ${pkgroot} && \
    rm -rf src/* pkg /usr/local/go/pkg/linux_amd64_nocgo && \
    apk del ${buildDeps} && \
    rm -rf /var/cache/apk/*

EXPOSE 7777

CMD ["cow"]
