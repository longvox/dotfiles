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
    htop                        \
    tmux                        \
    xdotool                     \
    font-manager                \
    xclip                       \
    wmctrl                      \
    fish                        \
    ibus ibus-bamboo            

tryInstall install \
    docker-ce      \
    docker-ce-cli  \
    containerd.io

sudo usermod -a -G docker $USER

tryInstall installPip thefuck

info "Intall Ibus..."
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

source $(dirname "$(readlink -f "$BASH_SOURCE")")/lang/index.sh
