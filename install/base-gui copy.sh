#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh 

if [[ $(whoami) == "administrator"
    || $(whoami) == "imlong"
    || $(whoami) == "longvox" ]];
then
    info "Install GUI application!"

    tryInstall install gnome-tweak-tool
    tryInstall install gufw
    tryInstall install gdebi-core
    tryInstall install ubuntu-restricted-extras
    tryInstall install kazam
    tryInstall install flameshot
    tryInstall install vlc
    tryInstall installDeb https://repo.skype.com/latest/skypeforlinux-64.deb
    tryInstall installDeb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    tryInstall installSh https://raw.githubusercontent.com/puneetsl/lotion/master/setup.sh
    tryInstall install firefox
    tryInstall installSnap spotify
    tryInstall installSnap mailspring
    tryInstall installSnap onlyoffice-desktopeditors
    tryInstall installSnap postman
    tryInstall installSnap zoom-client
    tryInstall installSnap caprine
    tryInstall install alacritty
else
    error "Not available GUI!"
fi
