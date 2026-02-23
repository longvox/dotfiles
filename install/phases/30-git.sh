#!/usr/bin/env bash
# Phase 30: Git config (interactive when TTY, no prompt when non-interactive)
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Setting up Git..."

# When sudo: configure git for real user, not root
ORIG_HOME="${HOME}"
if [[ -n "${SUDO_USER:-}" ]]; then
    HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
fi
export HOME

defaultName=$(git config --global user.name 2>/dev/null)
defaultEmail=$(git config --global user.email 2>/dev/null)
defaultGithub=$(git config --global github.user 2>/dev/null)

# Only prompt when TTY and not sudo/CI/non-interactive (sudo ./bootstrap.sh → no prompt)
if [[ -t 0 && -z "${SUDO_USER:-}" && -z "${CI:-}" && -z "${DOTFILES_NONINTERACTIVE:-}" ]]; then
    echo
    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email
    read -rp "Github username [$defaultGithub] " github
    name="${name:-$defaultName}"
    email="${email:-$defaultEmail}"
    github="${github:-$defaultGithub}"
else
    # Non-interactive: keep existing config or leave empty
    name="${defaultName}"
    email="${defaultEmail}"
    github="${defaultGithub}"
    silly "Non-interactive: keeping existing git user (or set git config --global user.name/email later)."
fi

# Only set when value non-empty; all git commands || true so set -e never exits bootstrap
[[ -n "${name}" ]] && git config --global user.name "${name}" || true
[[ -n "${email}" ]] && git config --global user.email "${email}" || true
[[ -n "${github}" ]] && git config --global github.user "${github}" || true

if [[ "$(uname)" == "Darwin" ]]; then
    git config --global credential.helper "osxkeychain" || true
elif [[ -t 0 && -z "${SUDO_USER:-}" && -z "${CI:-}" && -z "${DOTFILES_NONINTERACTIVE:-}" ]]; then
    read -rn 1 -p "Save user and password to an unencrypted file? [y/N] " save
    if [[ "$save" =~ ^([Yy])$ ]]; then
        git config --global credential.helper "store" || true
    else
        git config --global credential.helper "cache --timeout 3600" || true
    fi
else
    git config --global credential.helper "cache --timeout 3600" || true
fi
# Restore HOME so following phases are unaffected
[[ -n "${ORIG_HOME:-}" ]] && export HOME="$ORIG_HOME"
