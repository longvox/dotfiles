# Setup fzf
# ---------
if [[ ! "$PATH" == */home/longvh/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/longvh/.fzf/bin"
fi

source <(fzf --zsh)
