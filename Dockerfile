FROM alpine:latest

ADD supervisord.conf /etc/supervisord.conf
ADD xrdp.ini /etc/xrdp/xrdp.ini
ADD entry.sh /entry.sh

RUN apk update && apk add --no-cache \
    xvfb \
    x11vnc \
    openssl \
    icewm \
    adwaita-icon-theme \
    supervisor \
    xterm \
    bash \
    xrdp \
    wqy-zenhei \
    sudo \
    shadow \
    xrandr
RUN chmod +x /entry.sh

ENV DISPLAY :0

EXPOSE 3389

ENTRYPOINT ["/bin/bash", "-c", "/entry.sh"]
