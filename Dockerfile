FROM alpine:3.9

RUN apk add --no-cache \
  gnupg \
  command-not-found \
  bash-completion \
  ncdu \
  git \
  sudo \
  wget \
  curl \
  htop \
  axel \
  bind-tools \
  openjdk8 \
  vim \
  nano \
  perl \
  rsync \
  openssh-client \
  postgresql-client \
  mysql-client && \
  adduser -D -u 1000 user && \
  sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers && \
  adduser user wheel

USER 1000

CMD ["/bin/sh", "-c", "tail -f /dev/null"]
