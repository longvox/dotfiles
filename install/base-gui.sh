#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

if [[ $(whoami) == "administrator"
    || $(whoami) == "imlong"
    || $(whoami) == "longvox" 
    || $(whoami) == "longvh" ]];
then
    info "Install GUI application!"

    tryInstall install            \
        gnome-tweaks              \
        gufw                      \
        gdebi-core                \
        ubuntu-restricted-extras  \
        flameshot                 \
        vlc                       \
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


    tryInstall installSnap         \
        spotify                    \
        mailspring                 \
        postman                    \
        zoom-client                \
        caprine                    \
        nvim                       \
        lotion                 
        # onlyoffice-desktopeditors  \    
else
    warning "Not available GUI!"
fi
