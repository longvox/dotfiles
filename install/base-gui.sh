#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

info "Install GUI application!"

tryInstall install            \
    gnome-tweaks              \
    gufw                      \
    gdebi-core                \
    ubuntu-restricted-extras  \ 
    vlc

# 307 : Dash to Dock

# tryInstall installGnomeShellEx \
#     307

tryInstall installDeb \
    https://repo.skype.com/latest/skypeforlinux-64.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb


tryInstall installSnap         \
    spotify                    \
    mailspring                 \
    postman                    \
    zoom-client                \
    caprine                    \
    slack                      \
    dbeaver-ce                 \
    code                       \
    zotero-snap
    # onlyoffice-desktopeditors
