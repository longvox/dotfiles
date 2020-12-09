#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/install.sh

info "Update and Upgrade!"

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

info "Installing base app!"

tryInstall install              \
    software-properties-common  \
    apt-transport-https         \
    ca-certificates             \
    gnupg-agent                 \
    build-essential             \
    mesa-common-dev             \
    libglu1-mesa-dev            \
    libxrandr-dev               \
    libssl-dev                  \
    libffi-dev                  \
    libxml2-dev                 \
    libx11-dev                  \
    libxslt1-dev                \
    zlib1g-dev                  \
    libxi-dev                   \
    libxext-dev                 \
    libxtst-dev                 \
    curl                        \
    wget                        \
    jq                          \
    sed                         \
    unzip                       \
    git                         \
    ruby                        \
    ruby-dev                    \
    htop                        \
    python-dev                  \
    python3-dev                 \
    python3-pip                 \
    tmux                        \
    mongodb-org                 \
    mongodb-org-server          \
    mongodb-org-mongos          \
    mongodb-org-shell           \
    mongodb-org-tools

tryInstall install \
    docker-ce      \
    docker-ce-cli  \
    containerd.io

echo "Installing node, npm, nvm, yarn!"
tryInstall install \
    nodejs         \
    npm            \
    yarn

tryInstall installSh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh

tryInstall install \
    vim            \
    neovim
