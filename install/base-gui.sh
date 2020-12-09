#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

if [[ $(whoami) == "administrator"
    || $(whoami) == "imlong"
    || $(whoami) == "longvox" ]];
then
    info "Install GUI application!"

    tryInstall install            \
        gnome-tweak-tool          \
        gufw                      \
        gdebi-core                \
        ubuntu-restricted-extras  \
        kazam                     \
        flameshot                 \
        vlc                       \
        alacritty                 \
        firefox                   \
        stacer

    # 1401: Bluetooth quick connect
    # 307 : Dash to Dock

    tryInstall installGnomeShellEx \
        1401 \
        307

    tryInstall installDeb \
        https://repo.skype.com/latest/skypeforlinux-64.deb \
        https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    tryInstall installSh \
        https://raw.githubusercontent.com/puneetsl/lotion/master/setup.sh

    tryInstall installSnap         \
        spotify                    \
        mailspring                 \
        onlyoffice-desktopeditors  \
        postman                    \
        zoom-client                \
        caprine                    \
        wps-2019-snap
else
    warning "Not available GUI!"
fi
