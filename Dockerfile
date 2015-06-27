FROM golang:latest
MAINTAINER dochang@gmail.com

ENV HOME /

RUN pkgroot=github.com/cyfdecyf/cow && \
    git clone --branch 0.9.6 https://${pkgroot}.git src/${pkgroot} && \
    CGO_ENABLED=0 go get -a -installsuffix nocgo ${pkgroot} && \
    rm -rf src/* pkg /usr/src/go/pkg/linux_amd64_nocgo

EXPOSE 7777

CMD ["cow"]
