#!/usr/bin/env bash
# Phase 10: Base system packages
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Update and Upgrade!"
sudo apt update -y
# Skip upgrade/dist-upgrade when DOTFILES_SKIP_APT_UPGRADE=1 (faster re-bootstrap)
if [[ -z "${DOTFILES_SKIP_APT_UPGRADE:-}" ]]; then
  sudo apt upgrade -y
  sudo apt dist-upgrade -y
else
  silly "Skipping apt upgrade/dist-upgrade (DOTFILES_SKIP_APT_UPGRADE set)."
fi

info "Installing base app!"
tryInstall install              \
    software-properties-common  \
    apt-transport-https         \
    ca-certificates             \
    gnupg-agent                 \
    build-essential             \
    mesa-common-dev             \
    libglu1-mesa-dev            \
    libxrandr-dev               \
    libssl-dev                  \
    libffi-dev                  \
    libxml2-dev                 \
    libx11-dev                  \
    libxslt1-dev                \
    zlib1g-dev                  \
    libxi-dev                   \
    libxext-dev                 \
    libxtst-dev                 \
    curl                        \
    wget                        \
    jq                          \
    sed                         \
    unzip                       \
    pass                        \
    git                         \
    hub                         \
    htop                        \
    tmux                        \
    xdotool                     \
    font-manager                \
    pandoc                      \
    xclip                       \
    wmctrl                      \
    ibus ibus-bamboo            \
    mariadb-client              \
    stow

tryInstall install fzf lm-sensors speedtest-cli fd-find
# neofetch dropped on newer Ubuntu; fallback to fastfetch
if apt-cache show neofetch &>/dev/null; then
    tryInstall install neofetch
else
    tryInstall install fastfetch || true
fi

tryInstall install eza || true
# termdown: installed in phase 60 via pipx

# pipx: for Python CLI (avoid PEP 668 externally-managed-environment) in phase 50/60
tryInstall install pipx || true
# Dev tools: ripgrep, bat, shellcheck, direnv, just, sqlite3, tree, ncdu, yq
tryInstall install ripgrep shellcheck direnv sqlite3 tree ncdu || true
if apt-cache show bat &>/dev/null; then
    tryInstall install bat || true
else
    tryInstall install batcat || true
fi
tryInstall install just || true
tryInstall install yq || true

tryInstall install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin podman
sudo usermod -a -G docker "$USER" 2>/dev/null || true

# Ibus/Bamboo: only run in GUI session (avoid hang when running over SSH/CLI)
if [[ -n "${DISPLAY:-}" && "${XDG_SESSION_TYPE:-}" = wayland || "${XDG_SESSION_TYPE:-}" = x11 ]]; then
    info "Install Ibus..."
    ibus restart 2>/dev/null || true
    env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" 2>/dev/null \
        && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]" 2>/dev/null || true
else
    silly "Skip Ibus config (no graphical session). Run again in a GUI terminal to set Bamboo."
fi
