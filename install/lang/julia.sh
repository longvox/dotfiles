#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Julia] Installing ..."
cd "$HOME" || exit 1
curl -fsSL https://install.julialang.org | sh
cd "$INSTALL_DIR" || true
