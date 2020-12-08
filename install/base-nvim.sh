#!/usr/bin/env bash
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/log.sh
source $(dirname "$(readlink -f "$BASH_SOURCE")")/utils/install.sh

tryInstall install curl
tryInstall install wget
tryInstall install ranger 
tryInstall install caca-utils 
tryInstall install highlight 
tryInstall install atool 
tryInstall install w3m 
tryInstall install poppler-utils 
tryInstall install mediainfo

# Überzug is a command line util which allows to draw images on terminals by using child windows.
tryInstall installPip ueberzug
tryInstall installPip neovim-remote
tryInstall installPip pynvim

# ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern.
tryInstall install ripgrep

# A code searching tool similar to ack, with a focus on speed
tryInstall install silversearcher-ag

# A simple, fast and user-friendly alternative to 'find'
tryInstall install fd-find

# install ndcu
tryInstall isntall ncdu

# lazygit: simple terminal UI for git commands
tryInstall install lazygit

# lazydocker: The lazier way to manage everything docker
tryInstall installSh https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
