#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Go] Installing ..."

tryInstall install              \
    golang-go

tryInstall installGo golang.org/x/tools/cmd/goimports@latest
tryInstall installGo mvdan.cc/gofumpt@latest
tryInstall installGo github.com/fatih/gomodifytags@latest
tryInstall installGo github.com/josharian/impl@latest
