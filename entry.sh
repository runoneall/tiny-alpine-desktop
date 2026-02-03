#!/bin/sh

if [ ! -z "$USER_PASSWD" ]; then
    echo "user:$USER_PASSWD" | chpasswd
fi

/usr/bin/supervisord -n
