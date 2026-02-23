#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Lua] Installing ..."

tryInstall install              \
    lua5.4                      \
    liblua5.4-dev               \
    luarocks

sudo update-alternatives --config lua-compiler
sudo update-alternatives --config lua-interpreter
