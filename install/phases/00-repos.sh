#!/usr/bin/env bash
# Phase 00: Add APT/PPA repositories
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

# Prefer curl, fallback to wget (curl may not be installed yet)
if command -v curl &>/dev/null; then
  CURL="curl"
elif [[ -x /usr/bin/curl ]]; then
  CURL="/usr/bin/curl"
else
  CURL=""
fi

info "Add apt-repository..."
# Docker: only fetch GPG/keyrings when missing (avoid re-download every run)
sudo install -m 0755 -d /etc/apt/keyrings
if [[ ! -f /etc/apt/keyrings/docker.gpg ]]; then
  info "Add Docker repository (official keyrings)..."
  if [[ -n "$CURL" ]]; then
    "$CURL" -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
  else
    wget -qO- https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
  fi
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
else
  silly "Docker keyring already present, skipping download."
fi
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release 2>/dev/null && echo "${VERSION_CODENAME}" || lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Yarn: only fetch GPG when missing
if [[ ! -f /etc/apt/keyrings/yarn.gpg ]]; then
  info "Add Yarn repository (keyrings)..."
  if [[ -n "$CURL" ]]; then
    "$CURL" -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/yarn.gpg
  else
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/yarn.gpg
  fi
  sudo chmod a+r /etc/apt/keyrings/yarn.gpg
else
  silly "Yarn keyring already present, skipping download."
fi
echo "deb [signed-by=/etc/apt/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list >/dev/null

add_ppa_if_needed ppa:longsleep/golang-backports -y

# PHP PPA: skip if Ubuntu codename not supported by ondrej/php (e.g. questing)
UBUNTU_CODENAME=$(. /etc/os-release 2>/dev/null && echo "${VERSION_CODENAME}" || lsb_release -cs)
if [[ "$UBUNTU_CODENAME" == "noble" || "$UBUNTU_CODENAME" == "jammy" || "$UBUNTU_CODENAME" == "mantic" || "$UBUNTU_CODENAME" == "focal" ]]; then
  add_ppa_if_needed ppa:ondrej/php -y
else
  silly "PHP PPA skipped (ondrej/php does not support '$UBUNTU_CODENAME'; install PHP from ubuntu package or add PPA later)."
  # Remove leftover ondrej/php questing repo (avoid apt update 404)
  for f in /etc/apt/sources.list.d/ondrej-ubuntu-php-*.sources /etc/apt/sources.list.d/ondrej-php-*.list; do
    if [[ -f "$f" ]] && grep -q "questing" "$f" 2>/dev/null; then
      sudo rm -f "$f" && info "Removed broken repo: $f"
    fi
  done
fi

add_ppa_if_needed ppa:bamboo-engine/ibus-bamboo -y

# LazyGit: PPA may be gone; skip on error, phase 50 will install from GitHub release if needed
add_ppa_if_needed ppa:lazygit-team/daily -y || silly "lazygit PPA skipped (will use binary in phase 50 if needed)."

info "[Done] Add apt-repository"

# Remove broken PPA/repos from apt-get update output (no update call inside → minimize update count)
# Usage: remove_broken_repos "$apt_out"
remove_broken_repos() {
  local apt_out="$1"
  local removed=0

  # 1) Repo has no Release file (404, codename not supported)
  if echo "$apt_out" | grep -q "does not have a Release file"; then
    echo "$apt_out" | sed -n "s/.*repository '\\([^']*\\)'.*does not have a Release file.*/\\1/p" | while read -r repo; do
      [[ -z "$repo" ]] && continue
      base=$(echo "$repo" | awk '{print $1}')
      [[ -z "$base" ]] && continue
      for f in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
        [[ -f "$f" ]] || continue
        if grep -qF "$base" "$f" 2>/dev/null; then
          sudo rm -f "$f" && info "Removed broken repo: $f"
        fi
      done
    done
    removed=1
  fi

  # 2) DNS error: "Something wicked happened resolving 'host'" / "No address associated with hostname"
  if echo "$apt_out" | grep -qE "No address associated with hostname|Something wicked happened resolving"; then
    echo "$apt_out" | grep -oE "resolving '[^']+'" | sed "s/resolving '\\([^']*\\)'/\\1/" | while read -r host; do
      host="${host%%:*}"  # baltocdn.com:https -> baltocdn.com
      [[ -z "$host" ]] && continue
      for f in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
        [[ -f "$f" ]] || continue
        if grep -qF "$host" "$f" 2>/dev/null; then
          sudo rm -f "$f" && info "Removed unreachable repo ($host): $f"
        fi
      done
    done
    removed=1
  fi

  [[ $removed -eq 1 ]]
}

# Run apt-get update at most 2 times: once initially, once after removing repos (if needed)
apt_out=$(sudo apt-get update -y 2>&1) || true
if echo "$apt_out" | grep -qE "Err:|E: The repository|does not have a Release file|Something wicked|No address associated"; then
  info "Removing broken PPA/repos (check log)..."
  remove_broken_repos "$apt_out"
  apt_out=$(sudo apt-get update -y 2>&1) || true
fi
if echo "$apt_out" | grep -qE "Err:|E: The repository|does not have a Release file"; then
  warning "Some repos still failing after removing broken ones. Main errors:"
  echo "$apt_out" | grep -E "Err:|E: |W: Failed" | head -20
  warning "You may remove files in /etc/apt/sources.list.d/ manually or wait for repos to recover."
fi
