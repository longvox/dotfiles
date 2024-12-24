#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh

DOT=$HOME/.dotfiles/dot

info "Using Stow to create symlinks for all directories"
info "================================================="

cd $DOT

stow -D . -t $HOME

info "All symlinks created using Stow"
