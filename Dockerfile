FROM alpine:3.13

ENV KUBECTL_VERSION=1.21.0
ENV HELM_VERSION=3.5.4
ENV USER_NAME=user

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
  tcpdump \
  mtr \
  vim \
  nano \
  rsync \
  openssh-client \
  postgresql-client \
  iperf3 \
  && \
  adduser -D -u 1000 ${USER_NAME} && \
  sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers && \
  adduser ${USER_NAME} wheel && \
  curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
  wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O /tmp/helm.tar.gz && \
  tar xvzf /tmp/helm.tar.gz --strip-components=1 -C /usr/local/bin/ linux-amd64/helm && \
  rm -rf /tmp/*

USER 1000
