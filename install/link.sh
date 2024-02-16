#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

DOTFILES=$HOME/.dotfiles

info "Creating symlinks"
info "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename "$file" '.symlink' )"
    if [ -e "$target" ]; then
        info "~${target#$HOME} already exists... Skipping."
    else
        info "Creating symlink for $file"
        ln -s "$file" "$target"
    fi
done

info "Installing to ~/.config"
info "=============================="
if [ ! -d "$HOME/.config" ]; then
    info "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

config_files=$( find "$DOTFILES/config" -maxdepth 1 2>/dev/null )
for config in $config_files; do
    target="$HOME/.config/$( basename "$config" )"
    if [ -e "$target" ]; then
        info "~${target#$HOME} already exists... Skipping."
    else
        info "Creating symlink for $config"
        ln -s "$config" "$target"
    fi
done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

info "Creating vim symlinks"
info "=============================="

path_nvim="$HOME/.vim:$DOTFILES/config/nvim"
VIMFILES=("$path_nvim")

for file in ${VIMFILES[@]}; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e "${KEY}" ]; then
        warning "${KEY} already exists... skipping."
    else
        info "Creating symlink for $KEY"
        ln -s "${VALUE}" "${KEY}"
    fi
done

info "Copy bin"
info "=============================="

path_bin="$DOTFILES/bin/*"
cp $path_bin ~/.local/bin/

