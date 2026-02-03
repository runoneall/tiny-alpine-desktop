FROM alpine:latest

RUN apk update
RUN apk add --no-cache xvfb x11vnc openssl icewm adwaita-icon-theme supervisor xterm bash xrdp wqy-zenhei

ADD supervisord.conf /etc/supervisord.conf
ADD xrdp.ini /etc/xrdp/xrdp.ini
ADD entry.sh /entry.sh

RUN chmod +x /entry.sh
RUN openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/xrdp/key.pem -out /etc/xrdp/cert.pem -days 365
RUN chmod 600 /etc/xrdp/key.pem
RUN chmod 600 /etc/xrdp/cert.pem

ENV USER_PASSWD="user"

EXPOSE 3389

ENTRYPOINT ["/bin/bash", "-c", "/entry.sh"]
