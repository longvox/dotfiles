# Setup fzf
# ---------
if [[ ! "$PATH" == */home/longvh/.dotfiles/symlinks/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/longvh/.dotfiles/symlinks/.fzf/bin"
fi

source <(fzf --zsh)
