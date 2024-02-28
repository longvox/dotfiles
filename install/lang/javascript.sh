#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Javascript] Installing ..."
tryInstall install \
    nodejs         \
    npm            \
    yarn

tryInstall installSh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh
