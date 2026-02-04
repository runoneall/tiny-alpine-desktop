FROM alpine:latest

COPY daemon.sh entry.sh /
COPY xrdp.ini /etc/xrdp/xrdp.ini

RUN apk add --no-cache \
    xvfb \
    x11vnc \
    icewm \
    xterm \
    bash \
    xrdp \
    sudo \
    ttf-dejavu \
    && chmod +x /daemon.sh /entry.sh

ENV DISPLAY=:0

EXPOSE 3389

ENTRYPOINT ["/entry.sh"]
