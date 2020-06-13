# Setup fzf
# ---------
if [[ ! "$PATH" == */home/imlong/.dotfiles/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/imlong/.dotfiles/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/imlong/.dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/imlong/.dotfiles/.fzf/shell/key-bindings.bash"
