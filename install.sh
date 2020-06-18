#!/usr/bin/env bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

command_exists() {
    type "$1" > /dev/null 2>&1
}

# set policies executable
echo "${green}set policies executable${reset}"
chmod +x install/backup.sh
chmod +x install/link.sh
chmod +x install/base.sh
chmod +x install/base-gui.sh
chmod +x install/base-nvim.sh
chmod +x install/base-zsh.sh
chmod +x install/git.sh

echo "${green}Backups dotfiles.${reset}"
. install/backup.sh

echo "${green}Link dotfiles.${reset}"
. install/link.sh

echo "${green}Installing dotfiles.${reset}"
. install/base.sh
. install/base-gui.sh
. install/base-nvim.sh
. install/base-zsh.sh
. install/git.sh

echo "${green}After install dotfiles.${reset}"
. install/after-install.sh

# only perform macOS-specific install
# after the install, install neovim python libraries
echo -e "${green}\\n\\nRunning Neovim Python install${reset}"
echo "${green}==============================${reset}"
pip3 install pynvim

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "${green}adding $zsh_path to /etc/shells${reset}"
    echo "${green}$zsh_path${reset}" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo -e "${green}\\n\\ndefault shell changed to $zsh_path${reset}"
fi

echo "${green}creating vim directories${reset}"
mkdir -p ~/.vim-tmp

if ! command_exists zsh; then
    echo "${green}zsh not found. Please install and then re-run installation scripts${reset}"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "${greem}Configuring zsh as default shell${reset}"
    chsh -s "$(command -v zsh)"
fi

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "${green}adding $zsh_path to /etc/shells${reset}"
    echo "${green}$zsh_path${reset}" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "${green}default shell changed to $zsh_path${reset}"
fi

echo "${green}Done. Reload your terminal.${reset}"
