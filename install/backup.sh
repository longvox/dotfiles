#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory
DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/dotfiles-backup

info "Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

for file in $linkables; do
    filename=".$( basename "$file" '.symlink' )"
    target="$HOME/$filename"
    if [ -f "$target" ]; then
        info "backing up $filename"
        cp "$target" "$BACKUP_DIR"
    else
        error "$filename does not exist at this location or is a symlink"
    fi
done

for filename in "$HOME/.config/nvim"; do
    if [[ ! -L "$filename" && -d "$filename" ]]; then
        info "backing up $filename"
        cp -rf "$filename" "$BACKUP_DIR"
    else
        error "$filename does not exist at this location or is a symlink"
    fi
done
