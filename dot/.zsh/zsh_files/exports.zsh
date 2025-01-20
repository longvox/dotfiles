# Environment variables
export $(xargs < ~/.dotfiles/.env)

# Core paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH="$HOME/.local/custom/bin:$PATH"

# Programming languages
# Go
export GOPATH=$HOME/go
export GOROOT=$GOPATH
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN

# Java
export JAVA_HOME="/usr/lib/jvm/default-java"
export PATH=$PATH:$JAVA_HOME/bin

# Package managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
export PATH=$PATH:$BUN_INSTALL/bin
export PATH=$PATH:/snap/bin

export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# Tools and utilities
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.juliaup/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.npm-global/bin

# Docker
export DOCKER_HOST_IP=$(docker network inspect bridge | grep Gateway | grep -o -E '[0-9.]+')

# Ollama
export OLLAMA_ORIGINS='*'

# Android
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# flutter
export PATH="$PATH:/opt/flutter/bin"
