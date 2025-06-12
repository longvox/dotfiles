#!/bin/zsh

log_error() {
  echo "[ERROR] $1" >&2
}

# --- Load dotenv ---
set -a
ENV_FILE="$HOME/.dotfiles/.env"
[[ -f "$ENV_FILE" ]] && source "$ENV_FILE" || log_error "$ENV_FILE not found"
set +a

# --- Base PATH setup ---
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

prepend_path() {
  [[ -d "$1" ]] && PATH="$1:$PATH"
}

append_path() {
  [[ -d "$1" ]] && PATH="$PATH:$1"
}

prepend_path "$HOME/.local/custom/bin"

# --- Go ---
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
append_path "$GOROOT/bin"
append_path "$GOBIN"

# --- Java ---
if [[ -d "/usr/lib/jvm/default-java" ]]; then
  export JAVA_HOME="/usr/lib/jvm/default-java"
elif [[ -d "/usr/lib/jvm/java-11-openjdk-amd64" ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
elif command -v java &>/dev/null; then
  export JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")"
else
  log_error "Java not found"
fi
append_path "$JAVA_HOME/bin"

# --- Node (nvm, bun, pnpm) ---
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" || log_error "nvm.sh not found"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion" || log_error "bash_completion not found"

export BUN_INSTALL="$HOME/.bun"
append_path "$BUN_INSTALL/bin"

append_path "/snap/bin"

export PNPM_HOME="$HOME/.local/share/pnpm"
prepend_path "$PNPM_HOME"

# --- Other Tools ---
append_path "$HOME/.cargo/bin"
append_path "$HOME/.composer/vendor/bin"
append_path "$HOME/.config/composer/vendor/bin"
append_path "$HOME/.juliaup/bin"
append_path "$HOME/.local/share/bob/nvim-bin"
append_path "$HOME/.npm-global/bin"
prepend_path "$HOME/bin"
append_path "/usr/local/ruby/bin"

# --- Docker ---
if command -v docker &>/dev/null; then
  export DOCKER_HOST_IP=$(docker network inspect bridge 2>/dev/null | grep Gateway | grep -o -E '[0-9.]+' || log_error "Failed to get Docker bridge IP")
fi

# --- Ollama ---
export OLLAMA_ORIGINS='*'

# --- Android ---
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
prepend_path "$ANDROID_SDK_ROOT/cmdline-tools/bin"
prepend_path "$ANDROID_SDK_ROOT/platform-tools"

# --- Flutter ---
append_path "/opt/flutter/bin"

# --- Locale ---
export LANG="en_US.UTF-8"

# --- Zsh + Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh" || log_error "oh-my-zsh.sh not found"

# --- Conda ---
if [[ -d "$HOME/anaconda3" ]]; then
  if ! eval "$("$HOME/anaconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"; then
    if [[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]]; then
      source "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
      prepend_path "$HOME/anaconda3/bin"
    fi
  fi
fi

# --- SDKMAN ---
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh" || log_error "sdkman-init.sh not found"

# --- Autojump ---
[[ -s "$HOME/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME/.autojump/etc/profile.d/autojump.sh" || log_error "autojump.sh not found"

# --- Zsh Completion ---
autoload -U compinit && compinit -u

# --- FZF default command ---
if command -v rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
elif command -v ag &>/dev/null; then
  export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
else
  log_error "Neither rg nor ag found for FZF"
fi
