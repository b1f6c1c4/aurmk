FROM archlinux:base-devel

RUN useradd -m builder && echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER builder:builder
WORKDIR /home/builder

COPY entrypoint.sh /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]
