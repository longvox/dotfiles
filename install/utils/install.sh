#!/bin/bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/log.sh
chmod +x $PATH_CURRENT/install-gnome-shell.sh

isInstall() {
    dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i'
}

command_exists() {
    type "$1" > /dev/null 2>&1
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

installGem() {
    for package in "$@"
    do
        gem list | grep $package > /dev/null && silly "$package installed, moving on..." || sudo gem install $package
    done
}

installGo() {
    for package in "$@"
    do
        go list -m $package > /dev/null 2>&1 && silly "$package installed, moving on..." || go install $package
    done
}

installSnap() {
    for package in "$@"
    do
        snap list | grep $package > /dev/null && silly "$package installed, moving on..." || sudo snap install $package --classic
    done
}

installGnomeShellEx() {
    for id in "$@"
    do
        if gnome-extensions list | grep -q $id; then
            silly "$id installed, moving on..."
        else
            $PATH_CURRENT/install-gnome-shell.sh -o $id
        fi
    done
}

installDeb() {
    for url in "$@"
    do
        base=$(basename ${url})
        file=$(printf '%b' ${base//%/\\x})
        source_file="/home/$USER/.dotfiles/.temp-install/$file"
        download_folder="/home/$USER/.dotfiles/.temp-install"
        if [ ! -f "$source_file" ]; then
            wget -P $download_folder $url
        fi
        sudo dpkg -i $source_file
    done
}

installSh() {
    for url in "$@"
    do
        base=$(basename ${url})
        file=$(printf '%b' ${base//%/\\x})
        source_file="/home/$USER/.dotfiles/.temp-install/$file"
        download_folder="/home/$USER/.dotfiles/.temp-install"
        if [ ! -f "$source_file" ]; then
            wget -P $download_folder $url
        fi
        bash $source_file
    done
}

tryInstall() {
    function_install=$1
    array_package=${@:2}
    for package in $array_package
    do
    {
        script="$function_install $package"
        info "Installing $package!"
        eval $script
    } || {
        error "Install $package failed!"
    }
    done
}



