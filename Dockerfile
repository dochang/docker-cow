FROM busybox:latest
MAINTAINER dochang@gmail.com

ENV HOME /

RUN busybox sh -c 'mkdir -p /usr/local/bin ; bin=/usr/local/bin/cow ; \
    wget -O - "http://dl.chenyufei.info/cow/cow-linux64-0.9.4.gz" \
    | gzip -d > "${bin}" ; chmod +x "${bin}" ; \
    mkdir -p "${HOME%%/}/.cow" ; touch "${HOME%%/}/.cow/rc"'

EXPOSE 7777

CMD ["cow"]
