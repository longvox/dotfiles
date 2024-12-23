source "$HOME/.zsh/spaceship/spaceship.zsh"

plugins=(
    git
    docker
    zsh-autosuggestions
    history-substring-search
    zsh-completions
    zsh-syntax-highlighting
    zsh-nvm
    nx-completion
)

# running ~/.profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# running vg
command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"

# Load the exports file
if [ -e ~/.dotfiles/zsh/zsh_files/exports.zsh ]; then
     source ~/.dotfiles/zsh/zsh_files/exports.zsh
fi

# Load the Valiables file
if [ -e ~/.dotfiles/zsh/zsh_files/variables.zsh ]; then
     source ~/.dotfiles/zsh/zsh_files/variables.zsh
fi

# Load the Aliases file
if [ -e ~/.dotfiles/zsh/zsh_files/aliases.zsh ]; then
     source ~/.dotfiles/zsh/zsh_files/aliases.zsh
fi

# Load the Functions file
if [ -e ~/.dotfiles/zsh/zsh_files/functions.zsh ]; then
     source ~/.dotfiles/zsh/zsh_files/functions.zsh
fi

# Load the Tmux file
if [ -e ~/.dotfiles/zsh/zsh_files/tmux.zsh ]; then
     source ~/.dotfiles/zsh/zsh_files/tmux.zsh
fi

# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
