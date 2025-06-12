#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

info "Install GUI application!"

tryInstall install            \
    gnome-tweaks              \
    gufw                      \
    gdebi-core                \
    ubuntu-restricted-extras  

# 307 : Dash to Dock

# tryInstall installGnomeShellEx \
#     307


tryInstall installSnap         \
    spotify                    \
    mailspring                 \
    postman                    \
    zoom-client                \
    caprine                    \
    slack                      \
    dbeaver-ce
    # onlyoffice-desktopeditors
