#!/usr/bin/env bash
# Optional language runtimes. Edit to enable/disable (comment = skip).
LANG_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
# shellcheck source=../lib/env.sh
source "$LANG_DIR/../lib/env.sh"

info "[Language] Installing (see index.sh to enable/disable)..."

source "$LANG_DIR/python.sh"
source "$LANG_DIR/ruby.sh"
source "$LANG_DIR/javascript.sh"
source "$LANG_DIR/java.sh"
source "$LANG_DIR/go.sh"
# source "$LANG_DIR/php.sh"
source "$LANG_DIR/rust.sh"
# source "$LANG_DIR/lua.sh"
# source "$LANG_DIR/julia.sh"
