#!/bin/bash

# Exit if USER_PASSWD is not set or is empty
if [ -z "${USER_PASSWD}" ]; then
  echo "ERROR: The USER_PASSWD environment variable is not set." >&2
  echo "Please run the container with '-e USER_PASSWD=your_password'" >&2
  exit 1
fi

# Set the user password for RDP login
echo "user:$USER_PASSWD" | chpasswd

# Create the VNC password file for x11vnc server
x11vnc -storepasswd "$USER_PASSWD" /etc/x11vnc.pass

# Start supervisord to manage all services
/usr/bin/supervisord
