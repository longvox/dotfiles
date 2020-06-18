#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/dotfiles-backup

# colors output
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

set -e # Exit immediately if a command exits with a non-zero status.

echo "${green}Creating backup directory at $BACKUP_DIR${reset}"
mkdir -p "$BACKUP_DIR"

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

for file in $linkables; do
    filename=".$( basename "$file" '.symlink' )"
    target="$HOME/$filename"
    if [ -f "$target" ]; then
        echo "${green}backing up $filename${reset}"
        cp "$target" "$BACKUP_DIR"
    else
        echo "${red}$filename does not exist at this location or is a symlink${reset}"
    fi
done

for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
    if [[ ! -L "$filename" && -d "$filename" ]]; then
        echo "${green}backing up $filename${reset}"
        cp -rf "$filename" "$BACKUP_DIR"
    else
        echo "${red}$filename does not exist at this location or is a symlink${reset}"
    fi
done
