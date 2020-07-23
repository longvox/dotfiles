# Setup fzf
# ---------
if [[ ! "$PATH" == "/home/$(whoami)/.dotfiles/.fzf/bin" ]]; then
  export PATH="${PATH:+${PATH}:}/home/$(whoami)/.dotfiles/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$(whoami)/.dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/$(whoami)/.dotfiles/.fzf/shell/key-bindings.bash"
