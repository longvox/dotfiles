#!/usr/bin/env bash
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

DOTFILES=$HOME/.dotfiles

echo -e "${green}\\nCreating symlinks${reset}"
echo "${green}==============================${reset}"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename "$file" '.symlink' )"
    if [ -e "$target" ]; then
        echo "${green}~${target#$HOME} already exists... Skipping.${reset}"
    else
        echo "${green}Creating symlink for $file${reset}"
        ln -s "$file" "$target"
    fi
done

echo -e "${green}\\n\\ninstalling to ~/.config${reset}"
echo "${green}==============================${reset}"
if [ ! -d "$HOME/.config" ]; then
    echo "${green}Creating ~/.config${reset}"
    mkdir -p "$HOME/.config"
fi

config_files=$( find "$DOTFILES/config" -maxdepth 1 2>/dev/null )
for config in $config_files; do
    target="$HOME/.config/$( basename "$config" )"
    if [ -e "$target" ]; then
        echo "${green}~${target#$HOME} already exists... Skipping.${reset}"
    else
        echo "${green}Creating symlink for $config${reset}"
        ln -s "$config" "$target"
    fi
done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

echo -e "${green}\\n\\nCreating vim symlinks${reset}"
echo "${green}==============================${reset}"

path_nvim="$HOME/.vim:$DOTFILES/config/nvim"
path_vim="$HOME/.vimrc:$DOTFILES/config/nvim/init.vim"
VIMFILES=("$path_nvim" "$path_vim")

for file in ${VIMFILES[@]}; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e "${KEY}" ]; then
        echo "${green}${KEY} already exists... skipping.${reset}"
    else
        echo "${green}Creating symlink for $KEY${reset}"
        ln -s "${VALUE}" "${KEY}"
    fi
done

echo -e "${green}\\n\\nCopy bin${reset}"
echo "${green}==============================${reset}"

path_bin="$DOTFILES/bin/*"
cp "$path_bin" "~/.local/bin"

