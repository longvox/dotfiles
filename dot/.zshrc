
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
if [ -e ~/.zsh/zsh_files/exports.zsh ]; then
     source ~/.zsh/zsh_files/exports.zsh
fi

# Load the Aliases file
if [ -e ~/.zsh/zsh_files/aliases.zsh ]; then
     source ~/.zsh/zsh_files/aliases.zsh
fi

# Load the Functions file
if [ -e ~/.zsh/zsh_files/functions.zsh ]; then
     source ~/.zsh/zsh_files/functions.zsh
fi

# Load the Tmux file
if [ -e ~/.zsh/zsh_files/tmux.zsh ]; then
     source ~/.zsh/zsh_files/tmux.zsh
fi

source ~/.oh-my-zsh/oh-my-zsh.sh

eval "$(starship init zsh)"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2025-06-12 15:19:11
export PATH="$PATH:/home/imlong/.local/bin"
