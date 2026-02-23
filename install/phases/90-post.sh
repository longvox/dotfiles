#!/usr/bin/env bash
# Phase 90: Cleanup + default shell
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Cleanup temp and apt cache..."
sudo rm -rf "$TEMP_INSTALL_DIR"
sudo du -sh /var/cache/apt/archives 2>/dev/null || true
sudo du -sh /var/cache/apt 2>/dev/null || true
sudo apt-get clean
sudo apt-get autoremove -y
sudo apt-get autoclean -y

zsh_path=""
if command_exists zsh; then
    zsh_path=$(command -v zsh)
    if ! grep -qF "$zsh_path" /etc/shells 2>/dev/null; then
        info "Adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
    fi
    if [[ "$SHELL" != "$zsh_path" ]]; then
        info "Configuring zsh as default shell"
        chsh -s "$zsh_path"
        info "Default shell changed to $zsh_path"
    fi
else
    warning "zsh not found. Install zsh and re-run to set it as default shell."
fi

info "Done. Reload your terminal."
