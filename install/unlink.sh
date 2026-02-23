#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
# shellcheck source=install/utils/log.sh
source "$PATH_CURRENT/utils/log.sh"

DOT="${HOME}/.dotfiles/dot"

info "Using Stow to create symlinks for all directories"
info "================================================="

cd "$DOT" || exit 1

stow -D . -t "$HOME"

info "All symlinks created using Stow"
