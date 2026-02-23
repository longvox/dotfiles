#!/usr/bin/env bash
# Phase 80: Zsh + Oh My Zsh + plugins + Starship
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

install_zsh_plugin() {
    local url="$1"
    local name="$2"
    local dest="${ZSH_CUSTOM}/plugins/${name}"
    if [[ -d "$dest" ]]; then silly "Installed $name!"; else info "Installing $name!"; git clone "$url" "$dest"; fi
}

tryInstall install zsh

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
    info "Installing oh-my-zsh!"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    silly "Installed oh-my-zsh!"
fi

install_zsh_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git" "zsh-syntax-highlighting"
install_zsh_plugin "https://github.com/zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
install_zsh_plugin "https://github.com/zsh-users/zsh-history-substring-search" "zsh-history-substring-search"
install_zsh_plugin "https://github.com/zsh-users/zsh-completions" "zsh-completions"
install_zsh_plugin "https://github.com/lukechilds/zsh-nvm" "zsh-nvm"
install_zsh_plugin "https://github.com/jeffreytse/zsh-vi-mode" "zsh-vi-mode"
install_zsh_plugin "https://github.com/sunlei/zsh-ssh" "zsh-ssh"
install_zsh_plugin "git@github.com:jscutlery/nx-completion.git" "nx-completion"

if command_exists starship; then silly "Starship already installed!"; else info "Installing starship prompt..."; sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y; fi
