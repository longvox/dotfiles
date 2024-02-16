#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/../utils/install.sh

info "[Rust] Installing ..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
