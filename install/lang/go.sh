#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Go] Installing ..."

tryInstall install              \
    golang-go

tryInstall installGo golang.org/x/tools/cmd/goimports@latest
tryInstall installGo mvdan.cc/gofumpt@latest
tryInstall installGo github.com/fatih/gomodifytags@latest
tryInstall installGo github.com/josharian/impl@latest
