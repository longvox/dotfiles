# Shared environment for install scripts. Source from phases via:
#   source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"
[[ -n "${_DOTFILES_LIB_ENV_LOADED:-}" ]] && return
_DOTFILES_LIB_ENV_LOADED=1

_LIB_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
INSTALL_DIR="$(cd "$_LIB_DIR/.." && pwd)"
DOTFILES_ROOT="$(dirname "$INSTALL_DIR")"
DOT_DIR="${DOT_DIR:-$DOTFILES_ROOT/dot}"
TEMP_INSTALL_DIR="${HOME}/.dotfiles/.temp-install"

export DOTFILES_ROOT INSTALL_DIR DOT_DIR TEMP_INSTALL_DIR

# shellcheck source=log.sh
source "$_LIB_DIR/log.sh"
# shellcheck source=install.sh
source "$_LIB_DIR/install.sh"
# shellcheck source=apt.sh
source "$_LIB_DIR/apt.sh"
