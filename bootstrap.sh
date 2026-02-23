#!/usr/bin/env bash
# Dotfiles bootstrap: run all install phases in order.
# Structure: install/lib/ (shared env, log, install helpers), install/phases/ (numbered scripts).
set -e
DOTFILES_ROOT=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)

# shellcheck source=install/lib/env.sh
source "$DOTFILES_ROOT/install/lib/env.sh"

info "Making phase scripts executable..."
chmod +x "$INSTALL_DIR/phases/"*.sh 2>/dev/null || true

for phase in "$INSTALL_DIR/phases/"*.sh; do
    [[ -f "$phase" ]] || continue
    info "Running $(basename "$phase")..."
    # shellcheck source=install/phases/00-repos.sh
    source "$phase"
done

info "Bootstrap complete."
