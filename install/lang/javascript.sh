#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Javascript] Installing ..."
tryInstall install \
    nodejs         \
    npm            \
    yarn


npm i diff-so-fancy -g

tryInstall installSh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh
