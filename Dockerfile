#######################################################
# Dockerfile for tinyproxy
#######################################################

FROM --platform=$BUILDPLATFORM alpine:3

MAINTAINER djhouseknecht

RUN set -xe \
    && apk add --no-cache tinyproxy \
    && sed -i -e '/^Allow /s/^/#/' \
              -e '/^ConnectPort /s/^/#/' \
              -e '/^#DisableViaHeader /s/^#//' \
              /etc/tinyproxy/tinyproxy.conf

VOLUME /etc/tinyproxy
EXPOSE 8888

CMD ["tinyproxy", "-d"]