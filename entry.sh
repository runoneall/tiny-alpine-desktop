#!/bin/bash

if [ -z "${USER_PASSWD}" ]; then
  echo "ERROR: The USER_PASSWD environment variable is not set." >&2
  echo "Please run the container with '-e USER_PASSWD=your_password'" >&2
  exit 1
fi

passwd -d root
x11vnc -storepasswd "$USER_PASSWD" /etc/x11vnc.pass

/usr/bin/supervisord
