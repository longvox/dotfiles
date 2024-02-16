#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh

info "Add apt-repository!!!!${reset}"

info "Add-apt-repository docker!"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y

info "Add-apt-repository yarn!"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


# info "Add-apt-repository lazygit!"
# sudo add-apt-repository ppa:lazygit-team/daily -y

info "[Done] Add apt-repository"
sudo apt-get update -y
