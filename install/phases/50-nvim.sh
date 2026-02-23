#!/usr/bin/env bash
# Phase 50: Neovim + CLI tools
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

# Neovim: skip download if already installed at /opt/nvim (avoid re-download every run)
case "$(uname -m)" in
    x86_64)  nvim_arch="x86_64" ;;
    aarch64|arm64) nvim_arch="arm64" ;;
    *) info "Unsupported arch $(uname -m), skipping Neovim tarball"; nvim_arch="" ;;
esac
if [[ -n "$nvim_arch" ]]; then
    if [[ -x /opt/nvim/bin/nvim ]] || command -v nvim &>/dev/null; then
        silly "Neovim already installed at /opt/nvim, skipping."
    else
        nvim_tarball="nvim-linux-${nvim_arch}.tar.gz"
        info "Downloading Neovim ($nvim_arch)..."
        curl -fsSL -o "$nvim_tarball" "https://github.com/neovim/neovim/releases/latest/download/${nvim_tarball}"
        sudo rm -rf /opt/nvim "/opt/nvim-linux-${nvim_arch}"
        sudo tar -C /opt -xzf "$nvim_tarball"
        sudo ln -sfn "/opt/nvim-linux-${nvim_arch}" /opt/nvim
        rm -f "$nvim_tarball"
    fi
fi

tryInstall install curl wget ranger caca-utils highlight atool w3m poppler-utils mediainfo
# PEP 668: use pipx (install only when missing, avoid re-running every time)
if command -v pipx &>/dev/null; then
  pipx list 2>/dev/null | grep -q "spotify-cli-linux" || pipx install spotify-cli-linux 2>/dev/null || true
  pipx list 2>/dev/null | grep -q "pynvim" || pipx install pynvim 2>/dev/null || true
else
  tryInstall installPip spotify-cli-linux 2>/dev/null || true
  tryInstall installPip pynvim 2>/dev/null || true
fi
tryInstall install ripgrep
tryInstall install lazygit
# Lazydocker: skip if already installed (script would re-download every time)
if command -v lazydocker &>/dev/null; then
  silly "lazydocker already installed, skipping."
else
  tryInstall installSh https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
fi
