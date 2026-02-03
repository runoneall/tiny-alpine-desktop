#!/bin/sh

echo "user:$USER_PASSWD" | chpasswd

mkdir -p /etc/x11vnc
x11vnc -storepasswd "$USER_PASSWD" /etc/x11vnc/passwd

/usr/bin/supervisord -n
