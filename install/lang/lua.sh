#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[lua] Installing ..."

tryInstall install              \
    lua5.4                      \
    liblua5.4-dev               \
    luarocks

sudo update-alternatives --config lua-compiler
sudo update-alternatives --config lua-interpreter
