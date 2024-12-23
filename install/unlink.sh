#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh

SYMLINKS=$HOME/.dotfiles/symlinks

info "Using Stow to create symlinks for all directories"
info "================================================="

cd $SYMLINKS


stow -D . -t $HOME

info "All symlinks created using Stow"
