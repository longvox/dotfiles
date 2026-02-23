#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Javascript] Installing ..."
tryInstall install \
    nodejs         \
    npm            \
    yarn


npm i diff-so-fancy -g

tryInstall installSh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh
