# APT/PPA helpers: check and add PPA only when not already present
[[ -n "${_DOTFILES_LIB_APT_LOADED:-}" ]] && return
_DOTFILES_LIB_APT_LOADED=1

# Check if PPA is already added (file in sources.list.d with Launchpad URI containing slug)
# Usage: ppa_exists "ppa:user/name"
# Return: 0 = present, 1 = not present
# Exact match: must have launchpad + slug (avoid false positive)
ppa_exists() {
  local ppa="$1"
  [[ "$ppa" == ppa:* ]] || return 1
  local slug="${ppa#ppa:}"  # longsleep/golang-backports
  local f
  for f in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
    [[ -f "$f" ]] || continue
    if grep -q "launchpad" "$f" 2>/dev/null && grep -qF "$slug" "$f" 2>/dev/null; then
      return 0
    fi
  done
  return 1
}

# Add PPA only when not present. Skip if already added. On failure log warning and return 1.
# Usage: add_ppa_if_needed "ppa:user/name"   or   add_ppa_if_needed "ppa:user/name" -y
add_ppa_if_needed() {
  local ppa="$1"
  shift
  if ppa_exists "$ppa"; then
    silly "PPA $ppa already added, skipping."
    return 0
  fi
  info "Add-apt-repository $ppa..."
  local err
  err=$(sudo add-apt-repository "$ppa" "$@" 2>&1)
  local ret=$?
  echo "$err"
  if [[ $ret -ne 0 ]]; then
    warning "PPA $ppa failed (exit $ret). PPA may not exist or release not supported yet."
    return 1
  fi
  return 0
}
