#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/install.sh

info "Update and Upgrade!"

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

info "Installing base app!"

tryInstall install software-properties-common
tryInstall install apt-transport-https
tryInstall install ca-certificates
tryInstall install gnupg-agent
tryInstall install build-essential
tryInstall install mesa-common-dev
tryInstall install libglu1-mesa-dev
tryInstall install libxrandr-dev
tryInstall install libssl-dev
tryInstall install libffi-dev
tryInstall install libxml2-dev
tryInstall install libx11-dev
tryInstall install libxslt1-dev
tryInstall install zlib1g-dev
tryInstall install libxi-dev
tryInstall install libxext-dev
tryInstall install libxtst-dev
tryInstall install curl
tryInstall install wget
tryInstall install git
tryInstall install ruby
tryInstall install htop
tryInstall install python-dev
tryInstall install python3-dev
tryInstall install python3-pip

tryInstall install docker-ce
tryInstall install docker-ce-cli
tryInstall install containerd.io

echo "Installing node, npm, nvm, yarn!"
tryInstall install nodejs
tryInstall install npm
tryInstall install yarn
tryInstall installSh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh

tryInstall install vim
tryInstall install neovim
