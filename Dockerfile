FROM dochang/confd:latest
MAINTAINER dochang@gmail.com

COPY scripts /scripts

RUN set -ex && \
    /scripts/golang/install.sh && \
    /scripts/cow/install.sh && \
    /scripts/golang/clean.sh && \
    /scripts/apk/clean.sh

ENV HOME /

EXPOSE 7777

CMD ["cow"]
