#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/install/utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/install/utils/install.sh

# set policies executable
info "set policies executable"
chmod +x install/link.sh
chmod +x install/base-repository.sh
chmod +x install/base.sh
chmod +x install/base-gui.sh
chmod +x install/base-nvim.sh
chmod +x install/base-zsh.sh
chmod +x install/git.sh

info "Add base repository."
. install/base-repository.sh

info "Installing dotfiles."
. install/base.sh

info "Link dotfiles."
. install/link.sh

info "Installing other."
. install/git.sh
. install/base-gui.sh
. install/base-nvim.sh
. install/base-zsh.sh

info "After install dotfiles."
. install/after-install.sh

if ! command_exists zsh; then
    info "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    info "Configuring zsh as default shell"
    chsh -s "$(command -v zsh)"
fi

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    info "adding $zsh_path to /etc/shells"
    info "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    info "default shell changed to $zsh_path"
fi

info "Done. Reload your terminal."
