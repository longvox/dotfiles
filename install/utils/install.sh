#!/bin/bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/log.sh

isInstall() {
    dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i'
}

install() {
    for package in "$@"
    do
        isInstall $package && silly "$package installed, moving on..." || sudo apt-get install -y $package
    done
}

installPip() {
    for package in "$@"
    do
        pip3 list | grep $package > /dev/null && silly "$package installed, moving on..." || pip3 install $package
    done
}

installSnap() {
    for package in "$@"
    do
        sudo snap install $package
    done
}

installDeb() {
    URL=$1
    BASE=$(basename ${URL})
    FILE=$(printf '%b' ${BASE//%/\\x})
    SOURCE_FILE="/home/$USER/.dotfiles/.temp-install/$FILE"
    DOWNLOAD_FOLDER="/home/$USER/.dotfiles/.temp-install"
    if [ ! -f "$SOURCE_FILE" ]; then 
        wget -P $DOWNLOAD_FOLDER $URL
    fi
    sudo dpkg -i $SOURCE_FILE
}

installSh() {
    URL=$1
    BASE=$(basename ${URL})
    FILE=$(printf '%b' ${BASE//%/\\x})
    SOURCE_FILE="/home/$USER/.dotfiles/.temp-install/$FILE"
    DOWNLOAD_FOLDER="/home/$USER/.dotfiles/.temp-install"
    if [ ! -f "$SOURCE_FILE" ]; then 
        wget -P $DOWNLOAD_FOLDER $URL
    fi
    bash $SOURCE_FILE
}