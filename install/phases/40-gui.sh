#!/usr/bin/env bash
# Phase 40: GUI applications
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Install GUI application!"
tryInstall install            \
    gnome-tweaks              \
    gufw                      \
    gdebi-core                \
    ubuntu-restricted-extras  \
    kitty

tryInstall installSnap         \
    spotify                   \
    mailspring                 \
    postman                    \
    zoom-client                \
    caprine                    \
    slack                      \
    dbeaver-ce
