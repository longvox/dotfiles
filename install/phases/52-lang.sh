#!/usr/bin/env bash
# Phase 52: Optional languages (Java, Node, Go, PHP, Rust, Lua, Julia) via install/lang/
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

LANG_INDEX="$INSTALL_DIR/lang/index.sh"
if [[ -f "$LANG_INDEX" ]]; then
    info "Running optional language installs (lang/index.sh)..."
    # shellcheck source=install/lang/index.sh
    source "$LANG_INDEX"
else
    silly "No install/lang/index.sh, skipping."
fi
