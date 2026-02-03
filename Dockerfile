FROM alpine:latest

ADD supervisord.conf /etc/supervisord.conf
ADD xrdp.ini /etc/xrdp/xrdp.ini
ADD entry.sh /entry.sh

RUN chmod +x /entry.sh

RUN apk update && apk add --no-cache \
    xrdp \
    xorgxrdp \
    xorg-server \
    xf86-video-dummy \
    icewm \
    adwaita-icon-theme \
    supervisor \
    xterm \
    bash \
    wqy-zenhei \
    sudo \
    shadow \
    dbus
RUN adduser -D user \
    && adduser user wheel \
    && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel-users
RUN sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config || echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

EXPOSE 3389

ENTRYPOINT ["/bin/bash", "-c", "/entry.sh"]
