#!/usr/bin/env bash
# Phase 05: Ubuntu base system config (locale, timezone, apt options)
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../lib/env.sh"

info "Configuring Ubuntu base..."

# APT: fast + safe config (force-confdef/confold, no lang, assume-yes)
APT_CONF="$INSTALL_DIR/apt-conf.d/99-dotfiles-apt.conf"
if [[ -f "$APT_CONF" ]]; then
  sudo cp "$APT_CONF" /etc/apt/apt.conf.d/99-dotfiles-apt.conf 2>/dev/null && info "APT config applied (faster + safer)." || true
fi

info "Configuring locale, timezone..."

# Locale: ensure en_US.UTF-8 (and optionally vi_VN)
if ! locale -a 2>/dev/null | grep -q "en_US.utf8"; then
    info "Generating locale en_US.UTF-8..."
    sudo locale-gen en_US.UTF-8
    sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
fi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Timezone: keep current or set (uncomment and set TZ to change)
# sudo timedatectl set-timezone Asia/Ho_Chi_Minh
if command -v timedatectl &>/dev/null; then
    silly "Current timezone: $(timedatectl show -p Timezone --value)"
fi

# Optional: GNOME/Ubuntu desktop defaults (no-op if not running in GNOME)
if command -v gsettings &>/dev/null && [[ -n "${DISPLAY:-}" ]]; then
    info "Applying GNOME base defaults..."
    gsettings set org.gnome.desktop.interface clock-show-weekday true 2>/dev/null || true
    gsettings set org.gnome.desktop.interface enable-animations true 2>/dev/null || true
    gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' 2>/dev/null || true
    gsettings set org.gnome.nautilus.preferences show-hidden-files true 2>/dev/null || true
    # Caps Lock → Escape (persistent)
    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']" 2>/dev/null && info "Caps Lock → Escape (persistent)." || true
    # Keyboard: faster repeat (nice for coding)
    gsettings set org.gnome.desktop.peripherals.keyboard delay 200 2>/dev/null || true
    gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25 2>/dev/null || true
    # Don't suspend when lid closed and on AC (laptop)
    # gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing' 2>/dev/null || true
    # Sleep when idle on AC: 30 min (0 = never; 30 = 30 min)
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0 2>/dev/null || true
    # Touchpad: tap-to-click on
    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true 2>/dev/null || true
    # Screen lock: delay 15 min (900 sec) before lock when idle
    gsettings set org.gnome.desktop.screen-saver lock-delay 900 2>/dev/null || true
    gsettings set org.gnome.desktop.session idle-delay 900 2>/dev/null || true
    # Nautilus: ask before overwriting
    gsettings set org.gnome.nautilus.preferences confirm-overwrite true 2>/dev/null || true
fi
# X11 fallback: Caps Lock → Escape (this session only; GNOME above is persistent)
if command -v setxkbmap &>/dev/null && [[ -n "${DISPLAY:-}" ]]; then
    setxkbmap -option caps:escape 2>/dev/null || true
fi

# Increase inotify watchers (Node/npm, IDEs, file watchers) - avoids "ENOSPC" on large projects
if [[ -f /proc/sys/fs/inotify/max_user_watches ]]; then
    current=$(cat /proc/sys/fs/inotify/max_user_watches 2>/dev/null)
    if [[ "$current" -lt 524288 ]] 2>/dev/null; then
        info "Raising inotify max_user_watches (for Node/IDE)..."
        echo "fs.inotify.max_user_watches=524288" | sudo tee /etc/sysctl.d/99-inotify-watches.conf >/dev/null
        sudo sysctl -p /etc/sysctl.d/99-inotify-watches.conf 2>/dev/null || true
    fi
fi

info "Ubuntu base config done."
