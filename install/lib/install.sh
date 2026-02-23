#!/usr/bin/env bash
# Package/install helpers. Requires INSTALL_DIR and TEMP_INSTALL_DIR (from env.sh).
[[ -n "${_DOTFILES_LIB_INSTALL_LOADED:-}" ]] && return
_DOTFILES_LIB_INSTALL_LOADED=1

[[ -d "$INSTALL_DIR/utils" ]] && chmod +x "$INSTALL_DIR/utils/install-gnome-shell.sh" 2>/dev/null || true

isInstall() {
    dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i'
}

command_exists() {
    type "$1" &>/dev/null
}

# Install multiple packages in one apt-get call (optimized for phase 10)
install() {
    local to_install=()
    local p
    for p in "$@"; do
        if isInstall "$p"; then
            silly "$p installed, moving on..."
        else
            to_install+=("$p")
        fi
    done
    if ((${#to_install[@]} > 0)); then
        sudo apt-get install -y "${to_install[@]}"
    fi
}

installPip() {
    for package in "$@"; do
        if pip3 list 2>/dev/null | grep -qF "$package"; then
            silly "$package installed, moving on..."
        else
            pip3 install "$package"
        fi
    done
}

installGem() {
    for package in "$@"; do
        if gem list 2>/dev/null | grep -qF "$package"; then
            silly "$package installed, moving on..."
        else
            sudo gem install "$package"
        fi
    done
}

installGo() {
    for package in "$@"; do
        if go list -m "$package" &>/dev/null; then
            silly "$package installed, moving on..."
        else
            go install "$package"
        fi
    done
}

installSnap() {
    for package in "$@"; do
        if snap list 2>/dev/null | grep -qF "$package"; then
            silly "$package installed, moving on..."
        else
            sudo snap install "$package" --classic
        fi
    done
}

installGnomeShellEx() {
    local script="$INSTALL_DIR/utils/install-gnome-shell.sh"
    [[ -x "$script" ]] || return 1
    for id in "$@"; do
        if gnome-extensions list 2>/dev/null | grep -qF "$id"; then
            silly "$id installed, moving on..."
        else
            "$script" -o "$id"
        fi
    done
}

installDeb() {
    mkdir -p "$TEMP_INSTALL_DIR"
    for url in "$@"; do
        base=$(basename "$url")
        file=$(printf '%b' "${base//%/\\x}")
        source_file="$TEMP_INSTALL_DIR/$file"
        if [[ ! -f "$source_file" ]]; then
            wget -P "$TEMP_INSTALL_DIR" "$url"
        fi
        sudo dpkg -i "$source_file"
    done
}

installSh() {
    mkdir -p "$TEMP_INSTALL_DIR"
    for url in "$@"; do
        base=$(basename "$url")
        file=$(printf '%b' "${base//%/\\x}")
        source_file="$TEMP_INSTALL_DIR/$file"
        if [[ ! -f "$source_file" ]]; then
            wget -P "$TEMP_INSTALL_DIR" "$url"
        fi
        bash "$source_file"
    done
}

# install(): single call with all packages (batch). Other funcs: one call per package (for per-item log).
tryInstall() {
    local func_name="$1"
    shift
    if [[ "$func_name" == "install" ]]; then
        info "Installing $* ..."
        if "$func_name" "$@"; then
            : "ok"
        else
            error "Install failed for one or more packages."
            return 1
        fi
    else
        for package in "$@"; do
            if info "Installing $package!" && "$func_name" "$package"; then
                : "ok"
            else
                error "Install $package failed!"
                return 1
            fi
        done
    fi
}
