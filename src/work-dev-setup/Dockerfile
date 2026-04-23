FROM fedora:latest

COPY install.sh /tmp/install.sh
RUN chmod +x /tmp/install.sh && /tmp/install.sh

LABEL org.opencontainers.image.title="Work Dev Setup Feature" \
      org.opencontainers.image.description="Personal development environment with system tools, dotfiles, and configuration"
