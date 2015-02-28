FROM golang:latest
MAINTAINER dochang@gmail.com

ENV HOME /

RUN CGO_ENABLED=0 go get -a -installsuffix nocgo github.com/cyfdecyf/cow && \
    rm -rf src/* pkg /usr/src/go/pkg/linux_amd64_nocgo

EXPOSE 7777

CMD ["cow"]
