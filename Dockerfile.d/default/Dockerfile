FROM ubuntu:22.04

ARG GID=0
ARG UID=0
ENV GID=${GID:-0}
ENV UID=${UID:-0}

# Set in non-interactive mode only in build time.
ARG DEBIAN_FRONTEND=noninteractive

RUN :\
  && echo 'apt::install-recommends "false";' > /etc/apt/apt.conf.d/no-install-recommends\
  && apt-get update\
#   && :
# RUN :\
  && : Set up locales\
  && apt-get install --assume-yes locales procps dialog\
  && echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen\
  && locale-gen\
#   && :
# RUN :\
  && : Install basic packages\
  && apt-get install --assume-yes\
  apt-transport-https\
  apt-utils\
  ca-certificates\
  curl\
  dnsutils\
  git\
  gnupg\
  gnupg2\
  jq\
  netcat\
  openssh-client\
  python3-pip\
  software-properties-common\
  sudo\
  tcpdump\
  tshark\
  unzip\
  zsh\
#   && :
# RUN :\
  && : Install starship\
  && curl "https://starship.rs/install.sh" -o "/tmp/install.sh"\
  && sh /tmp/install.sh --yes\
  && rm -rf /tmp/install.sh\
#   && :
# RUN :\
  && : Install Python packages\
  && pip3 install autoflake black isort\
#   && :
# RUN :\
  && : Clean up\
  && apt-get clean autoclean\
  && apt-get autoremove --yes\
  && rm -rf /tmp/*\
  && rm -rf /var/lib/apt/\
  && rm -rf /var/log/*\
  && :

COPY rootfs /

RUN :\
  # Create a user for development who has the same UID and GID as you.
  && useradd --comment '' --create-home --gid users --uid ${UID} developer\
  && groupadd --gid ${GID} developer\
  && usermod --append --groups developer developer || true\
  # It will be duplicate UID or GID with "node" user when your UID==1000 or GID==100.
  && echo '%users ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/grant-all-without-password-to-users\
  && echo '%developer ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/grant-all-without-password-to-developer\
  && :
