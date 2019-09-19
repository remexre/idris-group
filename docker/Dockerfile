FROM ubuntu:18.04

# Install APT dependencies.
ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential cabal-install curl git gosu less man-db python3 sudo tmux tree vim-nox unzip zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

# Install some useful tools.
RUN curl -L https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb -o /tmp/bat.deb \
 && curl -L https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb -o /tmp/fd.deb \
 && curl -L https://github.com/sharkdp/hexyl/releases/download/v0.5.1/hexyl_0.5.1_amd64.deb -o /tmp/hexyl.deb \
 && curl -L https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb -o /tmp/ripgrep.deb \
 && curl -L https://github.com/watchexec/watchexec/releases/download/1.10.3/watchexec-1.10.3-x86_64-unknown-linux-gnu.deb -o /tmp/watchexec.deb \
 && dpkg -i /tmp/bat.deb /tmp/fd.deb /tmp/hexyl.deb /tmp/ripgrep.deb /tmp/watchexec.deb \
 && rm /tmp/bat.deb /tmp/fd.deb /tmp/hexyl.deb /tmp/ripgrep.deb /tmp/watchexec.deb \
 && curl -L https://github.com/XAMPPRocky/tokei/releases/download/v10.0.1/tokei-v10.0.1-x86_64-unknown-linux-gnu.tar.gz | tar zxC /usr/local/bin

# Install an improved bashrc.
RUN curl -L https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc >> /root/.bashrc

# Install Idris.
RUN cabal update \
 && cabal install idris --prefix /usr/local \
 && find /root -exec chown 777 {} \;

# Finishing touches.
ADD login.sh /usr/local/bin/login.sh
ADD sudoers-nopasswd /etc/sudoers.d/nopasswd
