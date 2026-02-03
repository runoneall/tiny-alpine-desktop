
# Alpine Linux with IceWM, and XRDP
FROM alpine:latest

# Set user and password
ENV USER_PASSWD=user
RUN adduser -D -s /bin/ash user && echo "user:$USER_PASSWD" | chpasswd && echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install packages
RUN apk add --no-cache icewm xrdp sudo supervisor tigervnc

# Configure xrdp
COPY xrdp.ini /etc/xrdp/xrdp.ini
RUN sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/xrdp/sesman.ini

# Configure session
COPY .xsession /home/user/.xsession
RUN chown user:user /home/user/.xsession

# Configure supervisord
COPY supervisord.conf /etc/supervisord.conf

# Expose RDP port
EXPOSE 3389

# Start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
