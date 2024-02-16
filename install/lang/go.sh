#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Go] Installing ..."
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
tryInstall install              \
    golang-go

tryInstall installGo github.com/jesseduffield/lazygit@latest
tryInstall installGo golang.org/x/tools/cmd/goimports@latest
tryInstall installGo mvdan.cc/gofumpt@latest
tryInstall installGo github.com/fatih/gomodifytags@latest
tryInstall installGo github.com/josharian/impl@latest
