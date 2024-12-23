#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

tryInstall install \
    curl           \
    wget           \
    ranger         \
    caca-utils     \
    highlight      \
    atool          \
    w3m            \
    poppler-utils  \
    mediainfo

tryInstall installPip spotify-cli-linux

# Überzug is a command line util which allows to draw images on terminals by using child windows.
tryInstall installPip \
    pynvim

# ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern.
tryInstall install ripgrep

# A code searching tool similar to ack, with a focus on speed
# tryInstall install silversearcher-ag

# A simple, fast and user-friendly alternative to 'find'
# tryInstall install fd-find

# install ndcu
# tryInstall install ncdu

# lazygit: simple terminal UI for git commands
# tryInstall install lazygit

# lazydocker: The lazier way to manage everything docker
tryInstall installSh https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
