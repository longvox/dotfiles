#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

# set policies executable
echo "Set policies executable"
chmod +x install/backup.sh
chmod +x install/link.sh
chmod +x install/base.sh
chmod +x install/base-nvim.sh
chmod +x install/base-zsh.sh
chmod +x install/git.sh

echo "Backups dotfiles."
. install/backup.sh

echo "Link dotfiles."
. install/link.sh

echo "Installing dotfiles."
. install/base.sh
. install/base-nvim.sh
. install/base-zsh.sh
. install/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Linux" ]; then
    # after the install, install neovim python libraries
    echo -e "\\n\\nRunning Neovim Python install"
    echo "=============================="
    pip3 install pynvim

    # Change the default shell to zsh
    zsh_path="$( command -v zsh )"
    if ! grep "$zsh_path" /etc/shells; then
        echo "adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells
    fi

    if [[ "$SHELL" != "$zsh_path" ]]; then
	      chsh -s "$zsh_path"
	      echo -e "\\n\\ndefault shell changed to $zsh_path"
    fi
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s "$(command -v zsh)"
fi

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

echo "Done. Reload your terminal."
