#!/bin/bash

if [ -z "${USER_PASSWD}" ]; then
    echo "ERROR: USER_PASSWD is not set." >&2
    exit 1
fi

echo "user:$USER_PASSWD" | chpasswd

echo "exec /usr/bin/icewm-session" > /home/user/.xsession
chmod +x /home/user/.xsession
chown user:user /home/user/.xsession

mkdir -p /var/run/xrdp
chown xrdp:xrdp /var/run/xrdp
rm -rf /var/run/xrdp/*.pid

exec /usr/bin/supervisord -c /etc/supervisord.conf
