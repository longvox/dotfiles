#!/usr/bin/env bash
# shellcheck source=../lib/env.sh
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "[Rust] Installing ..."
# Non-interactive: do not prompt "1) Proceed / 2) Customize / 3) Cancel"
export RUSTUP_INIT_SKIP_PROMPT=1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# shellcheck source=/dev/null
source "$HOME/.cargo/env" 2>/dev/null || true
