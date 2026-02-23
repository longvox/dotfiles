#!/usr/bin/env bash
# Phase 20: Symlink dotfiles (Stow)
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

# When running sudo ./bootstrap.sh, $HOME=/root; stow into real user's home
TARGET_HOME="${HOME}"
if [[ -n "${SUDO_USER:-}" ]]; then
    TARGET_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    info "Running as root → stowing into $TARGET_HOME (user $SUDO_USER)"
fi

info "Using Stow to create symlinks for all directories"
info "================================================="
cd "$DOT_DIR" || exit 1
# --adopt: existing target files (.bashrc, .profile...) are moved into dot/ then replaced by symlink
stow --adopt --verbose . -vt "$TARGET_HOME"
cd "$DOTFILES_ROOT" || exit 1
info "All symlinks created using Stow"
